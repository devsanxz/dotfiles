#!/bin/bash

# Configuração (Dados voláteis no Cache)
CACHE_DIR="$HOME/.cache/sanxz"
DATA_FILE="$CACHE_DIR/last_run.date"
TODO_FILE="$HOME/todo.md" # Pode ser customizado
TODAY=$(date +%Y-%m-%d)

mkdir -p "$CACHE_DIR"

# Cores SANXZ
VIOLET="\033[38;5;135m"
GREEN="\033[32m"
YELLOW="\033[33m"
RESET="\033[0m"

# Verifica se já rodou hoje
if [ -f "$DATA_FILE" ]; then
    LAST_RUN=$(cat "$DATA_FILE")
    if [ "$LAST_RUN" == "$TODAY" ]; then
        return 0 # Já rodou, sai silenciosamente
    fi
fi

# === O INÍCIO DO DIA ===
clear
echo -e "${VIOLET}=== SRE SANCHEZ DASHBOARD ===${RESET}"
echo -e "Data: $TODAY\n"

# 1. Exibir ToDos
if [ -f "$TODO_FILE" ]; then
    echo -e "${YELLOW}[ TAREFAS PENDENTES ]${RESET}"
    cat "$TODO_FILE"
    echo ""
else
    echo -e "${YELLOW}[ ! ] Crie um arquivo ~/todo.md para ver suas tarefas aqui.${RESET}\n"
fi

# 2. Manutenção do Sistema (Yay)
echo -e "${GREEN}[ MANUTENÇÃO ]${RESET}"
read -p "Deseja atualizar o sistema (yay -Syu)? [y/N] " response
if [[ "$response" =~ ^[yY]$ ]]; then
    echo "Iniciando atualização..."
    yay -Syu
else
    echo "Atualização pulada."
fi

# 3. Marca como rodado
echo "$TODAY" > "$DATA_FILE"
echo -e "\n${VIOLET}Tenha um dia produtivo.${RESET}"
echo "--------------------------------------------------"
