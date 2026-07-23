local ROOT_MARKERS = { "tsconfig.json", "jsconfig.json", "package.json", ".git" }

local function local_bin(root_dir, bin)
	if root_dir then
		local local_cmd = vim.fs.joinpath(root_dir, "node_modules", ".bin", bin)
		if vim.fn.executable(local_cmd) == 1 then return local_cmd end
	end

	return bin
end

local function detect_local_ts_major(root_dir)
	if not root_dir then return nil end

	local pkg_path = vim.fs.joinpath(root_dir, "node_modules", "typescript", "package.json")
	local ok, content = pcall(vim.fn.readfile, pkg_path)
	if not ok or not content or #content == 0 then return nil end

	local decoded = vim.json.decode(table.concat(content, "\n"))
	if decoded and decoded.version then return tonumber(decoded.version:match("^(%d+)")) end

	return nil
end

return {
	cmd = function(dispatchers, config)
		local root_dir = config and config.root_dir or nil
		local ts_major = detect_local_ts_major(root_dir)

		if ts_major and ts_major >= 7 then
			local tsc_cmd = local_bin(root_dir, "tsc")
			return vim.lsp.rpc.start({ tsc_cmd, "--lsp", "--stdio" }, dispatchers)
		end

		local tsls_cmd = local_bin(root_dir, "typescript-language-server")
		return vim.lsp.rpc.start({ tsls_cmd, "--stdio" }, dispatchers)
	end,
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		local tsconfig = vim.fs.find({ "tsconfig.json", "jsconfig.json" }, { path = fname, upward = true })[1]
		local root = vim.fs.find(ROOT_MARKERS, { path = fname, upward = true })[1]
		on_dir(vim.fs.dirname(tsconfig or root) or vim.fn.getcwd())
	end,
	settings = {
		typescript = {
			updateImportsOnFileMove = { enabled = "always" },
			suggest = {
				completeFunctionCalls = true,
			},
			inlayHints = {
				enumMemberValues = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = false },
				propertyDeclarationTypes = { enabled = false },
				variableTypes = { enabled = false },
			},
		},
	},
}
