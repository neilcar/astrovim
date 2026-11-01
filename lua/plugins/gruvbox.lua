-- gruvbox: warm, muted retro palette with modern highlighting. Hard contrast (its #1d2021 background
-- matches the WezTerm scheme, gruvbox hard), italics only for comments and folds, no bold everywhere.
---@type LazySpec
return {
  "ellisonleao/gruvbox.nvim",
  opts = {
    contrast = "hard", -- "hard" darker background; "" medium, "soft" lighter
    bold = false,
    italic = { strings = false, emphasis = true, comments = true, operators = false, folds = true },
    invert_selection = false,
    terminal_colors = true,
  },
}
