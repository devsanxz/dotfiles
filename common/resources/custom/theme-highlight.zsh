# ~/.config/zsh/plugins.zsh
# Contém APENAS as CONFIGURAÇÕES para os plugins.
# O carregamento dos plugins é feito diretamente no ~/.zshrc.

# --- Configuração de Estilos para zsh-syntax-highlighting ---
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[command]="fg=${AURA_HEX_PURPLE},bold"
ZSH_HIGHLIGHT_STYLES[alias]="fg=${AURA_HEX_PURPLE},bold"
ZSH_HIGHLIGHT_STYLES[path]="fg=${AURA_HEX_GREEN}"
ZSH_HIGHLIGHT_STYLES[string]="fg=${AURA_HEX_BLUE}"
ZSH_HIGHLIGHT_STYLES[variable]="fg=${AURA_HEX_ORANGE}"
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=${AURA_HEX_RED},bold"
ZSH_HIGHLIGHT_STYLES[default]="fg=${AURA_HEX_WHITE}"
