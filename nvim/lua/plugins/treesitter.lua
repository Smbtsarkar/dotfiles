-- Ensure plugin is installed
 local ts_status, ts = pcall(require, "nvim-treesitter.configs")
 if not ts_status then
     return
 end

 ts.setup({
    highlight = { enable = true },
    indent = { enable = true },
    autotag = { enable = true },
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "html",
        "javascript",
        "json",
        "json5",
        "lua",
        "markdown",
        "python",
        "regex",
        "vim",
        "gitignore",
        "typescript",
        "graphql",
        "markdown",
        "markdown_inline"
    },
    auto_install = true
 })
