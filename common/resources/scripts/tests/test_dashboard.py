#!/usr/bin/env python3
import unittest
from unittest.mock import patch, MagicMock
import sys
import os

# Add parent directory to path to import dashboard_manager
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

import dashboard_manager

class TestDashboardManager(unittest.TestCase):
    
    def test_geometry_full_hd(self):
        """Test calculation for 1920x1080 (Raspberry Pi)"""
        W, H = 1920, 1080
        
        # Logic extracted from main script logic
        k = W // 3      # 640
        j = W - k       # 1280
        m = H // 3      # 360
        l = H - m       # 720
        
        self.assertEqual(k, 640)
        self.assertEqual(j, 1280)
        self.assertEqual(m, 360)
        self.assertEqual(l, 720)
        self.assertEqual(j + k, W)
        self.assertEqual(l + m, H)

    def test_geometry_hd_plus(self):
        """Test calculation for 1600x900 (Notebook)"""
        W, H = 1600, 900
        
        k = W // 3      # 533
        j = W - k       # 1067
        m = H // 3      # 300
        l = H - m       # 600
        
        self.assertEqual(k, 533)
        self.assertEqual(j, 1067)
        self.assertEqual(m, 300)
        self.assertEqual(l, 600)
        self.assertEqual(j + k, W)

    def test_geometry_4k(self):
        """Test calculation for 3840x2160 (Future Proof)"""
        W, H = 3840, 2160
        
        k = W // 3      # 1280
        j = W - k       # 2560
        m = H // 3      # 720
        l = H - m       # 1440
        
        self.assertEqual(k, 1280) # k should be 1/3
        self.assertEqual(j, 2560) # j should be 2/3
        self.assertEqual(j, 2 * k) # Ratio Check

    @patch('dashboard_manager.hyprctl')
    @patch('dashboard_manager.run_cmd')
    @patch('dashboard_manager.get_active_monitor_res')
    @patch('time.sleep') # Skip sleeps
    @patch('subprocess.run') # Notify
    def test_execution_flow(self, mock_notify, mock_sleep, mock_res, mock_cmd, mock_hyprctl):
        """Test if correct rules are generated and apps launched"""
        # Mock Resolution
        mock_res.return_value = (1920, 1080)
        
        dashboard_manager.main()
        
        # 1. Check workspace switch
        mock_hyprctl.assert_any_call("dispatch workspace 2")
        
        # 2. Check rule injection (sampling some calls)
        # YouTube should be size 1280 720
        expected_rule_yt = 'keyword windowrule "size 1280 720, title:^(YouTube)(.*)$"'
        mock_hyprctl.assert_any_call(expected_rule_yt)
        
        # Chromium should be move 1280 0
        expected_rule_chrome = 'keyword windowrule "move 1280 0, ^(chromium)$"'
        mock_hyprctl.assert_any_call(expected_rule_chrome)
        
        # 3. Check App Launch
        self.assertEqual(mock_cmd.call_count, 4) # 4 apps

if __name__ == '__main__':
    unittest.main()
