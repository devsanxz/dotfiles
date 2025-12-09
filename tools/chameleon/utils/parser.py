def parse_yaml(file_path):
    """
    A simple, dependency-free YAML parser for flat or slightly nested dictionaries.
    Designed specifically for SANXZ theme structure (meta, palette, semantic, ui).
    
    Returns a dictionary with keys: 'meta', 'palette', 'semantic', 'ui'.
    """
    data = {
        'meta': {}, 
        'palette': {}, 
        'semantic': {}, 
        'ui': {}
    }
    current_section = None
    
    try:
        with open(file_path, 'r') as f:
            for line in f:
                line = line.strip()
                
                # Skip empty lines and full-line comments
                if not line or line.startswith('#'):
                    continue
                
                # Detect section headers (e.g., "palette:")
                if line.endswith(':'):
                    potential_section = line[:-1]
                    if potential_section in data:
                        current_section = potential_section
                    else:
                        # Handle unknown sections or nested keys gracefully if needed
                        # For now, we strictly parse known top-level sections
                        current_section = None 
                    continue
                
                # Detect key-value pairs within a section
                if current_section and ':' in line:
                    parts = line.split(':', 1)
                    key = parts[0].strip()
                    raw_value = parts[1].strip()
                    
                    value = raw_value
                    
                    # Robust extraction for quoted values
                    if raw_value.startswith('"'):
                        # Find the closing quote index
                        end_quote = raw_value.find('"', 1)
                        if end_quote != -1:
                            value = raw_value[1:end_quote]
                    elif raw_value.startswith("'"):
                        end_quote = raw_value.find("'", 1)
                        if end_quote != -1:
                            value = raw_value[1:end_quote]
                    else:
                        # No quotes? Just strip comments
                        # We split by " #" to avoid breaking hex colors like #FF0000
                        # This assumes comments are preceded by a space, which is standard.
                        if ' #' in raw_value:
                            value = raw_value.split(' #')[0].strip()
                        else:
                            # Verify if there is a '#' inside that is NOT at the start (e.g. value#comment)
                            # Though strict YAML requires space, we can be lenient or strict.
                            # Let's be safe: if it starts with #, take the first word.
                            if raw_value.startswith('#') and ' ' in raw_value:
                                 value = raw_value.split(' ')[0].strip()
                            else:
                                 value = raw_value.strip()
                    
                    data[current_section][key] = value
                    
    except FileNotFoundError:
        print(f"Error: File {file_path} not found.")
        return None
    except Exception as e:
        print(f"Error parsing {file_path}: {e}")
        return None
                
    return data
