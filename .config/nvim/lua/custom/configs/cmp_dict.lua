local dict = require("cmp_dictionary")

dict.setup({
  -- The following are default values.
  exact = 6,
  first_case_insensitive = true,
  document = false,
  document_command = "wn %s -over",
  async = true,
  sqlite = false,
  max_items = 5,
  capacity = 5,
  debug = false,
})
dict.switcher({
  spelllang={
    en_gb="/usr/share/dict/my.dict",
    en="/usr/share/dict/my.dict"
  }
})
dict.update()
