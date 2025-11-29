-- ~/.config/nvim/colors/sanxz4.lua
-- TEMA: SANXZ v4 (Unificado com SSOT)
-- Baseado na paleta de 10 cores do sistema.

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "sanxz4"
vim.opt.termguicolors = true

-- ==========================================================
-- 1. A PALETA (Fonte da Verdade - SSOT)
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
	ui_hover = "#220022", -- Seleção/CursorLine (mantido do sanxz.lua original)
	comment = "#AA5500", -- Laranja Muted (mantido do sanxz.lua original)

	-- Especiais
	none = "NONE",
}

-- ==========================================================
-- 2. FUNÇÃO DE HIGHLIGHT
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
-- 3. MAPEAMENTO DE GRUPOS (Lógica Unificada)
-- ==========================================================

-- --- Editor Base ---
hl("Normal", c.violet, c.ui_bg)
hl("NormalFloat", c.violet, c.ui_bg)
hl("SignColumn", nil, c.ui_bg)

hl("LineNr", c.ui_border, nil)
hl("CursorLine", nil, c.ui_hover)
hl("CursorLineNr", c.yellow, nil, "bold")
hl("EndOfBuffer", c.ui_bg, nil)

-- --- Sintaxe ---
hl("Comment", c.comment, nil, "italic")

hl("String", c.green)
hl("Character", c.green)

hl("Number", c.orange)
hl("Boolean", c.orange)
hl("Float", c.orange)

hl("Function", c.yellow, nil, "bold")
hl("Keyword", c.indigo)
hl("Conditional", c.indigo)
hl("Repeat", c.indigo)
hl("Statement", c.indigo)

hl("PreProc", c.cyan)
hl("Include", c.cyan)
hl("Define", c.cyan)
hl("Macro", c.cyan)

hl("Identifier", c.c_white)

hl("Operator", c.blue)
hl("Type", c.cyan)
hl("Constant", c.orange)
hl("Special", c.blue)

-- --- Interface ---
hl("Search", c.black, c.yellow)
hl("Visual", nil, c.ui_hover)
hl("MatchParen", c.c_white, c.ui_border, "bold")

hl("Error", c.c_red, nil, "bold")
hl("ErrorMsg", c.c_red, nil, "bold")
hl("WarningMsg", c.yellow, nil, "bold")
hl("DiagnosticInfo", c.cyan)
hl("DiagnosticHint", c.c_white)

-- --- Menus ---
hl("Pmenu", c.c_white, c.ui_border)
hl("PmenuSel", c.ui_bg, c.violet)