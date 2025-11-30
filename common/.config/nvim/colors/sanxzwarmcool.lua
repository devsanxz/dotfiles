-- ~/.config/nvim/colors/sanxzwarmcool.lua
-- TEMA: SANXZ WARM/COOL (Foco em separação inteligente de cores quentes e frias)
-- Usa a Paleta Base SANXZ de 16 cores.

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
end

vim.g.colors_name = "sanxzwarmcool"
vim.opt.termguicolors = true

-- ==========================================================
-- 1. A PALETA (SANXZ Pure 16-Color Palette)
-- ==========================================================
local c = {
        -- Neutros
        black = "#000000", -- Fundo Base
        white = "#FFFFFF", -- Foreground Principal

        -- Cores Base (Saturadas - Para elementos secundários ou menos proeminentes)
        red_base = "#FF0000",
        orange_base = "#FF8000",
        yellow_base = "#FFFF00",
        green_base = "#00FF00",
        cyan_base = "#00FFFF",
        blue_base = "#0000FF",
        violet_base = "#8000FF",

        -- Cores Brilhantes (Para elementos principais, destaques, vibrantes)
        red_brilliant = "#FF5555", -- Erros
        orange_brilliant = "#FFAA55", -- Números, Constantes
        yellow_brilliant = "#FFFF77", -- Funções, Warnings
        green_brilliant = "#55FF55", -- Strings, Sucesso
        cyan_brilliant = "#55FFFF", -- Tipos, PreProc
        blue_brilliant = "#5555FF", -- Operadores, Keywords
        violet_brilliant = "#AA55FF", -- Estrutura, Modificadores

        -- Especiais (UI - derivadas ou neutras)
        ui_bg = "#000000", -- Fundo de menus/status (igual ao black)
        ui_border = "#222222", -- Bordas sutis (cinza escuro)
        ui_hover = "#333333", -- Seleção/CursorLine (cinza médio)
        comment = "#777777", -- Comentários (cinza claro)

        none = "NONE",
}

-- ==========================================================
-- 2. FUNÇÃO DE HIGHLIGHT (Inalterada)
-- ==========================================================
local function hl(group, fg, bg, attr)
        local opts = {}
        if fg then
                opts.fg = fg
        end
        if bg then
                opts.bg = bg
        end
        if attr then
                opts[attr] = true
        end
        vim.api.nvim_set_hl(0, group, opts)
end

-- ==========================================================
-- 3. MAPEAMENTO DE GRUPOS (Lógica Unificada) - Quente/Frio
-- ==========================================================

-- --- Editor Base ---
hl("Normal", c.white, c.black) -- Fundo preto, texto principal branco
hl("NormalFloat", c.white, c.ui_bg)
hl("SignColumn", nil, c.ui_bg)

hl("LineNr", c.comment, nil) -- Números de linha mais discretos
hl("CursorLine", nil, c.ui_hover)
hl("CursorLineNr", c.yellow_brilliant, nil, "bold") -- Destaque quente para linha atual
hl("EndOfBuffer", c.ui_bg, nil)

-- --- Sintaxe ---
hl("Comment", c.comment, nil, "italic") -- Frio, recuado

hl("String", c.green_brilliant) -- Quente, Sucesso
hl("Character", c.green_brilliant)

hl("Number", c.orange_brilliant) -- Quente, Destaque
hl("Boolean", c.orange_brilliant)
hl("Float", c.orange_brilliant)

hl("Function", c.yellow_brilliant, nil, "bold") -- Quente, Chamar atenção
hl("Keyword", c.violet_brilliant) -- Frio, Estrutura
hl("Conditional", c.violet_brilliant)
hl("Repeat", c.violet_brilliant)
hl("Statement", c.violet_brilliant)

hl("PreProc", c.cyan_brilliant) -- Frio, Contexto
hl("Include", c.cyan_brilliant)
hl("Define", c.cyan_brilliant)
hl("Macro", c.cyan_brilliant)

hl("Identifier", c.white) -- Neutro, para nomes de variáveis/funções
hl("Operator", c.blue_brilliant) -- Frio, Conectores
hl("Type", c.cyan_brilliant) -- Frio, Definições
hl("Constant", c.orange_brilliant) -- Quente, Valores fixos
hl("Special", c.blue_brilliant) -- Frio, Elementos especiais

-- --- Interface ---
hl("Search", c.black, c.yellow_brilliant) -- Quente para busca
hl("Visual", nil, c.ui_hover)
hl("MatchParen", c.white, c.ui_border, "bold")

hl("Error", c.red_brilliant, nil, "bold") -- Quente, Crítico
hl("ErrorMsg", c.red_brilliant, nil, "bold")
hl("WarningMsg", c.yellow_brilliant, nil, "bold") -- Quente, Aviso
hl("DiagnosticInfo", c.cyan_brilliant) -- Frio, Informação
hl("DiagnosticHint", c.white) -- Neutro, Dicas

-- --- Menus ---
hl("Pmenu", c.white, c.ui_border)
hl("PmenuSel", c.ui_bg, c.blue_brilliant) -- Seleção do menu (frio, estrutural)
