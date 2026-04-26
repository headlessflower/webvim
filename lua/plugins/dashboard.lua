return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-telescope/telescope.nvim",
		},
		opts = function()
			local logo = [[
██╗    ██╗███████╗██████╗ ██╗   ██╗██╗███╗   ███╗
██║    ██║██╔════╝██╔══██╗██║   ██║██║████╗ ████║
██║ █╗ ██║█████╗  ██████╔╝██║   ██║██║██╔████╔██║
██║███╗██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██║██║╚██╔╝██║
╚███╔███╔╝███████╗██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚══╝╚══╝ ╚══════╝╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]]

			logo = string.rep("\n", 2) .. logo .. "\n"

			local function footer()
				local stats = require("lazy").stats()
				local datetime = os.date(" %Y-%m-%d   %H:%M")
				local plugins = " " .. stats.count .. " plugins"
				local startup = " " .. string.format("%.2f ms", stats.startuptime)
				return {
					"",
					datetime,
					plugins .. "  •  " .. startup,
					"WebVim • Gruvbox • Vue/Nuxt/TS",
				}
			end

			return {
				theme = "doom",
				hide = {
					statusline = false,
				},
				config = {
					header = vim.split(logo, "\n"),
					center = {
						{
							icon = "  ",
							desc = "File Explorer",
							key = "e",
							action = "Neotree toggle left",
						},
						{
							icon = "  ",
							desc = "New File",
							key = "n",
							action = "ene | startinsert",
						},
						{
							icon = "  ",
							desc = "Find File",
							key = "f",
							action = "Telescope find_files",
						},
						{
							icon = "󰱼  ",
							desc = "Live Grep",
							key = "g",
							action = "Telescope live_grep",
						},
						{
							icon = "  ",
							desc = "Open Project",
							key = "p",
							action = "Telescope projects",
						},
						{
							icon = "󰉋  ",
							desc = "Recent Projects",
							key = "o",
							action = "Telescope projects",
						},
						{
							icon = "󰉋  ",
							desc = "Recent Projects",
							key = "o",
							action = "lua require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('data') })",
						},
						{
							icon = "󰊢  ",
							desc = "LazyGit",
							key = "l",
							action = "LazyGit",
						},
						{
							icon = "󰒲  ",
							desc = "Lazy",
							key = "z",
							action = "Lazy",
						},
						{
							icon = "  ",
							desc = "Quit",
							key = "q",
							action = "qa",
						},
					},
					footer = footer(),
				},
			}
		end,
	},
}
