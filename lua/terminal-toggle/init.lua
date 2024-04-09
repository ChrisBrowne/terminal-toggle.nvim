local M = {}

local terminal_buffer_handle
local origin_buffer_handle

function M.terminal_toggle()
  local current_buffer_handle = vim.api.nvim_win_get_buf(0)
  if current_buffer_handle == terminal_buffer_handle then
    vim.api.nvim_win_set_buf(0, origin_buffer_handle)
  else
    origin_buffer_handle = vim.api.nvim_win_get_buf(0)
    if terminal_buffer_handle == nil or not vim.api.nvim_buf_is_valid(terminal_buffer_handle) then
      vim.cmd.terminal()
      terminal_buffer_handle = vim.api.nvim_win_get_buf(0)
      vim.cmd 'startinsert'
    else
      vim.api.nvim_win_set_buf(0, terminal_buffer_handle)
      vim.cmd 'startinsert'
    end
  end
end

function M.setup()
  vim.api.nvim_create_user_command('TerminalToggle', function()
    M.terminal_toggle()
  end, {})
end

return M
