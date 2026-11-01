-- VT220 green: the green-phosphor take on vt220-amber. A softened P1 green (pure #33ff33 is harsh on
-- modern screens); brightness does most of the work, red keeps its hue for errors and deletions.
-- The same palette is in chezmoi's WezTerm scheme and the light machines' nvim (nvim-light/colors).
-- Every syntax colour is at least 5.6:1 on the background (comments), main text 13.6:1.
require("mini.base16").setup({
  palette = {
    base00 = "#06120b", -- background: green-black
    base01 = "#0c1f14", -- statusline, popups
    base02 = "#14402a", -- selection
    base03 = "#4a9a6a", -- comments, line numbers
    base04 = "#5fb886", -- dim text
    base05 = "#5cf59a", -- main text: green phosphor
    base06 = "#8affb8",
    base07 = "#c8ffde", -- brightest
    base08 = "#ff6a5a", -- red: errors, deletions, variables
    base09 = "#c4f25a", -- numbers, constants
    base0A = "#e0f57a", -- types
    base0B = "#9effd4", -- strings, additions (mint)
    base0C = "#78ece0", -- escapes, regex
    base0D = "#6dffbe", -- functions
    base0E = "#b0ff6a", -- keywords
    base0F = "#38b070", -- deprecated, embedded
  },
  use_cterm = true,
})
vim.g.colors_name = "vt220-green"
