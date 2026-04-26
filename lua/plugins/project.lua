return {
	{
		"ahmedkhalf/project.nvim",
		event = "VeryLazy",
		opts = {
			detection_methods = { "pattern" },
			patterns = {
				".git",
				"package.json",
				"pnpm-workspace.yaml",
				"composer.json",
				"nuxt.config.ts",
				"nuxt.config.js",
				"adonisrc.ts",
			},
			show_hidden = true,
			silent_chdir = true,
		},
		config = function(_, opts)
			require("project_nvim").setup(opts)
			require("telescope").load_extension("projects")
		end,
	},
}
