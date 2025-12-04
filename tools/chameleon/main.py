#!/usr/bin/env python3
import argparse
import sys
from pathlib import Path
from utils.parser import parse_yaml
from providers.hyprland import HyprlandProvider
from providers.foot import FootProvider
from providers.zsh import ZshProvider

# Providers will be imported here
# from providers.hyprland import HyprlandProvider

def get_theme_path(theme_name, base_dir):
    """Resolves the theme YAML file path."""
    # Relative path to dotfiles/common/resources/colors
    theme_file = base_dir.resolve().parents[1] / "common/resources/colors" / f"{theme_name}.yaml"
    return theme_file

def list_themes(base_dir):
    """Lists available theme YAML files."""
    colors_dir = base_dir.resolve().parents[1] / "common/resources/colors"
    if not colors_dir.exists():
        print(f"Error: Theme directory not found at {colors_dir}")
        return

    print("Available themes:")
    for f in colors_dir.glob("*.yaml"):
        print(f" - {f.stem}")

def main():
    parser = argparse.ArgumentParser(description="Chameleon 🦎 - Universal Theme Switcher")
    parser.add_argument('action', choices=['apply', 'list'], help="Action to perform")
    parser.add_argument('theme', nargs='?', help="Name of the theme (required for 'apply')")
    parser.add_argument('--dry-run', action='store_true', help="Preview changes without writing to disk")
    parser.add_argument('--apps', help="Comma-separated list of apps to update (e.g., 'hyprland,foot'). Default: all detected.")
    
    args = parser.parse_args()
    base_dir = Path(__file__).parent
    
    if args.action == 'list':
        list_themes(base_dir)
        return

    if args.action == 'apply':
        if not args.theme:
            print("Error: You must specify a theme name to apply.")
            print("Usage: python main.py apply <theme_name>")
            sys.exit(1)
            
        theme_path = get_theme_path(args.theme, base_dir)
        
        if not theme_path.exists():
            print(f"Error: Theme '{args.theme}' not found.")
            print(f"Searched in: {theme_path}")
            sys.exit(1)
            
        print(f"🎨 Loading theme: {args.theme}")
        theme_data = parse_yaml(theme_path)
        
        if not theme_data:
            sys.exit(1)

        print(f"   Title: {theme_data['meta'].get('name', 'Unknown')}")
        print(f"   Type:  {theme_data['meta'].get('type', 'Unknown')}")
        print("-" * 40)

        # TODO: Initialize Providers
        providers = []
        providers.append(HyprlandProvider(args.dry_run))
        providers.append(FootProvider(args.dry_run))
        providers.append(ZshProvider(args.dry_run))
        
        # Filter providers if --apps arg is present
        if args.apps:
            target_apps = [app.strip().lower() for app in args.apps.split(',')]
            providers = [p for p in providers if p.name.lower() in target_apps]

        if not providers:
            print("No providers configured (or filtered out).")
        
        for provider in providers:
            if provider.is_available():
                provider.apply(theme_data)
            else:
                print(f"⏭️  Skipping {provider.name} (Not detected)")

if __name__ == "__main__":
    main()
