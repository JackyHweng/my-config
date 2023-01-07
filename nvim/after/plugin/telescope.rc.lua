local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"
-- local trouble = require("trouble.providers.telescope")
local builtin = require("telescope.builtin")
-- only support linux
-- telescope.load_extension "media_files"
-- require('telescope').extensions.dap.configurations()

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {

    prompt_prefix = "> ",
    selection_caret = " ",
    -- path_display = { "smart" },
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",

    layout_config = {
      horizontal = {
        prompt_position = "bottom",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    winblend = 0,
    -- border = {},
    -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    -- borderchars = {
    --   prompt = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' };
    --   results = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' };
    --   preview = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' };
    -- },
    -- borderchars = {
    --   prompt = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' };
    --   results = { ' ', '▐', '▄', '▌', '▌', '▐', '▟', '▙' };
    --   preview = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' };
    -- },
    color_devicons = true,
    -- use_less = true,
    -- set_env = { ["COLORTERM"] = "gruvbox" }, -- default = nil,
    -- file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    -- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    dynamic_preview_title = true,
    results_title = false,

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,
        --
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-s>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
        -- ["<c-t>"] = trouble.open_with_trouble,
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-s>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
        -- ["<c-t>"] = trouble.open_with_trouble,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
    aerial = {
      -- Display symbols as <root>.<parent>.<symbol>
      show_nesting = {
        ['_'] = false, -- This key will be the default
        json = true, -- You can set the option for specific filetypes
        yaml = true,
      }
    }
  },
}

-- telescope find files
vim.keymap.set('n', ';f',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)

-- telescope live files
vim.keymap.set('n', ';r', function()
  builtin.live_grep()
end)
-- telescope buffers files
vim.keymap.set('n', '\\\\', function()
  builtin.buffers()
end)
-- telescope help_tags
vim.keymap.set('n', ';t', function()
  builtin.help_tags()
end)
-- telescope resume
vim.keymap.set('n', ';;', function()
  builtin.resume()
end)
vim.keymap.set('n', ';e', function()
  builtin.diagnostics()
end)
telescope.load_extension("file_browser")
vim.keymap.set("n", "sf", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)


telescope.load_extension("aerial")
