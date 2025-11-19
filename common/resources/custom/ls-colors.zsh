# ~/resources/custom/colors.zsh

# --- Configuração de Cores para o comando 'ls' (LS_COLORS) ---
# Versão segura para Zsh que evita problemas de "bad substitution".

# Primeiro, obtemos as definições padrão do sistema.
eval "$(dircolors)"

# Agora, definimos nossas customizações da paleta Aura em um array.
# Desta forma, o Zsh não tenta expandir os asteriscos (*).
local aura_lscolors=(
    "di=01;35"  # Diretórios -> Roxo (magenta) e negrito
    "ln=01;32"  # Links simbólicos -> Verde e negrito
    "ex=01;33"  # Executáveis -> Laranja (amarelo) e negrito
    "so=01;31"  # Sockets -> Vermelho
    "pi=01;36"  # Pipes (FIFO) -> Rosa (ciano)
    "bd=01;34"  # Block devices -> Azul
    "cd=01;34"  # Char devices -> Azul

    # Cores por extensão de arquivo (aqui está a correção)
    "*.tar=31"  # Arquivos compactados -> Vermelho
    "*.zip=31"
    "*.rar=31"
    "*.gz=31"
    "*.jpg=36"  # Imagens -> Rosa (ciano)
    "*.png=36"
    "*.gif=36"
    "*.mp3=34"  # Mídia -> Azul
    "*.mp4=34"
    "*.mkv=34"
)

# Finalmente, juntamos nosso array com ":" e o adicionamos à variável LS_COLORS.
export LS_COLORS="$LS_COLORS:${(j|:|)aura_lscolors}"

# Removemos a variável temporária para não poluir o ambiente.
unset aura_lscolors

## ~/resources/custom/colors.zsh
#
## --- Configuração de Cores para o comando 'ls' (LS_COLORS) ---
## Usa os nomes das cores, que o terminal 'foot' já mapeou para a paleta Aura.
#
## Usamos o comando 'dircolors' para gerar a variável.
## Primeiro, obtemos as definições padrão.
#eval "$(dircolors)"
#
## Agora, sobrescrevemos com as cores do Aura Theme.
## Formato: tipo_de_arquivo=atributos;cor_de_frente;cor_de_fundo
## Atributos: 00=normal, 01=bold, 04=underline
#export LS_COLORS="$LS_COLORS:di=01;35"  # Diretórios -> Roxo (magenta) e negrito
#export LS_COLORS="$LS_COLORS:ln=01;32"  # Links simbólicos -> Verde e negrito
#export LS_COLORS="$LS_COLORS:ex=01;33"  # Executáveis -> Laranja (amarelo) e negrito
#export LS_COLORS="$LS_COLORS:so=01;31"  # Sockets -> Vermelho
#export LS_COLORS="$LS_COLORS:pi=01;36"  # Pipes (FIFO) -> Rosa (ciano)
#export LS_COLORS="$LS_COLORS:bd=01;34"  # Block devices -> Azul
#export LS_COLORS="$LS_COLORS:cd=01;34"  # Char devices -> Azul
#
## Cores por extensão de arquivo
#export LS_COLORS="$LS_COLORS:*.tar=31"      # Arquivos compactados -> Vermelho
#export LS_COLORS="$LS_COLORS:*.zip=31"
#export LS_COLORS="$LS_COLORS:*.rar=31"
#export LS_COLORS="$LS_COLORS:*.gz=31"
#export LS_COLORS="$LS_COLORS:*.jpg=36"      # Imagens -> Rosa (ciano)
#export LS_COLORS="$LS_COLORS:*.png=36"
#export LS_COLORS="$LS_COLORS:*.gif=36"
#export LS_COLORS="$LS_COLORS:*.mp3=34"      # Mídia -> Azul
#export LS_COLORS="$LS_COLORS:*.mp4=34"
#export LS_COLORS="$LS_COLORS:*.mkv=34"
