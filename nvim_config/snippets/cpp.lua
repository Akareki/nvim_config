local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

local function copy(args, parent)
  return args[1][1]
end

ls.add_snippets("cpp", {
  s({ trig = "ftft", name = "ft_function", desc = "Normed ft_function", priority = 10000 }, {
    i(1, "type"),
    t("	"),
    i(2),
    t("ft_"),
    i(3),
    t("("),
    i(4, "args"),
    t(")"),
    t({ "", "{", "" }),
    t("	"),
    i(0),
    t({ "", "}" }),
  }),
  s({ trig = "while", name = "while loop", desc = "Normed while loop", priority = 10000 }, {
    t("while ("),
    i(1, "cond"),
    t(")"),
    t({ "", "{", "" }),
    t("	"),
    i(0),
    t({ "", "}" }),
  }),
  s({ trig = "whileone", name = "one line while loop", desc = "Normed one line while loop", priority = 10000 }, {
    t("while ("),
    i(1, "cond"),
    t({ ")", "" }),
    t("	"),
    i(0),
  }),
  s({ trig = "iff", name = "if loop", desc = "Normed if loop", priority = 10000 }, {
    t("if ("),
    i(1, "cond"),
    t(")"),
    t({ "", "{", "" }),
    t("	"),
    i(0),
    t({ "", "}" }),
  }),
  s({ trig = "ifone", name = "one line if loop", desc = "Normed one line if loop", priority = 10000 }, {
    t("if ("),
    i(1, "cond"),
    t({ ")", "" }),
    t("	"),
    i(0),
  }),
  s({ trig = "struct", name = "typedef struct", desc = "Normed typedef struct", priority = 10000 }, {
    t("typedef struct	s_"),
    i(1, "struct_name"),
    t({ "", "{", "" }),
    t("	"),
    i(0),
    t({ "", "}				t_" }),
    f(copy, { 1 }),
    t(";"),
  }),
  s({ trig = "maina", name = "main with args", desc = "Normed main with argc and argv", priority = 10000 }, {
    t({ "int	main(int argc, char **argv)", "" }),
    t({ "{", "" }),
    t("	"),
    i(0),
    t({ "", "}" }),
  }),
  s({ trig = "main", name = "main without args", desc = "Normed main without argc and argv", priority = 10000 }, {
    t({ "int	main(void)", "" }),
    t({ "{", "" }),
    t("	"),
    i(0),
    t({ "", "}" }),
  }),
	s({trig = "include", name = "\"\" include", desc = "Include local library", priority = 10000}, {
		t({"#include \""}),
		i(0),
		t({"\""}),
	}),
	s({trig = "include", name = "<> include", desc = "Include external library", priority = 10000}, {
		t({"#include <"}),
		i(0),
		t({">"}),
	}),
	s({trig = "Class", name = "Class", desc = "Canonical class form", priority = 10000}, {
		t("class "), i(1, "ClassName"),
		t({ "", "{", "" }),
		t({"	public:", ""}),
		t("		"), extras.rep(1), t({"();", ""}),
		t("		"), extras.rep(1), t("(const "), extras.rep(1), t({"&);", ""}),
		t("		~"), extras.rep(1), t({"();", ""}),
		t("		"), extras.rep(1), t(" &operator=(const "), extras.rep(1), t({"&);", ""}),
		t({"	private:", ""}),
		t("		"), i(0),
		t({ "", "};" }),
	}),
	s({trig = "guard", name = "include guard", desc = "Multiple include protection", priority = 10000}, {
		t("#ifndef "), i(1),
		t({"", "# define "}), extras.rep(1), t({"", ""}),
		t(""), i(0),
		t({"", "#endif"}),
	})
})

