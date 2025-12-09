import unittest
import sys
import os

# Add parent directory to path
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from utils.colors import hex_to_rgb_tuple, hex_to_rgb_semicolon

class TestUtils(unittest.TestCase):
    def test_hex_to_rgb_tuple_valid(self):
        self.assertEqual(hex_to_rgb_tuple("#FF0000"), (255, 0, 0))
        self.assertEqual(hex_to_rgb_tuple("#00FF00"), (0, 255, 0))
        self.assertEqual(hex_to_rgb_tuple("#0000FF"), (0, 0, 255))
        self.assertEqual(hex_to_rgb_tuple("#FFFFFF"), (255, 255, 255))
        self.assertEqual(hex_to_rgb_tuple("#000000"), (0, 0, 0))

    def test_hex_to_rgb_tuple_short(self):
        # If implementation supports #RGB
        self.assertEqual(hex_to_rgb_tuple("#F00"), (255, 0, 0))

    def test_hex_to_rgb_tuple_invalid(self):
        # Should default to white (255, 255, 255) safely
        self.assertEqual(hex_to_rgb_tuple("invalid"), (255, 255, 255))
        self.assertEqual(hex_to_rgb_tuple(None), (255, 255, 255))
        self.assertEqual(hex_to_rgb_tuple("#ZZZZZZ"), (255, 255, 255))

    def test_hex_to_rgb_semicolon(self):
        self.assertEqual(hex_to_rgb_semicolon("#FF0000"), "255;0;0")
        self.assertEqual(hex_to_rgb_semicolon("#00FF00"), "0;255;0")

if __name__ == '__main__':
    unittest.main()
