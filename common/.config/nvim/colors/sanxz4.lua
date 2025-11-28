-- ~/.config/nvim/colors/sanxz4.lua
-- Matriz Aura v4.0 (Edição "Total Immersion": Ultra-Saturada, Sem Cinza, Fundo 1% Mais Claro)

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "sanxz4"
vim.opt.termguicolors = true

-- 2. Definição da Paleta (Tinta Púrpura nos Extremos)
local c = {
	-- O "Preto" (Manchado de Roxo)
	base = "#0E0A15", -- Roxo Abissal (Fundo Principal, 1% Mais Claro)
	surface = "#21182C", -- Roxo Noturno (Painéis/Linha de Cursor)

	-- O "Branco" e Cinza (AGORA SÓ ROXO ESCURO/MÉDIO E VIOLETA SATURADO)
	text = "#B794FF", -- Violeta Intenso (Texto Padrão)
	ice = "#C5A9FF", -- Lilás de Alto Brilho (Destaques de Leitura/Linhas)
	dark_lilac = "#9377B8", -- Lilás Escuro (Substituto do c.gray para Comentários)

	-- Identidade (Poder Lilith)
	magenta = "#A855F7", -- Ação
	magenta_a = "#CC99FF", -- Aura Vibrante

	-- Estrutura (Indigo Profundo)
	indigo = "#6366F1", -- Imports
	cyan = "#A78BFA", -- Conexões (Lilás Elétrico)

	-- Sistema (Puxando para o brilho máximo e saturado)
	green = "#34D399", -- Verde Esmeralda
	yellow = "#FACC15", -- Amarelo Sol
	red = "#F87171", -- Vermelho Fogo
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
hl("Normal", c.text, c.base)
hl("NormalFloat", c.ice, c.base)
hl("SignColumn", nil, c.base)

-- REGRA: Cor clara (c.ice) reservada para números de linha.
hl("LineNr", c.ice, nil) -- Números de Linha em Lilás Alto Brilho
hl("CursorLine", nil, c.surface)
hl("CursorLineNr", c.magenta, nil, "bold")
hl("EndOfBuffer", c.base, nil)

-- Sintaxe
hl("Comment", c.dark_lilac, nil, "italic")

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

-- Imports (Magenta e Indigo)
hl("PreProc", c.magenta)
hl("Include", c.indigo)
hl("Define", c.indigo)
hl("Macro", c.indigo)

-- Variáveis (Alto Brilho)
hl("Identifier", c.ice)

-- Conexões e Tipos (Amarelo e Lilás Elétrico)
hl("Operator", c.cyan)
hl("Type", c.yellow)
hl("Constant", c.yellow)
hl("Special", c.cyan)

-- Interface
hl("Search", c.base, c.yellow)
hl("Visual", nil, c.surface)
hl("MatchParen", c.ice, c.surface, "bold")

hl("Error", c.red, nil, "bold")
hl("ErrorMsg", c.red, nil, "bold")
hl("WarningMsg", c.yellow, nil, "bold")
hl("DiagnosticInfo", c.cyan)
hl("DiagnosticHint", c.ice)

-- Menus
hl("Pmenu", c.ice, c.surface)
hl("PmenuSel", c.base, c.magenta)
