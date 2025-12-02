-- ~/.config/nvim/colors/greenhill.lua
-- TEMA: GREENHILL (Monocromático Verde - Estilo Matrix/Retro)
-- "A Colina Verde do Código"

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
end

vim.g.colors_name = "greenhill"
vim.opt.termguicolors = true

-- ==========================================================
-- 1. A PALETA (Green Hill Scale + Semantics)
-- ==========================================================
local c = {
        -- Neutros
        black = "#000000", -- O Vazio
        white = "#EEFFEE", -- Branco Tintado de Verde

        -- Semântica (Padrão SANXZ - A Realidade)
        red_error = "#FF0000",
        yellow_warn = "#FFFF55",
        green_ok = "#55FF55",

        -- Escala Green Hill
        gh_darkest = "#001100", -- UI Backgrounds sutis
        gh_dark = "#003300",    -- Bordas, linhas, inativos
        gh_dim = "#006600",     -- Comentários, não-focados
        gh_base = "#00AA00",    -- Texto padrão (código)
        gh_neon = "#00FF00",    -- Destaques, Funções, Keywords
        gh_digital = "#00FF88", -- Variável, Tipos (levemente ciano)
        gh_pale = "#CCFFCC",    -- Números, Constantes (alto contraste)

        none = "NONE",
}

-- ==========================================================
-- 2. FUNÇÃO DE HIGHLIGHT
-- ==========================================================
local function hl(group, fg, bg, attr)
        local opts = {}
        if fg then opts.fg = fg end
        if bg then opts.bg = bg end
        if attr then opts[attr] = true end
        vim.api.nvim_set_hl(0, group, opts)
end

-- ==========================================================
-- 3. MAPEAMENTO (Entering the Green Hill)
-- ==========================================================

-- --- Editor Base ---
hl("Normal", c.gh_base, c.black)
hl("NormalFloat", c.gh_base, c.gh_darkest)
hl("SignColumn", nil, c.black)

hl("LineNr", c.gh_dark, nil)
hl("CursorLine", nil, c.gh_darkest)
hl("CursorLineNr", c.gh_neon, nil, "bold")
hl("EndOfBuffer", c.gh_dark, nil)

-- --- Sintaxe ---
hl("Comment", c.gh_dim, nil, "italic")

hl("String", c.gh_digital) -- Um verde mais "frio"
hl("Character", c.gh_digital)

hl("Number", c.gh_pale) -- Quase branco, salta aos olhos
hl("Boolean", c.gh_pale)
hl("Float", c.gh_pale)

hl("Function", c.gh_neon, nil, "bold") -- O brilho principal
hl("Keyword", c.gh_neon)
hl("Conditional", c.gh_neon)
hl("Repeat", c.gh_neon)
hl("Statement", c.gh_neon)

hl("PreProc", c.gh_base)
hl("Include", c.gh_base)
hl("Define", c.gh_base)
hl("Macro", c.gh_base)

hl("Type", c.gh_digital)
hl("Operator", c.gh_neon) -- Operadores brilham
hl("Constant", c.gh_pale)
hl("Special", c.gh_digital)

hl("Identifier", c.white) -- Identificadores ficam quase brancos para legibilidade

-- --- Interface ---
hl("Search", c.black, c.gh_neon) -- Invertido: Texto preto em fundo Neon
hl("Visual", nil, c.gh_dark)
hl("MatchParen", c.gh_neon, c.gh_dark, "bold")

-- --- Semântica ---
hl("Error", c.red_error, nil, "bold")
hl("ErrorMsg", c.red_error, nil, "bold")
hl("WarningMsg", c.yellow_warn, nil, "bold")
hl("DiagnosticError", c.red_error)
hl("DiagnosticWarn", c.yellow_warn)
hl("DiagnosticInfo", c.gh_digital)
hl("DiagnosticHint", c.gh_dim)

-- --- Menus ---
hl("Pmenu", c.gh_base, c.gh_darkest)
hl("PmenuSel", c.black, c.gh_neon)
