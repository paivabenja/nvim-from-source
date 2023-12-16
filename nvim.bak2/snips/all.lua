local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {}, {
	s({ filetype = "tsx", trig = "clg" }, { t("console.log('"), i(1), t("')") }),
	s({ filetype = "ts", trig = "clg" }, { t("console.log('"), i(1), t("')") }),
	s({ filetype = "jsx", trig = "clg" }, { t("console.log('"), i(1), t("')") }),
	s({ filetype = "js", trig = "clg" }, { t("console.log('"), i(1), t("')") }),
}
