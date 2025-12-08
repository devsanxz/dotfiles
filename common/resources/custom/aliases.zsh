alias Dot='cd ~/dotfiles' 
alias Code='cd ~/code'

alias -g Help="--help"
alias -g Hist="history 1 | grep -i"

alias ls='eza --classify=always --colour=always --colour-scale=all --colour-scale-mode=gradient --icons=always'
alias lt='eza --tree --classify=always --colour=always --colour-scale=all --colour-scale-mode=gradient --icons=always'
alias lst='eza -T --smart-group --header --total-size --no-user --no-time --classify=always --colour=always --colour-scale=all --colour-scale-mode=gradient --icons=always'

alias '$'='sudo '

alias snes='snes9x -conf /home/san/.snes9x/snes9x.conf -xvideo -soundsync'
alias chameleon='python3 ~/dotfiles/tools/chameleon/main.py'

# Timer function
timer() {
    local duration=$1
    shift
    local message="${*:-Time is up!}"
    
    if [[ -z "$duration" ]]; then
        echo "Usage: timer <minutes> [message]"
        return 1
    fi

    echo "Timer set for $duration minutes."
    (sleep "${duration}m" && notify-send -u critical "⏳ Timer Finished" "$message" && paplay /usr/share/sounds/freedesktop/stereo/complete.oga 2>/dev/null) &
}