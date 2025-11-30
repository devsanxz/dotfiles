alias Dot='cd ~/dotfiles' 
alias Code='cd ~/code'

alias -g Help="--help"
alias -g Hist="history 1 | grep -i"

alias ls='eza --classify=always --colour=always --colour-scale=all --colour-scale-mode=gradient --icons=always'
alias lt='eza --tree --classify=always --colour=always --colour-scale=all --colour-scale-mode=gradient --icons=always'
alias lst='eza -T --smart-group --header --total-size --no-user --no-time --classify=always --colour=always --colour-scale=all --colour-scale-mode=gradient --icons=always'

alias '$ '='sudo '

alias snes='snes9x -conf /home/san/.snes9x/snes9x.conf -xvideo -soundsync'
