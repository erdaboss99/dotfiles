local M = {
	"echasnovski/mini.comment",
	version = "*",
	event = "BufRead",
}

M.config = function()
	require("mini.comment").setup {
		mappings = {
			comment = "",
			comment_line = "<C-_>",
			comment_visual = "<C-_>",
		},
	}
end

return M
