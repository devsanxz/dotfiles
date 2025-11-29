# ~/.zshrc

# --- Paleta de Cores Global (SSOT - Baseado em myColors.conf) ---
# Usando os códigos hex exatos para 100% de fidelidade ao tema.

# Âncoras
export c0="#000000"         # Preto
export c_white="#FFFFFF"    # Branco

# Ciclo Arco-Íris
export c1="#DD55FF"         # Violeta
export c2="#FFAA55"         # Laranja
export c3="#FFFF55"         # Amarelo
export c4="#55FF55"         # Verde
export c5="#55DDFF"         # Ciano
export c6="#5555FF"         # Azul
export c7="#9955FF"         # Anil
export c_red="#FF5555"      # Vermelho

# Interface (UI)
export ui_bg="#110011"      # Fundo Pílula (usado como fundo principal)
export ui_border="#440044"  # Borda Pílula (usado para detalhes)

# --- Mapeamento ANSI Final ---
# 0-7: Cores Normais
export color0=$c0
export color1=$c_red
export color2=$c4
export color3=$c3
export color4=$c6
export color5=$c1
export color6=$c5
export color7=$c_white # Usamos c_white como foreground padrão para contraste

# 8-15: Cores Brilhantes (Aura - tons mais claros ou variantes)
export color8=$ui_border    # Usamos ui_border para um "preto brilhante" mais suave
export color9=$c_red        # Bright Red (mesmo que normal red para manter intensidade)
export color10=$c4          # Bright Green
export color11=$c3          # Bright Yellow
export color12=$c6          # Bright Blue
export color13=$c1          # Bright Magenta (Violeta)
export color14=$c5          # Bright Cyan
export color15=$c_white     # Bright White

# --- Fundo e Texto Principal para prompt/outros ---
export background=$ui_bg
export foreground=$c_white