# --- Definição da Paleta (RGB TrueColor) ---
# Formato: 38;2;R;G;B

# Cores Sólidas (Base)
local c_dir="38;2;59;130;246"      # Blue (#3B82F6) -> Pastas
local c_link="38;2;34;211;238"     # Cyan (#22D3EE) -> Symlinks
local c_exec="38;2;34;197;94"      # Green (#22C55E) -> Executáveis
local c_zip="38;2;244;63;94"       # Red (#F43F5E) -> Arquivos Comprimidos
local c_dev="38;2;250;204;21"      # Yellow (#FACC15) -> Dispositivos
local c_media="38;2;168;85;247"    # Magenta (#A855F7) -> Mídia Principal

# Cores Aura (Pastel) - Substituindo o Branco
local c_doc="38;2;145;233;246"     # Cyan Bright (#91E9F6) -> Docs/Código
local c_cfg="38;2;253;230;138"     # Yellow Bright (#FDE68A) -> Configs
local c_aud="38;2;212;170;251"     # Magenta Bright (#D4AAFB) -> Áudio
local c_ign="38;2;100;116;139"     # Bright Black (#64748B) -> Ocultos/Ignorados

# Estilos
local bold="1"

# --- Construção do LS_COLORS ---

# 1. Básicos do Sistema (Começamos com export)
export LS_COLORS="di=${bold};${c_dir}:"    # Diretórios (Azul Forte)

# 2. Append (SEM export, apenas adicionando à variável existente)
LS_COLORS+="ln=${c_link}:"          # Links (Ciano Forte)
LS_COLORS+="so=${c_aud}:"           # Sockets
LS_COLORS+="pi=${c_dev}:"           # Pipes
LS_COLORS+="ex=${bold};${c_exec}:"  # Executáveis (Verde Forte)
LS_COLORS+="bd=${c_dev};7:"         # Block Device (Amarelo Invertido)
LS_COLORS+="cd=${c_dev};7:"         # Char Device

# 3. Arquivos Comprimidos
LS_COLORS+="*.tar=${c_zip}:*.tgz=${c_zip}:*.arc=${c_zip}:*.arj=${c_zip}:*.taz=${c_zip}:*.lha=${c_zip}:*.lz4=${c_zip}:*.zip=${c_zip}:*.z=${c_zip}:*.dz=${c_zip}:*.gz=${c_zip}:*.lrz=${c_zip}:*.lz=${c_zip}:*.lzo=${c_zip}:*.xz=${c_zip}:*.zst=${c_zip}:*.tzst=${c_zip}:*.bz2=${c_zip}:*.bz=${c_zip}:*.tbz=${c_zip}:*.tbz2=${c_zip}:*.tz=${c_zip}:*.deb=${c_zip}:*.rpm=${c_zip}:*.jar=${c_zip}:*.war=${c_zip}:*.ear=${c_zip}:*.sar=${c_zip}:*.rar=${c_zip}:*.alz=${c_zip}:*.ace=${c_zip}:*.zoo=${c_zip}:*.cpio=${c_zip}:*.7z=${c_zip}:*.rz=${c_zip}:*.cab=${c_zip}:*.wim=${c_zip}:*.swm=${c_zip}:*.dwm=${c_zip}:*.esd=${c_zip}:"

# 4. Mídia (Magenta/Lilith)
# Imagens e Vídeo
LS_COLORS+="*.jpg=${c_media}:*.jpeg=${c_media}:*.mjpg=${c_media}:*.mjpeg=${c_media}:*.gif=${c_media}:*.bmp=${c_media}:*.pbm=${c_media}:*.pgm=${c_media}:*.ppm=${c_media}:*.tga=${c_media}:*.xbm=${c_media}:*.xpm=${c_media}:*.tif=${c_media}:*.tiff=${c_media}:*.png=${c_media}:*.svg=${c_media}:*.svgz=${c_media}:*.mng=${c_media}:*.pcx=${c_media}:*.mov=${c_media}:*.mpg=${c_media}:*.mpeg=${c_media}:*.m2v=${c_media}:*.mkv=${c_media}:*.webm=${c_media}:*.ogm=${c_media}:*.mp4=${c_media}:*.m4v=${c_media}:*.mp4v=${c_media}:*.vob=${c_media}:*.qt=${c_media}:*.nuv=${c_media}:*.wmv=${c_media}:*.asf=${c_media}:*.rm=${c_media}:*.rmvb=${c_media}:*.flc=${c_media}:*.avi=${c_media}:*.fli=${c_media}:*.flv=${c_media}:*.gl=${c_media}:*.dl=${c_media}:*.xcf=${c_media}:*.xwd=${c_media}:*.yuv=${c_media}:*.cgm=${c_media}:*.emf=${c_media}:*.ogv=${c_media}:*.ogx=${c_media}:"

# Áudio (Magenta Aura)
LS_COLORS+="*.aac=${c_aud}:*.au=${c_aud}:*.flac=${c_aud}:*.m4a=${c_aud}:*.mid=${c_aud}:*.midi=${c_aud}:*.mka=${c_aud}:*.mp3=${c_aud}:*.mpc=${c_aud}:*.ogg=${c_aud}:*.ra=${c_aud}:*.wav=${c_aud}:*.oga=${c_aud}:*.opus=${c_aud}:*.spx=${c_aud}:*.xspf=${c_aud}:"

# 5. Configuração e Docs
LS_COLORS+="*.cfg=${c_cfg}:*.conf=${c_cfg}:*.ini=${c_cfg}:*.yml=${c_cfg}:*.yaml=${c_cfg}:*.toml=${c_cfg}:*.json=${c_cfg}:"
LS_COLORS+="*.c=${c_doc}:*.cpp=${c_doc}:*.py=${c_doc}:*.rb=${c_doc}:*.js=${c_doc}:*.ts=${c_doc}:*.rs=${c_doc}:*.go=${c_doc}:*.java=${c_doc}:*.sh=${c_doc}:*.zsh=${c_doc}:*.txt=${c_doc}:*.md=${c_doc}:"

# Aplica as cores ao menu de 'Tab' do ZSH também
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
