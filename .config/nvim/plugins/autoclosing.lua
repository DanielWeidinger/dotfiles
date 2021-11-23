require('nvim-autopairs').setup{}

-- To automatically enter a ( after selection a function
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  }
}
-- require('nvim-ts-autotag').setup{}



