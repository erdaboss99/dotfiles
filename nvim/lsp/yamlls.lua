return {
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml" },
	settings = {
		yaml = {
			schemastore = { enable = true, url = "" },
		},
	},
}
