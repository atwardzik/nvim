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


local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end


-- setup harpoon
local harpoon = require('harpoon')
harpoon:setup()

vim.keymap.set("n", "<leader>hp", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
vim.keymap.set("n", "<leader>A", function() harpoon:list():add() end, {desc = "harpoon file" })
vim.keymap.set("n", "<leader>a", function() local harpoon = harpoon harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "harpoon quick menu" })
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "harpoon to file 1" })
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "harpoon to file 2" })
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "harpoon to file 3" })
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "harpoon to file 4" })
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "harpoon to file 5" })
vim.keymap.set("n", "<leader>hr", function() harpoon:list():remove() end, { desc = "remove current buffer from harpoon" })

-- setup code action
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true, silent = true})


-- setup conform formatter
vim.api.nvim_create_user_command("Format", function()
  require("conform").format()
end, {})
vim.keymap.set("n", "<leader>ft", require("conform").format, { desc = "Run formatter" })
