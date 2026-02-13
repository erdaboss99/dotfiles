local map = vim.keymap.set
local opts = function(desc) return { desc = desc, noremap = true, silent = true, nowait = true } end

vim.g.opencode_opts = {
	auto_fallback_to_embedded = false,
	port = 4096,
}

vim.o.autoread = true

map({ "n" }, "<leader>aa", function() require("opencode").ask() end, { desc = "Ask opencode" })
map({ "n" }, "<leader>as", function() require("opencode").select() end, { desc = "Opencode select" })

map(
	{ "v" },
	"<leader>aa",
	function() require("opencode").ask("@this", { submit = true }) end,
	opts "Ask opencode about selection"
)
