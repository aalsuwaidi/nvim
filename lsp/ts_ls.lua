return {
	on_new_config = function(new_config, _)
		table.insert(new_config.filetypes, "svelte")
	end,
}
