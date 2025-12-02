-- ~/.config/nvim/colors/greenhill.lua
-- TEMA: GREENHILL (Monocromático Verde Puro - V2 Equidistante)
-- Filosofia: 3 Semânticas Reservadas + 16 Tons de Verde

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
end

vim.g.colors_name = "greenhill"
vim.opt.termguicolors = true

-- ==========================================================
-- 1. A PALETA
-- ==========================================================
local c = {
        -- 1. Semântica Reservada (Exceções)
        sem_success = "#FFFFFF", -- Branco Puro (Substitui o Verde semântico)
        sem_warn    = "#FFFF00", -- Amarelo Puro
        sem_error   = "#FF0000", -- Vermelho Puro
        
        -- Neutro Base
        black = "#000000",

        -- 2. Os 16 Tons de Verde (Green Hill Scale)
        -- Do mais escuro (#001100) ao mais brilhante (#AAFFHH)
        g01 = "#001100", -- UI Background
        g02 = "#002200", -- CursorLine
        g03 = "#003300", -- Selection
        g04 = "#004400", -- Borders
        g05 = "#005500", -- Comments Dim
        g06 = "#006600", -- Comments Bright
        g07 = "#007700", -- UI Elements
        g08 = "#008800", -- Dark Text
        g09 = "#009900", -- Operators
        g10 = "#00AA00", -- Normal Text Base
        g11 = "#00BB00", -- PreProc
        g12 = "#00CC00", -- Identifiers
        g13 = "#00DD00", -- Types
        g14 = "#00EE00", -- Keywords
        g15 = "#00FF00", -- Functions / Neon Pure
        g16 = "#CCFFCC", -- Constants / Pale Green (Quase branco)

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
-- 3. MAPEAMENTO (The Gradient)
-- ==========================================================

-- --- Editor Base ---
hl("Normal", c.g10, c.black)      -- Texto base num verde médio agradável
hl("NormalFloat", c.g10, c.g01)
hl("SignColumn", nil, c.black)

hl("LineNr", c.g04, nil)
hl("CursorLine", nil, c.g02)
hl("CursorLineNr", c.g15, nil, "bold") -- Linha atual brilha neon
hl("EndOfBuffer", c.g03, nil)

-- --- Sintaxe (Somente Verdes) ---
hl("Comment", c.g05, nil, "italic")

hl("Operator", c.g09)
hl("Identifier", c.g12)
hl("PreProc", c.g11)
hl("Include", c.g11)
hl("Macro", c.g11)

hl("Type", c.g13)
hl("StorageClass", c.g13)
hl("Structure", c.g13)
hl("Typedef", c.g13)

hl("Keyword", c.g14)
hl("Statement", c.g14)
hl("Conditional", c.g14)
hl("Repeat", c.g14)
hl("Label", c.g14)

hl("Function", c.g15, nil, "bold") -- Neon puro
hl("Special", c.g15)

hl("Number", c.g16) -- Verde pálido (destaque de valor)
hl("Boolean", c.g16)
hl("Float", c.g16)
hl("Constant", c.g16)

-- --- Exceção Semântica 1: Sucesso/String -> BRANCO ---
hl("String", c.sem_success) 
hl("Character", c.sem_success)

-- --- Interface ---
hl("Search", c.black, c.g15) -- Texto preto em fundo Neon
hl("Visual", nil, c.g03)
hl("MatchParen", c.sem_success, c.g04, "bold") -- Branco no parenteses

-- --- Exceção Semântica 2 & 3: Aviso/Erro ---
hl("Error", c.sem_error, nil, "bold")
hl("ErrorMsg", c.sem_error, nil, "bold")
hl("WarningMsg", c.sem_warn, nil, "bold")

hl("DiagnosticError", c.sem_error)
hl("DiagnosticWarn", c.sem_warn)
hl("DiagnosticInfo", c.g13) -- Info continua verde (Type level)
hl("DiagnosticHint", c.g06) -- Hint continua verde (Comment level)
hl("DiagnosticOk", c.sem_success) -- Branco

-- --- Menus ---
hl("Pmenu", c.g12, c.g01)
hl("PmenuSel", c.black, c.g15)
