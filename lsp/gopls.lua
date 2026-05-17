return {
	root_markers = { "go.work", "go.mod" },
	settings = {
		gopls = {
			directoryFilters = {
				"-vendor",
				"-.git",
				"-.DS_Store",
				"-node_modules",
			},
			completeUnimported = true,
			analyses = {
				unusedparams = true,
				shadow = true,
			},
			staticcheck = true,
			gofumpt = true,
			expandWorkspaceToModule = true,
		},
	},
}
