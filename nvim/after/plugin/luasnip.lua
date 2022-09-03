local ls = require("luasnip")

ls.config.set_config({
  history = true,
  updateevents = "TextChanged, TextChangedI"
})

ls.filetype_extend("javascript", { "javascriptreact" })
ls.filetype_extend("javascript", { "html" })

require("luasnip.loaders.from_vscode").load({ include = { "html" } })
require("luasnip.loaders.from_vscode").lazy_load()
