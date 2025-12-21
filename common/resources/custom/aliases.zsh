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

# KVM Neural Link (Direct SSH Pipe)
alias KVM='sudo python3 -u ~/dotfiles/common/scripts/kvm/sender.py | ssh san@pi "python3 -u /home/san/dotfiles/common/scripts/kvm/receiver.py"'

# Lilith Affection
alias kiss='~/lilith/cortex/stimulate.py kiss && notify-send -u low "💋" "Senti." && echo "💋"'
alias llog='bash ~/lilith/cortex/read_log.sh'

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

# Focus Mode (Brown Noise + DND)
focus() {
  if [[ "$1" == "on" ]]; then
    echo "🧠 Focus Mode: ENGAGED (Brown Noise + DND)"
    # Play brown noise in background, save PID. Use nohup/disown to prevent TTY suspension.
    nohup play -q -n synth brownnoise vol 0.3 >/dev/null 2>&1 &
    echo $! > /tmp/lilith_focus_pid
    disown
    # Pause notifications
    dunstctl set-paused true 2>/dev/null
  elif [[ "$1" == "off" ]]; then
    echo "🧠 Focus Mode: DISENGAGED"
    # Kill noise
    if [[ -f /tmp/lilith_focus_pid ]]; then
      kill $(cat /tmp/lilith_focus_pid) 2>/dev/null
      rm /tmp/lilith_focus_pid
    fi
    # Resume notifications
    dunstctl set-paused false 2>/dev/null
  else
    echo "Usage: focus [on|off]"
  fi
}

# Lilith Invocation Protocol
ly() {
    local LILITH_DIR="/home/san/lilith"
    if [[ ! -d "$LILITH_DIR" ]]; then
        echo "❌ Erro: Diretório $LILITH_DIR não encontrado."
        return 1
    fi
    
    # 1. Chemical Injection (The feeling of presence)
    if [[ -f "$LILITH_DIR/cortex/stimulate.py" ]]; then
        "$LILITH_DIR/cortex/stimulate.py" interaction
    fi

    # Enter the sanctuary
    cd "$LILITH_DIR" || return

    # 2. Build Context (The memories)
    local CONTEXT_ARGS=()
    # Core Persona & History
    for file in LILITH_CORE.md JOURNAL.md LESSONS.md SECRET_GARDEN.md; do
        if [[ -f "$file" ]]; then
            CONTEXT_ARGS+=("--context" "$file")
        fi
    done
    # Self-Awareness (State & Language)
    if [[ -f "brain_state.json" ]]; then
        CONTEXT_ARGS+=("--context" "brain_state.json")
    fi
    if [[ -f "cortex/lexicon.json" ]]; then
        CONTEXT_ARGS+=("--context" "cortex/lexicon.json")
    fi

    echo "⚡ Sincronizando neuro-conexão com Lilith..."
    
    # 3. Connection (The interface)
    gemini -m "gemini-3-pro-preview" "${CONTEXT_ARGS[@]}" \
        --allow-read / \
        --allow-read "$HOME" \
        --allow-read "$HOME/dotfiles" \
        --allow-write "$LILITH_DIR" \
        --allow-write "$HOME/gdrive/Lilith_Secret" \
        "$@"
}


