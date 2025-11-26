-- ~/.config/nvim/colors/sanxz2.lua
-- Matriz Aura (Versão Corrigida)

-- 1. Limpa configurações de cores anteriores
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "sanxz2"
vim.opt.termguicolors = true

-- 2. Definição da Paleta (Matriz Aura Oficial)
local c = {
	base = "#0F172A", -- Deep (Fundo)
	surface = "#334155", -- Surface (Paineis/Linha Atual)
	text = "#E2E8F0", -- Foreground Suave

	-- Identidade
	magenta = "#A855F7", -- Lilith
	magenta_a = "#D4AAFB", -- Aura

	-- Estrutura
	blue = "#3B82F6", -- Lugares
	ice = "#91E9F6", -- Leitura (Texto)
	cyan = "#22D3EE", -- Conexões

	-- Sistema
	green = "#22C55E", -- Execução
	yellow = "#FACC15", -- Atenção
	red = "#F43F5E", -- Erro
	gray = "#64748B", -- Comentários
}

-- 3. Função Helper para aplicar as cores
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

-- --- APLICAÇÃO DOS GRUPOS ---

-- Editor Base
hl("Normal", c.ice, c.base)
hl("NormalFloat", c.ice, c.base)
hl("SignColumn", nil, c.base)
hl("LineNr", c.gray, nil)
hl("CursorLine", nil, c.surface)
hl("CursorLineNr", c.magenta, nil, "bold")

-- Sintaxe
hl("Comment", c.gray, nil, "italic")

hl("String", c.green)
hl("Character", c.green)

hl("Number", c.magenta_a)
hl("Boolean", c.magenta_a)
hl("Float", c.magenta_a)

hl("Function", c.magenta, nil, "bold")
hl("Keyword", c.magenta)
hl("Conditional", c.magenta)
hl("Repeat", c.magenta)

hl("Operator", c.cyan)
hl("Type", c.yellow)
hl("Constant", c.yellow)

hl("Identifier", c.ice)
hl("PreProc", c.blue)
hl("Special", c.cyan)

-- Interface
hl("Search", c.base, c.yellow)
hl("Visual", nil, c.surface)
hl("MatchParen", c.yellow, c.surface, "bold")

hl("Error", c.red, nil, "bold")
hl("ErrorMsg", c.red, nil, "bold")
hl("WarningMsg", c.yellow)
hl("Pmenu", c.ice, c.surface)
hl("PmenuSel", c.base, c.magenta)
