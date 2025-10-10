return {
  'ARM9/arm-syntax-vim',
  -- ft = { 'arm', 'asm' },
  config = function()
    -- Set .s/.S files to ARM filetype explicitly
    vim.cmd([[ au BufNewFile,BufReadPost *.s,*.S set filetype=arm ]])
  end,
}
