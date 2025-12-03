return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  opts = {
    provider = "gemini",
    gemini = {
      -- Forçar endpoint do AI Studio para evitar Vertex
      endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
      model = "gemini-1.5-flash",
      temperature = 0,
      max_tokens = 8192,
    },
  },
  build = "make",
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
}