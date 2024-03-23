local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		formatting.prettier.with({
			condition = function(utils)
				return utils.root_has_file({
					".prettierrc",
					".prettierrc.json",
					".prettierrc.yaml",
					".prettierrc.yml",
					".prettierrc.js",
					".prettierrc.cjs",
					"prettier.config.js",
					"prettier.config.cjs",
					".prettierrc.toml",
					".prettierrc.json5",
					".prettierrc.jsonc",
					".prettierrc.hjson",
				})
			end,
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"jsonc",
				"yaml",
				"markdown",
				"markdown.mdx",
				"graphql",
				"handlebars",
				"blade",
			},
		}),
		formatting.stylua,
		formatting.pint,
		formatting.blade_formatter,
		formatting.markdownlint,
		formatting.gofumpt,
		formatting.goimports,
		formatting.rustywind.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"svelte",
				"html",
				"blade",
			},
		}),
		diagnostics.eslint_d.with({ -- js/ts linter
			-- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
			condition = function(utils)
				return utils.root_has_file({
					".eslintrc.js",
					".eslintrc.cjs",
					".eslintrc.yaml",
					".eslintrc.yml",
					".eslintrc.json",
					".eslintrc",
				}) -- change file extension if you use something else
			end,
		}),
		-- diagnostics.phpcs,
		diagnostics.gitlint,
		diagnostics.golangci_lint,
		diagnostics.pylint,
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
