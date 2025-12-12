-- ~/.config/nvim/colors/greenhill.lua
-- TEMA: GREENHILL (Remastered v2.5.1 - High Visibility)
-- Palette: Aligned with Green Hill YAML v2.5.1

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
        -- 1. Semântica Reservada
        sem_success = "#FFFFFF", -- Branco Puro (Strings)
        sem_warn    = "#FFFF00", -- Amarelo Puro
        sem_error   = "#FF0000", -- Vermelho Puro
        
        -- Neutro Base
        black = "#000500", -- Matrix Black

        -- 2. Escala High Vis (Baseada no YAML v2.5.1)
        g01 = "#001100", -- UI Background (Levemente acima do preto)
        g02 = "#002200", -- CursorLine
        g03 = "#004400", -- Selection
        g04 = "#005500", -- Borders
        g05 = "#007700", -- Comments (W1 antigo era 99, mas comments podem ser mais dark)
        g06 = "#009900", -- Comments Bright
        g07 = "#00B000", -- UI Elements (W1 Novo)
        g08 = "#00C000", -- Dark Text
        g09 = "#00D800", -- Operators (W2 Novo)
        g10 = "#00EE00", -- Normal Text Base (Quase Neon)
        g11 = "#00FF00", -- PreProc (W3 Novo - Neon Puro)
        g12 = "#33FF33", -- Identifiers (W4 Novo)
        g13 = "#66FF66", -- Types (W5 Novo)
        g14 = "#99FF99", -- Keywords (W6 Novo)
        g15 = "#CCFFCC", -- Functions / Highlights (W7 Novo)
        g16 = "#FFFFFF", -- Constants (Branco)

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
hl("Normal", c.g10, c.black)      -- Texto base bem claro (#00EE00)
hl("NormalFloat", c.g10, c.g01)
hl("SignColumn", nil, c.black)

hl("LineNr", c.g04, nil)
hl("CursorLine", nil, c.g02)
hl("CursorLineNr", c.g11, nil, "bold") -- Linha atual Neon Puro (#00FF00)
hl("EndOfBuffer", c.g03, nil)

-- --- Sintaxe (Somente Verdes) ---
hl("Comment", c.g05, nil, "italic") -- #007700 (Legível)

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

hl("Function", c.g15, nil, "bold") -- Pálido Brilhante
hl("Special", c.g15)

hl("Number", c.g16) -- Branco
hl("Boolean", c.g16)
hl("Float", c.g16)
hl("Constant", c.g16)

-- --- Exceção Semântica 1: Sucesso/String -> BRANCO ---
hl("String", c.sem_success) 
hl("Character", c.sem_success)

-- --- Interface ---
hl("Search", c.black, c.g11) -- Texto preto em fundo Neon
hl("Visual", nil, c.g03)
hl("MatchParen", c.sem_success, c.g04, "bold")

-- --- Exceção Semântica 2 & 3: Aviso/Erro ---
hl("Error", c.sem_error, nil, "bold")
hl("ErrorMsg", c.sem_error, nil, "bold")
hl("WarningMsg", c.sem_warn, nil, "bold")

hl("DiagnosticError", c.sem_error)
hl("DiagnosticWarn", c.sem_warn)
hl("DiagnosticInfo", c.g13)
hl("DiagnosticHint", c.g06)
hl("DiagnosticOk", c.sem_success)

-- --- Menus ---
hl("Pmenu", c.g12, c.g01)
hl("PmenuSel", c.black, c.g15)