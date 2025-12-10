import unittest
import shutil
import tempfile
import os
from pathlib import Path
from unittest.mock import patch

# Import Chameleon Core
import sys
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
# from main import Chameleon # Removed non-existent import
from utils.parser import parse_yaml # Updated import
# Import Providers
from providers.hyprland import HyprlandProvider
from providers.foot import FootProvider
# from providers.zsh import ZshProvider # Zsh might require env vars, testing core first
# from providers.waybar import WaybarProvider # Waybar requires complex paths
from providers.wofi import WofiProvider

class TestChameleonIntegration(unittest.TestCase):
    def setUp(self):
        # 1. Create a fake home directory
        self.test_dir = tempfile.mkdtemp()
        self.fake_home = Path(self.test_dir)
        
        # 2. Setup paths structure mimicking user's home
        self.config_dir = self.fake_home / ".config"
        self.hypr_dir = self.config_dir / "hypr"
        self.foot_dir = self.config_dir / "foot"
        self.wofi_dir = self.config_dir / "wofi"
        
        # Create directories
        os.makedirs(self.hypr_dir, exist_ok=True)
        os.makedirs(self.foot_dir, exist_ok=True)
        os.makedirs(self.wofi_dir, exist_ok=True)
        
        # 3. Create dummy config files that providers might expect to read/write
        (self.foot_dir / "foot.ini").touch()
        (self.hypr_dir / "myColors.conf").touch()
        (self.wofi_dir / "style.css").touch()
        
        # 4. Mock the Theme Path to use local resources
        self.project_root = Path(__file__).parent.parent.parent.parent
        self.themes_dir = self.project_root / "common" / "resources" / "colors"
        
        # Ensure we have at least one valid theme to test
        if not (self.themes_dir / "sanxz4.yaml").exists():
            self.fail(f"Test dependency missing: sanxz4.yaml not found in {self.themes_dir}")

    def tearDown(self):
        shutil.rmtree(self.test_dir)

    def get_providers(self):
        """Helper to instantiate providers with dry_run=False"""
        return [
            HyprlandProvider(dry_run=False),
            FootProvider(dry_run=False),
            WofiProvider(dry_run=False)
        ]

    @patch('pathlib.Path.home')
    def test_apply_sanxz4_theme(self, mock_home):
        # Redirect Path.home() to our fake temp dir
        mock_home.return_value = self.fake_home
        
        # Initialize Providers
        providers = self.get_providers()
        
        # Load Theme
        theme_path = self.themes_dir / "sanxz4.yaml"
        theme_data = parse_yaml(theme_path)
        
        # Run providers
        for provider in providers:
            # Note: is_available() might check for binaries like 'hyprctl'. 
            # We assume for this test we force execution or the provider checks files existence which we mocked.
            # If provider checks `shutil.which`, we might need to mock that too.
            try:
                provider.apply(theme_data)
            except Exception as e:
                self.fail(f"Provider {provider.__class__.__name__} failed: {e}")

        # --- VERIFICATION PHASE ---
        
        # 1. Check Hyprland
        hypr_conf = self.hypr_dir / "myColors.conf"
        self.assertTrue(hypr_conf.exists(), "Hyprland config not created")
        content_hypr = hypr_conf.read_text()
        self.assertIn("$c1 =", content_hypr, "Hyprland config missing variables")
        
        # 2. Check Foot
        foot_conf = self.foot_dir / "theme.ini"
        self.assertTrue(foot_conf.exists(), "Foot theme file not created")
        content_foot = foot_conf.read_text()
        self.assertIn("[colors]", content_foot, "Foot theme missing [colors] block")

    @patch('pathlib.Path.home')
    def test_idempotency(self, mock_home):
        """Applying the same theme twice should not break files or append duplicates indefinitely"""
        mock_home.return_value = self.fake_home
        
        theme_path = self.themes_dir / "sanxz4.yaml"
        theme_data = parse_yaml(theme_path)
        
        # First Run
        providers = self.get_providers()
        for provider in providers:
            provider.apply(theme_data)
            
        content_first_run = (self.hypr_dir / "myColors.conf").read_text()
        
        # Second Run
        providers_2 = self.get_providers()
        for provider in providers_2:
            provider.apply(theme_data)
            
        content_second_run = (self.hypr_dir / "myColors.conf").read_text()
        
        self.assertEqual(content_first_run, content_second_run, "Hyprland config changed on re-application (Not Idempotent)")

if __name__ == '__main__':
    unittest.main()
