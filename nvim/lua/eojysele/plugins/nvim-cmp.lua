return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local cmp = require('cmp')
		cmp.setup {
			sources = {
				{ name = 'nvim_lsp' },
			},
			window = {
				completion = {
					border = "rounded",
					scrollbar = false,
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
					side_padding = 0
				},
				documentation = {
					border = "rounded",
					scrollbar = false,
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
				}
			},
			mapping = cmp.mapping.preset.insert({
				['<C-y>'] = cmp.mapping.scroll_docs(-4),
				['<C-e>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<CR>'] = cmp.mapping.confirm {
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				},
				['<Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						fallback()
					end
				end, { 'i', 's' }),
				['<S-Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						fallback()
					end
				end, { 'i', 's' }),
			}),
		}
	end
}
