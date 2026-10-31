-- obsidian.nvim: use whichever of these vaults exist on this machine; stay off where none do
-- (alucard, dev-box and the light machines have no vault).
local candidates = {
  { name = "new", path = "~/Documents/new" }, -- main vault
  { name = "work", path = "~/Documents/work" },
}
local workspaces = vim.tbl_filter(
  function(ws) return vim.fn.isdirectory(vim.fn.expand(ws.path)) == 1 end,
  candidates
)

---@type LazySpec
return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- latest release rather than latest commit
  ft = "markdown",
  cond = #workspaces > 0,
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- will be removed in the next major release
    workspaces = workspaces,
  },
}
