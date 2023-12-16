local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s({ filetype = "lua", trig = "rqe" }, { t("require('"), i(1), t("')") }),
	s(
		{ filetype = "lua", trig = "fn" },
		{ t("function "), i(1), t(" ("), i(2), t({ ")", "  " }), i(3), t({ "", "end" }) }
	),
}
