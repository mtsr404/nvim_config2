lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = false,  -- syntax highlightを有効にする
    disable = {     -- 一部の言語では無効にする
      -- 'lua',
      -- 'ruby',
      -- 'toml',
      -- 'c_sharp',
      -- 'vue',
    }
  },
  indent = {
    enable = true, -- これを設定することでtree-sitterによるインデントを有効にできます
  }
}
EOF
