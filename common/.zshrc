# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
export HIST_STAMPS=%F

export MANPATH="/usr/local/man:$MANPATH"

# THE FOLLOWING LINES EXIST IN CASE NOT ALL YOUR MACHINES HAVE NVIM, SO IF YOU CONNECT TO THEM BY SSH THEY'LL WORK PROPERLLY;
#
# I'M CHANGING IT FOR MY ENVIRONMENT IS NVIM;
#
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

expor EDITOR='nvim'

# Compilation flags
export ARCHFLAGS="-arch $(uname -m)"

zstyle :compinstall flename '/home/san/.zshrc'
autoload -Uz compinit
compinit

export background="#0F172A"         
export foreground="#E2E8F0"         
export accent="#8B5CF6"             
export black="#1E293B"              
export red="#F43F5E"                
export green="#22C55E"              
export yellow="#FACC15"             
export blue="#3B82F6"               
export magenta="#A855F7"            
export cyan="#22D3EE"               
export white="#F1F5F9"               
export bg="#0F172A"                 
export color1="#E2E8F0"             
export color2="#8B5CF6"             
export color9="#F43F5E"             
export color4="#FACC15"             
export color5="#3B82F6"             
export color6="#A855F7"             
export color7="#22D3EE"             
export color8="#F1F5F9"

source ~/resources/custom/variables.zsh
source ~/resources/custom/aliases.zsh
source ~/resources/config/history.zsh
source ~/resources/custom/colors.zsh
source ~/resources/custom/ls-colors.zsh
source ~/resources/custom/PS1.zsh
#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/resources/custom/theme-highlight.zsh
