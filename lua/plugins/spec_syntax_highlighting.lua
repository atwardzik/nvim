return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { 'c', 'asm', 'lua', 'python', 'rust', 'cpp' },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    })
  end,
}

