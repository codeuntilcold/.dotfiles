return {
	{
		'theprimeagen/harpoon',
		branch = 'harpoon2',
		event = 'VeryLazy',
		config = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			vim.keymap.set("n", "<leader>a", mark.add_file)
			vim.keymap.set("n", "<leader>t", ui.toggle_quick_menu)

			vim.keymap.set("n", "<leader>ay", function() ui.nav_file(1) end)
			vim.keymap.set("n", "<leader>au", function() ui.nav_file(2) end)
			vim.keymap.set("n", "<leader>ai", function() ui.nav_file(3) end)
			vim.keymap.set("n", "<leader>ao", function() ui.nav_file(4) end)
		end
	}
}
