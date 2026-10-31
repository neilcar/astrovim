-- AstroLSP: language-server behaviour. Servers come from the language packs in community.lua.
---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      codelens = true,
      inlay_hints = false,
      semantic_tokens = true,
    },
    formatting = {
      format_on_save = { enabled = true },
      timeout_ms = 1000,
    },
  },
}
