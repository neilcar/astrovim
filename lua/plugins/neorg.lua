return {
  {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = function()
        -- Neorg looks for its parsers (norg, norg_meta) on package.cpath, but lazy.nvim adds each parser
        -- rock's path only when that rock loads, which can be after Neorg: then it warns "norg_meta
        -- treesitter parser was not found" at startup although the parser is built. Add both up front.
        local rocks = vim.fn.stdpath("data") .. "/lazy-rocks/"
        for _, rock in ipairs({ "tree-sitter-norg", "tree-sitter-norg-meta" }) do
          package.cpath = rocks .. rock .. "/lib/lua/5.1/?.so;" .. package.cpath
        end
        require("neorg").setup {
          load = {
            ["core.defaults"] = {},
            ["core.concealer"] = {},
            ["core.dirman"] = {
              config = {
                workspaces = {
                  notes = "~/notes",
                },
                default_workspace = "notes",
              },
            },
          },
        }
  
        vim.wo.foldlevel = 99
        vim.wo.conceallevel = 2
      end,
  },
}

