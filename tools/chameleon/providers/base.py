import os
import shutil
from abc import ABC, abstractmethod
from pathlib import Path

class ThemeProvider(ABC):
    """
    Abstract base class for all application theme providers.
    """

    def __init__(self, dry_run=False):
        self.dry_run = dry_run

    @property
    @abstractmethod
    def name(self) -> str:
        """Return the display name of the provider (e.g., 'Hyprland')."""
        pass

    @abstractmethod
    def get_config_path(self) -> Path:
        """Return the path where the generated config file should be saved."""
        pass

    @abstractmethod
    def get_main_config_path(self) -> Path:
        """Return the path to the user's main config file (e.g., hyprland.conf)."""
        pass
    
    @property
    def include_format(self) -> str:
        """
        Return the template string for including a file. 
        Use {path} as placeholder.
        Example: "source = {path}"
        """
        return ""

    def is_available(self) -> bool:
        """
        Check if the application is installed or the config directory exists.
        Default implementation checks if the executable is in PATH.
        Override if a more complex check is needed.
        """
        # Simple check: assumes the provider name roughly matches the binary name
        # Providers can override this logic.
        binary = self.name.lower().split()[0] 
        return shutil.which(binary) is not None

    @abstractmethod
    def generate_content(self, theme_data: dict) -> str:
        """
        Generate the content string for the config file based on the theme data.
        """
        pass
    
    def check_integration(self):
        """Checks if the main config file sources the theme and offers to fix it."""
        if self.dry_run: 
            return

        try:
            main_conf = self.get_main_config_path()
            theme_conf = self.get_config_path()
            
            if not main_conf.exists():
                return

            # Check if already included (naive check)
            is_included = False
            with open(main_conf, 'r') as f:
                content = f.read()
                # Check for full path or filename
                if str(theme_conf) in content or theme_conf.name in content:
                    is_included = True

            if not is_included:
                print(f"⚠️  [{self.name}] Theme file is NOT included in {main_conf.name}.")
                include_line = self.include_format.format(path=theme_conf)
                print(f"   Required line: {include_line}")
                
                # Interaction
                try:
                    choice = input(f"   >> Append this line automatically? [y/N] ").strip().lower()
                except EOFError:
                    choice = 'n' # Handle non-interactive environments
                
                if choice == 'y':
                    # Create backup first? Maybe overkill for a one-liner append.
                    with open(main_conf, 'a') as f:
                        f.write(f"\n# Chameleon Theme Integration\n")
                        f.write(include_line + "\n")
                    print(f"   ✅ Appended include to {main_conf.name}")
                else:
                    print(f"   ℹ️  Skipping auto-integration. Remember to add it manually!")
        except Exception as e:
            print(f"   [Warning] Integration check failed for {self.name}: {e}")

    def apply(self, theme_data: dict):
        """
        Orchestrates the application of the theme:
        1. Generate content
        2. Write to file (if not dry run)
        3. Check integration (if not dry run)
        4. Reload application (if not dry run)
        """
        content = self.generate_content(theme_data)
        target_path = self.get_config_path()

        print(f"[{self.name}] Generating config for {target_path}...")
        
        if self.dry_run:
            print(f"--- [DRY RUN] Content for {self.name} ---")
            print(content)
            print("---------------------------------------")
        else:
            # Ensure parent directory exists
            target_path.parent.mkdir(parents=True, exist_ok=True)
            
            with open(target_path, 'w') as f:
                f.write(content)
            print(f"[{self.name}] Config written.")
            
            self.check_integration()
            self.reload()

    def reload(self):
        """
        Reload the application configuration.
        Default implementation does nothing.
        """
        pass
