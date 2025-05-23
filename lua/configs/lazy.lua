local M = {}

function M.setup()
    -- Install `lazy.nvim` plugin manager if not present
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        local out = vim.fn.system({
            "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath,
        })
        if vim.v.shell_error ~= 0 then
            error("Error cloning lazy.nvim:\n" .. out)
        end
    end

    vim.opt.rtp:prepend(lazypath)

    require("lazy").setup({
        spec = {
            { import = "plugins" },
        },
        defaults = {
            lazy = false,
            version = false, -- always use the latest git commit
        },
        checker = {
            enabled = true, -- check for plugin updates periodically
            notify = false, -- notify on update
        },
        ui = {
            border = "rounded",
        },
    })
end

return M
