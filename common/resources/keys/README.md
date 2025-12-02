# Gerenciamento de Chaves de API (Segurança SRE)

Este diretório armazena chaves de API sensíveis que não devem ser versionadas no Git.

## Como Configurar a API do Google (Gemini)

Para que o plugin **Avante.nvim** funcione com o Gemini 1.5 Pro, você precisa fornecer sua chave de API do Google AI Studio.

1.  Crie um arquivo chamado `googleapi.txt` dentro desta pasta (`~/dotfiles/common/resources/keys/`).
2.  Cole sua chave de API dentro dele (apenas a chave, sem aspas ou espaços extras).
    *   Exemplo de conteúdo: `AIzaSy...`
3.  O sistema carregará automaticamente esta chave para a variável de ambiente `GEMINI_API_KEY` através do script `variables.zsh` (se configurado) ou o Neovim lerá diretamente.

**IMPORTANTE:** O arquivo `googleapi.txt` está listado no `.gitignore` e nunca será enviado para o repositório remoto.
