return {
        'stevearc/conform.nvim',
        opts = {},
        config = function()
                require('conform').setup({
                        formatters_by_ft = {
                                cpp = { 'clang_format' },
                                c = { 'clang_format' },
                        }
                })
        end
}
