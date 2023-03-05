" VimShowHlGroup: Show highlight group name under a cursor
command! VimShowHlGroup echo synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')

lua <<EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = { 
		'javascript',
		'typescript',
		'vue',
		'tsx',
		'scss',
		'css',
		'html'
	},
	sync_install = true,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = false,

	highlight = {
		enable = true, -- syntax highlightを有効にする
		disable = {     -- 一部の言語では無効にする
			'help',
			'vim'
		  -- 'lua',
		  -- 'ruby',
		  -- 'toml',
		  -- 'c_sharp',
		  -- 'vue',
		}
	},
	indent = {
		enable = true, -- これを設定することでtree-sitterによるインデントを有効にできます
		disable = {     -- 一部の言語では無効にする
			-- 'php',
			-- 'vue'
		}
	}
}

vim.api.nvim_set_hl(0, "@foo.bar", { link = "Statement" })

-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

EOF

