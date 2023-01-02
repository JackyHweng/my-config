local keymap = vim.keymap



keymap.set('n', '<C-c>', '<Nop>')
keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
--keymap.set('n', '<C-A>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- tree toggle mapping
keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')


-- ========= toggleterm settings ==========
-- By applying the mappings this way you can pass a count to your
-- mapping to open a specific window.
-- For example: 2<C-t> will open terminal 2
keymap.set('n', '<silent><leader>tt', '<Cmd>exe v:count1 . "ToggleTerm"<CR>')
keymap.set('n', '<silent><leader>gg', '<Cmd>lua _LAZYGIT_TOGGLE()<CR>')
-- inoremap <silent><leader>tt <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
-- nnoremap <silent><leader>gg <Cmd>lua _LAZYGIT_TOGGLE()<CR
