# SANXZ Color Palettes (Source of Truth)

Este diretório armazena as definições de cores agnósticas em formato YAML.
Estes arquivos são a referência central para gerar configurações de temas.

## Arquitetura v2 (Semantic Shield)
A versão 2 introduz uma separação estrita entre **Estética** e **Segurança**:

1.  **Semantic Block (Blindado):**
    *   `error`: `#FF0000` (Sempre Vermelho Puro)
    *   `warning`: `#FFFF00` (Sempre Amarelo Puro)
    *   `success`: `#00FF00` (Sempre Verde Puro)
    *   `info`: `#44AAFF` (Sempre Azul Dodger)
    *   *Objetivo:* Garantir que alertas críticos sejam reconhecíveis instantaneamente, independente do tema (mesmo em temas verdes ou vermelhos).

2.  **Palette Block (Agnóstico):**
    Os slots ANSI (`c00` a `c15`) carregam a lógica estética do tema. O Waybar consome estes slots sequencialmente (`c01` -> W1, `c02` -> W2...).

### Estratégias de Paleta
*   **Rainbow P-W-C-W (Intercalada):** Usada em `sanxz4`, `coolwarm`, `warmcool`.
    *   Intercala tons: **P**urple (Identidade) -> **W**arm (Ação) -> **C**ool (Estrutura) -> **W**arm...
    *   Resultado: Uma barra de tarefas vibrante e rítmica.
*   **Monochromatic Gradient:** Usada em `monored`, `greenhill`.
    *   Usa degradês sequenciais da cor base.
    *   Resultado: Uma barra de tarefas uniforme e imersiva.

## Temas Disponíveis
*   **`sanxz4.yaml`**: Flagship. Base Violeta com Rainbow P-W-C-W.
*   **`greenhill.yaml`**: Matrix Green Scale. (Semântica preservada).
*   **`monored.yaml`**: Sith Red Scale. (Semântica preservada).
*   **`warmcool.yaml`**: Warm Action (Laranja), Cool Structure (Navy).
*   **`coolwarm.yaml`**: Cool Action (Cyan), Warm Structure (Red-Black).