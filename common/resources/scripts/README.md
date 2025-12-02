# Scripts de Automação SRE

Coleção de scripts utilitários para manutenção e produtividade do ambiente SANXZ.

## 🌞 daily_briefing.sh (O Dashboard Matinal)

Um script projetado para rodar automaticamente na primeira abertura de terminal do dia. Ele atua como um "briefing" para o operador.

### Funcionalidades
1.  **Verificação de Data:** Só roda uma vez por dia (usa `~/.cache/sanxz/last_run.date` para controle).
2.  **Gestão de Tarefas:** Lê e exibe o conteúdo de `~/todo.md` (se existir), lembrando o usuário de suas metas.
3.  **Manutenção do Sistema:** Pergunta proativamente se deve rodar a atualização do Arch Linux (`yay -Syu`).

### Instalação
O script é carregado automaticamente pelo `.zshrc` se estiver presente.

```bash
# No .zshrc
if [ -f "$HOME/dotfiles/common/resources/scripts/daily_briefing.sh" ]; then
    source "$HOME/dotfiles/common/resources/scripts/daily_briefing.sh"
fi
```

### Personalização
Para ver suas tarefas no dashboard, basta criar o arquivo:
```bash
echo "- Dominar o Mundo" > ~/todo.md
```
