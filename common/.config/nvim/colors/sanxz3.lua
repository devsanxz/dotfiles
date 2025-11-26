-- ~/.config/nvim/colors/sanxz3.lua
-- Matriz Aura v3.3 (Edição "Total Immersion": Tudo é Roxo)

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "sanxz3"
vim.opt.termguicolors = true

-- 2. Definição da Paleta (Tinta Púrpura nos Extremos)
local c = {
	-- O "Preto" (Manchado de Roxo)
	base = "#0B0712", -- Roxo Abissal (Fundo Principal)
	surface = "#1E1529", -- Roxo Noturno (Painéis/Linha)

	-- O "Branco" e Cinza (Manchados de Lilás)
	text = "#E9D8FD", -- Lavanda Espectral (Texto Padrão)
	ice = "#F3E8FF", -- Névoa Pálida (Destaques de Leitura)
	gray = "#6B5D78", -- Cinza Ametista (Comentários)

	-- Identidade (Poder Lilith)
	magenta = "#A855F7", -- Ação
	magenta_a = "#D8B4FE", -- Aura

	-- Estrutura (Indigo Profundo)
	indigo = "#6366F1", -- Imports
	cyan = "#A78BFA", -- Conexões (Lilás Elétrico)

	-- Sistema (Mantidos legíveis, mas harmonizados)
	green = "#4ADE80", -- Um verde mais "menta" para combinar com roxo
	yellow = "#FDE047",
	red = "#FB7185", -- Vermelho rosado (Rose)
}

-- 3. Helper
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

-- --- APLICAÇÃO ---

-- Editor
hl("Normal", c.text, c.base) -- Texto Lavanda sobre Fundo Abissal
hl("NormalFloat", c.ice, c.base)
hl("SignColumn", nil, c.base)
hl("LineNr", c.gray, nil)
hl("CursorLine", nil, c.surface)
hl("CursorLineNr", c.magenta, nil, "bold")
hl("EndOfBuffer", c.base, nil) -- Fim do arquivo invisível

-- Sintaxe
hl("Comment", c.gray, nil, "italic") -- Comentários roxos discretos

hl("String", c.green)
hl("Character", c.green)

hl("Number", c.magenta_a)
hl("Boolean", c.magenta_a)
hl("Float", c.magenta_a)

hl("Function", c.magenta, nil, "bold")
hl("Keyword", c.magenta)
hl("Conditional", c.magenta)
hl("Repeat", c.magenta)
hl("Statement", c.magenta)

-- Imports (Indigo)
hl("PreProc", c.indigo)
hl("Include", c.indigo)
hl("Define", c.indigo)
hl("Macro", c.indigo)

-- Variáveis (Ice/Lavanda)
hl("Identifier", c.ice)

-- Conexões (Lilás)
hl("Operator", c.cyan)
hl("Type", c.yellow)
hl("Constant", c.yellow)
hl("Special", c.cyan)

-- Interface
hl("Search", c.base, c.yellow)
hl("Visual", nil, c.surface)
hl("MatchParen", c.yellow, c.surface, "bold")

hl("Error", c.red, nil, "bold")
hl("ErrorMsg", c.red, nil, "bold")
hl("WarningMsg", c.yellow)
hl("DiagnosticInfo", c.cyan)
hl("DiagnosticHint", c.ice)

-- Menus
hl("Pmenu", c.ice, c.surface)
hl("PmenuSel", c.base, c.magenta)
