# terminal-toggle.nvim
Simple single terminal toggler

I love the nvim terminal. I use it all the time to drop to a terminal, run some tools, compile/test/lint/etc. and switch back to what I was doing.

I only ever use a single terminal, and wanted a way to have just one, and to toggle it on and off easily.

## Features

- Single terminal
- Easy toggle on/off with a TerminalToggle ex command
- Return back to the buffer you were last on
- Only enter insert mode when toggling on and not via an auto command. This means that navigating through the jump list doesn't put you in insert mode and prevent you `<C-o>`'ing any further.

## Installation

Using Packer:

```lua
require("packer").startup(function()
  use({
    "ChrisBrowne/terminal-toggle.nvim",
    config = function()
      require("terminal-toggle").setup()
    end,
  })
end)
```
Using Lazy.nvim:

```lua
{
  'ChrisBrowne/terminal-toggle.nvim',
  opts = {},
}
```

## Setup
Add the TerminalToggle command to your favourite key combo. Since I only use the terminal in nvim, I've overridden `<C-z>` to show this terminal rather than background nvim. You do you!

```lua
  vim.keymap.set({ 'n', 't' }, '<C-z>', '<cmd>TerminalToggle<CR>', { desc = 'Terminal toggle' })
```
