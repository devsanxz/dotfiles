# ~/.config/zsh/plugins.zsh (ou theme-highlight.zsh)
# Configuração de Estilos para zsh-syntax-highlighting usando Variáveis do Chameleon.

typeset -A ZSH_HIGHLIGHT_STYLES

# Comandos e Funções (Keyword - c13)
ZSH_HIGHLIGHT_STYLES[command]="fg=${c13_br_violet},bold"
ZSH_HIGHLIGHT_STYLES[alias]="fg=${c13_br_violet},bold"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=${c13_br_violet},bold"
ZSH_HIGHLIGHT_STYLES[function]="fg=${c13_br_violet},bold"

# Caminhos e Arquivos (Links - c12)
ZSH_HIGHLIGHT_STYLES[path]="fg=${c12_br_blue}"

# Strings e Texto Citado (Base Green - c02)
ZSH_HIGHLIGHT_STYLES[string]="fg=${c02_green}"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]="fg=${c02_green}"

# Variáveis e Opções (Warning/Attention - c11)
ZSH_HIGHLIGHT_STYLES[variable]="fg=${c11_br_yellow}"
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=${c11_br_yellow}"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=${c11_br_yellow}"

# Erros e Desconhecidos (Critical - c01)
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=${c01_red},bold"

# Padrão (Texto Secundário - c07)
ZSH_HIGHLIGHT_STYLES[default]="fg=${c07_white}"
