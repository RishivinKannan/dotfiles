return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
        local config = {
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            background = { -- :h background
                light = "latte",
                dark = "mocha",
            },
            transparent_background = true, -- disables setting the background color.
            show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
            term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
            dim_inactive = {
                enabled = false, -- dims the background color of inactive window
                shade = "dark",
                percentage = 0.15, -- percentage of the shade to apply to the inactive window
            },
            no_italic = false, -- Force no italic
            no_bold = false, -- Force no bold
            no_underline = false, -- Force no underline
            styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
                comments = { "italic" }, -- Change the style of comments
                conditionals = { "italic" },
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
                -- miscs = {}, -- Uncomment to turn off hard-coded styles
            },
            color_overrides = {},
            custom_highlights = {},
            default_integrations = true,
            integrations = {
                cmp = true,
                fzf = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                notify = false,
                noice = true,
                mini = {
                    enabled = true,
                    indentscope_color = "",
                },
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
            },
        }
        local cat = require("catppuccin")
        cat.setup(config)

        -- setup must be called before loading
        vim.cmd.colorscheme("catppuccin-mocha")

        local set_diagnostics_bg_transparency = function()
            vim.cmd([[highlight DiagnosticVirtualTextError guibg=none]])
            vim.cmd([[highlight DiagnosticVirtualTextWarn guibg=none]])
            vim.cmd([[highlight DiagnosticVirtualTextInfo guibg=none]])
            vim.cmd([[highlight DiagnosticVirtualTextHint guibg=none]])
        end

        set_diagnostics_bg_transparency()

        local toggle_transparency = function()
            config.transparent_background = not config.transparent_background
            cat.setup(config)
            cat.load()
            set_diagnostics_bg_transparency()
        end

        vim.keymap.set(
            "n",
            "<leader>bg",
            toggle_transparency,
            { noremap = true, silent = true, desc = "bg toggle_transparency" }
        )
    end,
}
