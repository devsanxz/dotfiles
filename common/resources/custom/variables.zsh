# export GRIM_DEFAULT_DIR=~/Images/ss/ # MOVED TO HYPRLAND.CONF

# --- API KEYS (Load Securely) ---
# Carrega a chave do Gemini se o arquivo existir
if [[ -f "$HOME/resources/keys/googleapi.txt" ]]; then
    export GEMINI_API_KEY=$(cat "$HOME/resources/keys/googleapi.txt" | tr -d '\n')
fi