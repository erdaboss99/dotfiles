local map = vim.keymap.set
local opts = function(desc) return { desc = desc, noremap = true, silent = true, nowait = true } end

require("mini.comment").setup {
	mappings = { comment = "", comment_line = "<C-_>", comment_visual = "<C-_>" },
}

require("mini.surround").setup()

require("cloak").setup {
	enabled = true,
	patterns = {
		{
			file_pattern = "*.md",
			cloak_pattern = {
				"(.*(PASSWORD))(.+)",
				"(.*(TOKEN))(.+)",
				"(.*(KEY))(.+)",
				"(.*(S3Bucket))(.+)",
			},

			replace = "%1",
		},
		{
			file_pattern = "*.env",
			cloak_pattern = {
				"(.*(PASSWORD))(.+)",
				"(.*(TOKEN))(.+)",
				"(.*(KEY))(.+)",
				"(.*(S3Bucket))(.+)",
			},
			replace = "%1",
		},
	},
}
map("n", "<leader>tc", "<CMD>CloakToggle<CR>", opts "Toggle cloak")
map("n", "<leader>tp", "<CMD>CloakPreviewLine<CR>", opts "Toggle cloak preview")
