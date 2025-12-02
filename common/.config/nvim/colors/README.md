# SANXZ Neovim Themes

Uma coleção de temas proprietários desenhados para produtividade, contraste e estética SRE.

## 🎨 A Coleção

### 🟣 SANXZ4 (The Flagship)
*   **Filosofia:** *Swap White/Violet*. Fundo preto absoluto, texto principal em violeta neon.
*   **Visual:** Alto contraste, vibrante, futurista.
*   **Uso:** O tema padrão ("Daily Driver"), equilibrado para qualquer linguagem.

### 🔴 SANXZ MONORED
*   **Filosofia:** *Intensidade Monocromática*.
*   **Visual:** Uma escala profunda de vermelhos e roxos. Apenas erros e avisos mantêm suas cores semânticas originais.
*   **Uso:** Foco extremo, modo "Red Alert", ou para ambientes com baixa luz onde o vermelho preserva a visão noturna.

### 🔥❄️ SANXZ WARM/COOL
*   **Filosofia:** *Psicologia das Cores Funcional*.
*   **Lógica:**
    *   🔥 **Quente (Vermelho/Laranja/Amarelo):** Elementos de **AÇÃO** (Números, Funções, Erros, Constantes). Cores que avançam.
    *   ❄️ **Frio (Azul/Ciano/Violeta):** Elementos de **ESTRUTURA** (Keywords, Tipos, Operadores, Comentários). Cores que recuam.
*   **Uso:** Para leitura rápida de lógica, destacando "o que acontece" sobre "como é estruturado".

### ❄️🔥 SANXZ COOL/WARM
*   **Filosofia:** *A Inversão Alienígena*.
*   **Lógica:**
    *   ❄️ **Frio:** Ação e Dados.
    *   🔥 **Quente:** Estrutura e Keywords.
*   **Uso:** Uma estética "Sci-Fi" distinta que inverte as expectativas tradicionais.

### 📟 GREENHILL
*   **Filosofia:** *The Matrix / Retro Terminal*.
*   **Visual:** Escala pura de verdes sobre fundo preto. Minimalista e nostálgico.
*   **Uso:** Hacking noturno, descanso visual, ou quando você quer se sentir no "mundo real".

---

## ⚙️ Como Usar

No Neovim, execute:

```vim
:colorscheme sanxz4
:colorscheme sanxzmonored
:colorscheme sanxzwarmcool
:colorscheme sanxzcoolwarm
:colorscheme greenhill
```

Para definir como padrão, adicione ao seu `init.lua`:
```lua
vim.cmd.colorscheme("sanxz4")
```

---
*Todos os temas respeitam a [Teoria das Cores SANXZ](../../../../docs/SAN_COLORS.md) e a paleta de 16 cores base.*
