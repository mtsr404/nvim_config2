require'nvim-treesitter.configs'.setup {
	ensure_installed = { 
		'tsx',
		'javascript',
		'typescript',
		'html',
		'php',
	},
	sync_install = false,

	parser_install_dir = '/Users/mtsr404/.config2/nvim/.cache/persers',

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = false,

	highlight = {
		enable = true, -- syntax highlightを有効にする

		disable = {     -- 一部の言語では無効にする
		-- vueはscoped付きのstyleタグに対してinjectionが上手く機能しないので無効化 <style lang="scss" scoped>
		-- 'vue',
		-- cssとscssはセレクタの色を上手く設定できないので無効化
		-- 'scss',
		-- 'css',
		},

		custom_captures = {
			-- Highlight the @foo.bar capture group with the "Identifier" highlight group.
			-- ["tag"] = "Statement",
		},

	},
	indent = {
		enable = true, -- これを設定することでtree-sitterによるインデントを有効にできます
		disable = {     -- 一部の言語では無効にする
			-- 'php',
			'vue',
			'scss',
			'css',
		}
	},
	autotag = {
		enable = true,
	}
}


vim.opt.runtimepath:append("/Users/mtsr404/.config2/nvim/.cache/persers")

-- vim.api.nvim_set_hl(0, "@tag", { link = "Identifier" })

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
--
--
-- https://zenn.dev/vim_jp/articles/2022-12-25-vim-nvim-treesitter-2022-changes-
-- queryファイルを上書きしたい場合、TSEditQueryUserAfter {module} {lang}でファイルを開き、冒頭に以下をつける
-- ;; extends 
