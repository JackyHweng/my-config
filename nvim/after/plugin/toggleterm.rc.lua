local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup {
  size = function(term)
    if term.direction == "horizontal" then
      return 20
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<c-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<c-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<c-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<c-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new {
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "none",
    width = 100000,
    height = 100000,
  },
  on_open = function(_)
    vim.cmd "startinsert!"
    -- vim.cmd "set laststatus=0"
  end,
  on_close = function(_)
    -- vim.cmd "set laststatus=3"
  end,
  count = 99,
}

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

local node = Terminal:new { cmd = "node", hidden = true }

function _NODE_TOGGLE()
  node:toggle()
end

local ncdu = Terminal:new { cmd = "ncdu", hidden = true }

function _NCDU_TOGGLE()
  ncdu:toggle()
end

local htop = Terminal:new { cmd = "htop", hidden = true }

function _HTOP_TOGGLE()
  htop:toggle()
end

local python = Terminal:new { cmd = "python", hidden = true }

function _PYTHON_TOGGLE()
  python:toggle()
end

local cargo_run = Terminal:new { cmd = "cargo run", hidden = true }

function _CARGO_RUN()
  cargo_run:toggle()
end

local cargo_test = Terminal:new { cmd = "cargo test", hidden = true }

function _CARGO_TEST()
  cargo_test:toggle()
end

local float_term = Terminal:new {
  direction = "float",
  on_open = function(term)
    vim.cmd "startinsert!"
    vim.api.nvim_buf_set_keymap(
      term.bufnr,
      "n",
      "<c-1>",
      "<cmd>1ToggleTerm direction=float<cr>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(
      term.bufnr,
      "t",
      "<c-1>",
      "<cmd>1ToggleTerm direction=float<cr>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(
      term.bufnr,
      "i",
      "<c-1>",
      "<cmd>1ToggleTerm direction=float<cr>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(term.bufnr, "", "<c-2>", "<nop>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(term.bufnr, "", "<c-3>", "<nop>", { noremap = true, silent = true })
  end,
  count = 1,
}

function _FLOAT_TERM()
  float_term:toggle()
end

vim.api.nvim_set_keymap("n", "<m-1>", "<cmd>lua _FLOAT_TERM()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<m-1>", "<cmd>lua _FLOAT_TERM()<CR>", { noremap = true, silent = true })

local vertical_term = Terminal:new {
  direction = "vertical",
  on_open = function(term)
    vim.cmd "startinsert!"
    vim.api.nvim_buf_set_keymap(
      term.bufnr,
      "n",
      "<m-2>",
      "<cmd>2ToggleTerm size=60 direction=vertical<cr>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(
      term.bufnr,
      "t",
      "<m-2>",
      "<cmd>2ToggleTerm size=60 direction=vertical<cr>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(
      term.bufnr,
      "i",
      "<m-2>",
      "<cmd>2ToggleTerm size=60 direction=vertical<cr>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(term.bufnr, "", "<m-3>", "<nop>", { noremap = true, silent = true })
  end,
  count = 2,
}

function _VERTICAL_TERM()
  vertical_term:toggle(60)
end

vim.api.nvim_set_keymap("n", "<m-2>", "<cmd>lua _VERTICAL_TERM()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<m-2>", "<cmd>lua _VERTICAL_TERM()<CR>", { noremap = true, silent = true })

local horizontal_term = Terminal:new {
  direction = "horizontal",
  on_open = function(term)
    vim.cmd "startinsert!"
    vim.api.nvim_buf_set_keymap(
      term.bufnr,
      "n",
      "<C-3>",
      "<cmd>3ToggleTerm size=10 direction=horizontal<cr>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(
      term.bufnr,
      "t",
      "<C-3>",
      "<cmd>3ToggleTerm size=10 direction=horizontal<cr>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(
      term.bufnr,
      "i",
      "<C-3>",
      "<cmd>3ToggleTerm size=10 direction=horizontal<cr>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(term.bufnr, "", "<C-2>", "<nop>", { noremap = true, silent = true })
  end,
  count = 3,
}

function _HORIZONTAL_TERM()
  horizontal_term:toggle(10)
end

vim.api.nvim_set_keymap("n", "<leader>3", "<cmd>lua _HORIZONTAL_TERM()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("i", "<A-3>", "<cmd>lua _HORIZONTAL_TERM()<CR>", { noremap = true, silent = true })


-- vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true })
-- ========= toggleterm settings ==========
-- By applying the mappings this way you can pass a count to your
-- mapping to open a specific window.
-- For example: 2<C-t> will open terminal 2
-- keymap.set('n', '<silent><leader>tt', '<Cmd>exe v:count1 . "ToggleTerm"<CR>')
-- keymap.set('n', '<silent><leader>gg', '<Cmd>lua _LAZYGIT_TOGGLE()<CR>')
