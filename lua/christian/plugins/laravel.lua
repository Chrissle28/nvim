local setup, laravel = pcall(require, "laravel")
if not setup then
	return
end

laravel.setup({
	lsp_server = "intelephense",
	register_user_commands = true,
	features = {
		null_ls = {
			enable = true,
		},
		route_info = {
			enable = true,
			position = "right",
		},
	},
})
