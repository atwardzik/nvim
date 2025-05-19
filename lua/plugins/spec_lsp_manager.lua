return {
        'mason-org/mason.nvim',
        'mason-org/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        config = function()
                require('mason').setup()
		require('mason-lspconfig').setup({
                        ensure_installed = { "clangd", "clang-format", "asm-lsp" },
                })

		require('lspconfig').clangd.setup({
			cmd = {
				-- see clangd --help-hidden
				"clangd",
				"--background-index",
				-- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
				-- to add more checks, create .clang-tidy file in the root directory
				-- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
				"--clang-tidy",
				"--completion-style=bundled",
				"--cross-file-rename",
				"--header-insertion=iwyu",
			},
		})
        end,
}
