return {
    {
        "ThePrimeagen/harpoon",
        event = "VimEnter",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup()

            vim.keymap.set("n", "<leader>a", function()
                harpoon:list():add()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end, { desc = 'Harpoon [A]dd' })
            vim.keymap.set("n", "<leader>ht", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
                { desc = '[H]arpoon [T]oggle List' })

            vim.keymap.set("n", "<leader>hh", function() harpoon:list():select(1) end, { desc = '[H]arpoon 1' })
            vim.keymap.set("n", "<leader>hj", function() harpoon:list():select(2) end, { desc = '[H]arpoon 2' })
            vim.keymap.set("n", "<leader>hk", function() harpoon:list():select(3) end, { desc = '[H]arpoon 3' })
            vim.keymap.set("n", "<leader>hl", function() harpoon:list():select(4) end, { desc = '[H]arpoon 4' })
            vim.keymap.set("n", "<leader>h;", function() harpoon:list():select(5) end, { desc = '[H]arpoon 5' })
        end
    }
}
