-- gruvbox: warm, muted retro palette with modern highlighting. Medium contrast (its #282828 background
-- matches WezTerm's "GruvboxDark" scheme), italics only for comments and folds, no bold everywhere.
---@type LazySpec
return {
  "ellisonleao/gruvbox.nvim",
  opts = {
    contrast = "", -- "" = medium; "hard" is darker and starker, "soft" lighter
    bold = false,
    italic = { strings = false, emphasis = true, comments = true, operators = false, folds = true },
    invert_selection = false,
    terminal_colors = true,
  },
}
