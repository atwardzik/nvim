-- disable netrw at the very start of your init.lua - for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")

require("nvim-tree").setup()
require("mason").setup()
require("mason-lspconfig").setup()
require("conform").setup()
require("autoclose").setup()



-- init vim
vim.wo.number = true            -- lines numbering
vim.opt.wrap = false            -- disable wrapping lines
vim.opt.clipboard="unnamedplus" -- enable clipboard for macos
vim.opt.tabstop = 8             -- set tab to be 8 spaces
vim.opt.expandtab = true        -- 


-- setup go to definition to use LSP
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })


-- setup nvim-tree
vim.keymap.set("n", "<leader>tr", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle nvim tree" })


-- setup telescope
local builtin = require('telescope.builtin')

vim.keymap.set("n", "<leader>ld", function()
        builtin.diagnostics(require("telescope.themes").get_dropdown({
                previewer = true,
                wrap_results = true,
                line_width = 'full',
        }))
        end,
        { desc = "Telescope Diagnostics (Dropdown)" }
)

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Telescope git status' })


-- setup conform formatter
vim.api.nvim_create_user_command("Format", function()
  require("conform").format()
end, {})
vim.keymap.set("n", "<leader>ft", require("conform").format, { desc = "Run formatter" })
