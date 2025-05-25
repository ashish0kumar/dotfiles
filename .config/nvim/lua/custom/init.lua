-- suppress "deprecated" warnings
local orig_echo = vim.api.nvim_echo
vim.api.nvim_echo = function(chunks, history, opts)
  local msg = table.concat(vim.tbl_map(function(c) return c[1] end, chunks), "")
  if msg:lower():match("deprecated") or msg:match("client%.supports_method") then
    return
  end
  orig_echo(chunks, history, opts)
end

vim.g.clipboard = {
  name = 'clip-wsl',
  copy = {
    ['+'] = 'clip.exe',
    ['*'] = 'clip.exe',
  },
  paste = {
    ['+'] = 'powershell.exe -command "Get-Clipboard"',
    ['*'] = 'powershell.exe -command "Get-Clipboard"',
  },
  cache_enabled = 0,
}
