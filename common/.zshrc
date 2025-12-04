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

export EDITOR='nvim'
export VISUAL='nvim'

# Compilation flags
export ARCHFLAGS="-arch $(uname -m)"

# zstyle :compinstall flename '/home/san/.zshrc'
autoload -Uz compinit
compinit

source ~/resources/custom/variables.zsh
source ~/resources/custom/aliases.zsh
source ~/resources/config/history.zsh
source ~/resources/custom/colors.zsh
source ~/resources/custom/ls-colors.zsh
source ~/resources/custom/PS1.zsh
source ~/resources/custom/keys.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/resources/custom/theme-highlight.zsh

# Daily Briefing (SRE Dashboard)
if [ -f "$HOME/dotfiles/common/resources/scripts/daily_briefing.sh" ]; then
    source "$HOME/dotfiles/common/resources/scripts/daily_briefing.sh"
fi