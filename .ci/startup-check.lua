-- Startup check for this config (CI, and by hand):
--   nvim --headless --cmd 'luafile .ci/startup-check.lua'
-- Loaded with --cmd, i.e. before init.lua, so it also sees warnings from early in startup (AstroNvim
-- later replaces vim.notify with snacks' notifier, whose history is read at the end). Opens a file of
-- each type in use, waits for on-demand work (treesitter parser installs), then fails with a list of
-- every warning or error you would see: notifications at WARN or above and E-numbered messages.
-- (Not vim.v.errmsg: plugins leave it set by errors they catch themselves, e.g. nvim-autopairs
-- removing a quote mapping that isn't there in Markdown and Python buffers.)
local seen = {}
local function note(msg, level)
  if (level or vim.log.levels.INFO) >= vim.log.levels.WARN then table.insert(seen, tostring(msg)) end
end
local orig_notify = vim.notify
vim.notify = function(msg, level, opts) note(msg, level); return orig_notify(msg, level, opts) end

local samples = {
  ["check.lua"] = 'local x = 1\nreturn x\n',
  ["check.md"] = '# Heading\n\nSome *text*.\n',
  ["check.yaml"] = 'key: value\nlist:\n  - a\n',
  ["check.fish"] = 'function hi\n    echo hi\nend\n',
  ["check.py"] = 'def f():\n    return 1\n',
  ["check.norg"] = '* Heading\n  Some text.\n',
}

local function run()
  local dir = vim.fn.tempname(); vim.fn.mkdir(dir, "p")
  for name, body in pairs(samples) do
    local p = dir .. "/" .. name
    vim.fn.writefile(vim.split(body, "\n"), p)
    local ok, err = pcall(vim.cmd.edit, p)
    if not ok then note("opening " .. name .. ": " .. tostring(err), vim.log.levels.ERROR) end
    vim.wait(3000)
  end
  vim.wait(20000, function() return false end) -- let parser installs and deferred plugin setup finish
  local okS, Snacks = pcall(require, "snacks")
  if okS and Snacks.notifier and Snacks.notifier.get_history then
    for _, n in ipairs(Snacks.notifier.get_history() or {}) do
      local lvl = type(n.level) == "string" and vim.log.levels[n.level:upper()] or n.level
      note(n.msg, lvl)
    end
  end
  for line in vim.fn.execute("messages"):gmatch("[^\n]+") do
    if line:match("^E%d+:") or line:match("^Error") then table.insert(seen, line) end
  end
  local uniq, out = {}, {}
  for _, m in ipairs(seen) do if not uniq[m] then uniq[m] = true; table.insert(out, m) end end
  io.stdout:write(("colorscheme=%s plugins=%d problems=%d\n"):format(tostring(vim.g.colors_name),
    #vim.tbl_keys(require("lazy.core.config").plugins), #out))
  for _, m in ipairs(out) do io.stdout:write("  PROBLEM: " .. m:gsub("\n", " | ") .. "\n") end
  if #out > 0 then vim.cmd("cquit 1") else vim.cmd("qall!") end
end

vim.api.nvim_create_autocmd("VimEnter", { once = true, callback = function() vim.defer_fn(run, 1000) end })
