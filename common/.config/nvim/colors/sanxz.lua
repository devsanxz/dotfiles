-- ~/.config/nvim/colors/sanxz.lua
-- TEMA: SANXZ
-- Paleta SRE unificada (c0-c8)
-- Fundo: Preto (#000000) | Texto: Violeta (#DD55FF)

-- Reset básico
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "sanxz"

-- ==========================================================
-- 1. A PALETA (Fonte da Verdade)
-- ==========================================================
local c = {
	-- Âncoras
	black = "#000000", -- c0
	c_white = "#FFFFFF", -- c8_white

	-- Ciclo Arco-Íris
	violet = "#DD55FF", -- c1 (Foreground Principal)
	orange = "#FFAA55", -- c2 (Números/Constantes)
	yellow = "#FFFF55", -- c3 (Funções)
	green = "#55FF55", -- c4 (Strings)
	cyan = "#55DDFF", -- c5 (Tipos)
	blue = "#5555FF", -- c6 (Operadores)
	indigo = "#9955FF", -- c7 (Keywords/Estrutura)
	c_red = "#FF5555", -- c8_red (Erros/Alertas)

	-- Interface (UI) - Baseada nas "Pílulas" do Waybar
	ui_bg = "#110011", -- Fundo de menus/status
	ui_border = "#440044", -- Bordas sutis
	ui_hover = c.ui_border, -- Seleção/CursorLine
	comment = c.orange, -- Laranja Muted

	-- Especiais
	none = "NONE",
}

-- ==========================================================
-- 2. FUNÇÃO DE HIGHLIGHT
-- ==========================================================
local function hl(group, fg, bg, attr)
	local opts = { fg = fg, bg = bg }
	if attr then
		opts[attr] = true
	end
	vim.api.nvim_set_hl(0, group, opts)
end

-- ==========================================================
-- 3. MAPEAMENTO DE GRUPOS (A Lógica Cromológica)
-- ==========================================================

-- --- Editor Base ---
hl("Normal", c.violet, c.black) -- Texto Violeta no Fundo Preto
hl("NormalFloat", c.violet, c.ui_bg) -- Janelas flutuantes mais escuras
hl("FloatBorder", c.indigo, c.ui_bg) -- Borda Índigo
hl("ColorColumn", nil, c.ui_hover)
hl("Cursor", c.black, c.c_white)
hl("CursorLine", nil, c.ui_bg) -- Linha atual sutil
hl("CursorLineNr", c.yellow, c.ui_bg, "bold")
hl("LineNr", c.ui_border, nil) -- Números de linha apagados
hl("SignColumn", nil, c.black)

hl("VertSplit", c.ui_border, c.black)
hl("WinSeparator", c.ui_border, c.black)
hl("StatusLine", c.c_white, c.ui_bg)
hl("StatusLineNC", c.comment, c.ui_bg)

hl("Pmenu", c.violet, c.ui_bg) -- Popup Menu (Autocomplete)
hl("PmenuSel", c.black, c.yellow) -- Seleção Amarela
hl("PmenuSbar", nil, c.ui_bg)
hl("PmenuThumb", nil, c.indigo)

hl("Search", c.black, c.orange)
hl("IncSearch", c.black, c.yellow)
hl("Visual", nil, c.ui_hover) -- Seleção Visual

-- --- Sintaxe Padrão ---
hl("Comment", c.comment, nil, "italic")
hl("Constant", c.orange, nil) -- true, false, null
hl("String", c.green, nil) -- "Strings"
hl("Character", c.green, nil)
hl("Number", c.orange, nil)
hl("Boolean", c.orange, nil, "bold")
hl("Float", c.orange, nil)

hl("Identifier", c.c_white, nil) -- Variáveis (Branco para destaque)
hl("Function", c.yellow, nil, "bold") -- Funções (Amarelo)

hl("Statement", c.indigo, nil) -- if, while, return
hl("Conditional", c.indigo, nil)
hl("Repeat", c.indigo, nil)
hl("Label", c.cyan, nil)
hl("Operator", c.blue, nil) -- +, -, *, =
hl("Keyword", c.indigo, nil, "italic") -- function, local
hl("Exception", c.c_red, nil)

hl("PreProc", c.cyan, nil) -- import, include
hl("Include", c.cyan, nil)
hl("Define", c.cyan, nil)
hl("Macro", c.cyan, nil)

hl("Type", c.cyan, nil) -- int, string, bool
hl("StorageClass", c.indigo, nil)
hl("Structure", c.cyan, nil)
hl("Typedef", c.cyan, nil)

hl("Special", c.blue, nil)
hl("Error", c.c_red, nil, "bold")
hl("Todo", c.black, c.red, "bold")

-- --- TreeSitter (Otimização Moderna) ---
-- Mapeia os grupos do TreeSitter para nossa lógica
hl("@variable", c.c_white, nil)
hl("@variable.builtin", c.orange, nil) -- this, self
hl("@function", c.yellow, nil)
hl("@function.builtin", c.yellow, nil)
hl("@function.macro", c.cyan, nil)
hl("@keyword", c.indigo, nil, "italic")
hl("@keyword.function", c.indigo, nil, "bold")
hl("@operator", c.blue, nil)
hl("@string", c.green, nil)
hl("@type", c.cyan, nil)
hl("@type.builtin", c.cyan, nil)
hl("@constructor", c.yellow, nil) -- New()
hl("@punctuation", c.ui_border, nil) -- ( ) { } [ ] , ; (Sutil)
hl("@tag", c.indigo, nil) -- HTML tags
hl("@tag.attribute", c.yellow, nil)
hl("@tag.delimiter", c.ui_border, nil)

-- --- LSP & Diagnostics ---
hl("DiagnosticError", c.c_red, nil)
hl("DiagnosticWarn", c.yellow, nil)
hl("DiagnosticInfo", c.blue, nil)
hl("DiagnosticHint", c.cyan, nil)
hl("DiagnosticUnderlineError", nil, nil, "undercurl")

-- --- Plugins Comuns ---
-- Telescope
hl("TelescopeBorder", c.ui_border, c.black)
hl("TelescopePromptBorder", c.indigo, c.black)
hl("TelescopeTitle", c.indigo, c.black, "bold")

-- NvimTree
hl("NvimTreeNormal", c.violet, c.ui_bg)
hl("NvimTreeWinSeparator", c.ui_bg, c.ui_bg)
hl("NvimTreeFolderName", c.blue, nil)
hl("NvimTreeFolderIcon", c.indigo, nil)
hl("NvimTreeOpenedFolderName", c.blue, nil, "bold")
