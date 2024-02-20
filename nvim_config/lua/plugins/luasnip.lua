return {

  "L3MON4D3/LuaSnip",
  build = (not jit.os:find("Windows"))
      and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
    or nil,
  dependencies = {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/snippets/" } })
    end,
  },
  opts = {
    history = true,
    delete_check_events = "TextChanged",
  },
  -- stylua: ignore
  keys = {
    {
      "<s-tab>",
      function()
        return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<s-tab>"
      end,
      expr = true, silent = true, mode = "i",
    },
    { "<s-tab>", function() require("luasnip").jump(1) end, mode = "s" },
    { "<tab>",
			function()
		return "<tab>"
			end,
		},
  },
}
