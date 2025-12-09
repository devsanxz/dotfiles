def hex_to_rgb_tuple(hex_color):
    """
    Converts a hex string (#RRGGBB) to a tuple (R, G, B).
    Returns (255, 255, 255) if invalid.
    """
    if not hex_color or not isinstance(hex_color, str):
        return (255, 255, 255)
    
    h = hex_color.lstrip('#')
    
    if len(h) != 6:
        # Handle short format #RGB if needed, or return default
        if len(h) == 3:
            h = "".join([c*2 for c in h])
        else:
            return (255, 255, 255)
            
    try:
        return tuple(int(h[i:i+2], 16) for i in (0, 2, 4))
    except ValueError:
        return (255, 255, 255)

def hex_to_rgb_semicolon(hex_color):
    """
    Converts #RRGGBB to R;G;B string format for ANSI/LS_COLORS.
    """
    r, g, b = hex_to_rgb_tuple(hex_color)
    return f"{r};{g};{b}"
