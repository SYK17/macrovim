return {
  {
  'SYK17/Mies.vim',
    lazy = false,
    priority = 1000,
    config = function()
     vim.cmd([[colorscheme mies]])
 end,
},

{'SYK17/rams.vim',
    config = function()
        vim.cmd([[colorscheme rams]])
 end,
},

{
  'SYK17/candle-grey',
    config = function()
      vim.cmd([[colorscheme candle-grey-transparent]])
 end,
},

}
