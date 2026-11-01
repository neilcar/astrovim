-- VT220 amber: a retro-modern take on a DEC VT220 with amber (P3) phosphor. Mostly amber, with
-- brightness doing most of the work; red and green keep a little hue so diffs and errors still read.
-- The same palette is in chezmoi's WezTerm scheme and the light machines' nvim (nvim-light/colors).
-- Every syntax colour is at least 4.9:1 on the background (comments), most 8-15:1.
require("mini.base16").setup({
  palette = {
    base00 = "#140d03", -- background: warm near-black
    base01 = "#21170a", -- statusline, popups
    base02 = "#3a2a10", -- selection
    base03 = "#a4793a", -- comments, line numbers
    base04 = "#c08a36", -- dim text
    base05 = "#ffb52e", -- main text: amber phosphor
    base06 = "#ffcb66",
    base07 = "#ffe3a8", -- brightest
    base08 = "#ff6a3d", -- red: errors, deletions, variables
    base09 = "#ff9d4a", -- numbers, constants
    base0A = "#ffd166", -- types
    base0B = "#c9c25a", -- strings, additions (olive)
    base0C = "#f2cf8a", -- escapes, regex
    base0D = "#ffc04d", -- functions
    base0E = "#ff8a50", -- keywords
    base0F = "#c96a2c", -- deprecated, embedded
  },
  use_cterm = true,
})
vim.g.colors_name = "vt220-amber"
