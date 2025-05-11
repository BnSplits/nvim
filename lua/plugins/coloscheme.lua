return {
    'BnSplits/tokyogruv.nvim',
    opts = {
        -- Your custom options here
    },
    config = function(_, opts)
        require('tokyogruv').setup(opts) -- Setup is optional
        vim.cmd [[colorscheme tokyogruv]]
    end,
}
