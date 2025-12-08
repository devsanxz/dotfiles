# Prompt Customizado (Dinâmico via Chameleon)

# Habilita substituição de variáveis no prompt
setopt PROMPT_SUBST

# %F{...} usa a variável exportada em colors.zsh
# User@Host: c13_br_violet (Verde Keyword/Roxo)
# Path: c12_br_blue (Verde Aqua/Azul)
# Char: c10_br_green (Verde Neon/Ciano)

PS1="%F{\${c13_br_violet}}%n@%m%f:%F{\${c12_br_blue}}%~%f %F{\${c10_br_green}}%#%f "
