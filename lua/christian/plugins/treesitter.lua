-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- import nvim-treesitter-parsers plugin safely
local parsers_status, parsers = pcall(require, "nvim-treesitter.parsers")
if not parsers_status then
	return
end

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"markdown_inline",
		"svelte",
		"graphql",
		"go",
		"templ",
		"bash",
		"lua",
		"vim",
		"vue",
		"php",
		"dockerfile",
		"gitignore",
		"python",
	},
	-- auto install above language parsers
	auto_install = true,
})

vim.filetype.add({
	extension = {
		templ = "templ",
	},
})
