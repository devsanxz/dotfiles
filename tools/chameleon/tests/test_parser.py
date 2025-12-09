import unittest
import sys
import os
import tempfile
from pathlib import Path

# Add parent directory to path to import modules
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from utils.parser import parse_yaml

class TestParser(unittest.TestCase):
    def setUp(self):
        # Create a temporary file
        self.tmp_fd, self.tmp_path = tempfile.mkstemp(suffix='.yaml', text=True)
        content = """
meta:
  name: "Test Theme"
  author: "Tester"
  type: "dark"

palette:
  c00_black: "#000000"
  c01_red: '#FF0000' # Inline comment with single quotes
  c02_green: #00FF00 No quotes test

semantic:
  error: "#FF0000"

ui:
  background: "#123456"
"""
        with os.fdopen(self.tmp_fd, 'w') as f:
            f.write(content)

    def tearDown(self):
        # Clean up
        if os.path.exists(self.tmp_path):
            os.remove(self.tmp_path)

    def test_parse_yaml_structure(self):
        """Verifies basic structure parsing."""
        data = parse_yaml(self.tmp_path)
        self.assertIsNotNone(data)
        self.assertIn("meta", data)
        self.assertIn("palette", data)
        self.assertIn("semantic", data)
        self.assertIn("ui", data)

    def test_parse_yaml_values(self):
        """Verifies value extraction logic (quotes handling)."""
        data = parse_yaml(self.tmp_path)
        
        # Double quotes
        self.assertEqual(data['meta']['name'], "Test Theme")
        
        # Single quotes
        self.assertEqual(data['palette']['c01_red'], "#FF0000")
        
        # No quotes (with comment stripping)
        self.assertEqual(data['palette']['c02_green'], "#00FF00")

    def test_parse_yaml_missing_file(self):
        """Verifies error handling for missing files."""
        data = parse_yaml("non_existent_file.yaml")
        self.assertIsNone(data)

if __name__ == '__main__':
    unittest.main()
