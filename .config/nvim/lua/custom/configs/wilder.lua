local present, wilder = pcall(require, "wilder")

if not present then
  return
end
wilder.setup { modes = { ":", "/", "?" } }
local turqoise_gradient = {"#b3ecec","#89ecda","#43e8d8","#40e0d0","#3bd6c6"}
local blue_gradient = {"#0f5e9c","#2389da","#1ca3ec","#5abcd8","#74ccf4"}
local purple_gradient={"#f2f0f7","#dadaeb","#bcbddc","#9e9ac8","#756bb1","#54278f"}
local GnBu_gradient={"#f0f9e8","#bae4bc","#7bccc4","#43a2ca","#0868ac"}
local gradient = GnBu_gradient 
for i, fg in ipairs(gradient) do
  gradient[i] = wilder.make_hl('WilderGradient' .. i, 'Pmenu', {{a = 1}, {a = 1}, {foreground = fg}})
end

wilder.set_option('use_python_remote_plugin', 0)

wilder.set_option('pipeline', {
  wilder.branch(
    wilder.cmdline_pipeline({
      fuzzy = 2,
      fuzzy_filter = wilder.lua_fzy_filter(),
    }),
    wilder.vim_search_pipeline()
  )
})

wilder.set_option('renderer', wilder.renderer_mux({
  [':'] = wilder.popupmenu_renderer({
    highlighter = wilder.lua_fzy_highlighter(),
    left = {
      ' ',
      wilder.popupmenu_devicons()
    },
    right = {
      ' ',
      wilder.popupmenu_scrollbar()
    },
  }),
  ['/'] = wilder.wildmenu_renderer({
    highlighter = wilder.lua_fzy_highlighter(),
  }),
})) 
local highlighters =wilder.highlighter_with_gradient({
  wilder.pcre2_highlighter(),
  wilder.lua_fzy_highlighter(),
})
local highlights = {
  -- accent = wilder.make_hl("WilderAccent", "Pmenu", { { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }),
  gradient=gradient,
}

local popupmenu_renderer = wilder.popupmenu_renderer(wilder.popupmenu_border_theme {
  border = "rounded",
  empty_message = wilder.popupmenu_empty_message_with_spinner(),
  highlighter = highlighters,
  highlights = highlights,
  left = {
    " ",
    wilder.popupmenu_devicons(),
    wilder.popupmenu_buffer_flags {
      flags = " a + ",
      icons = { ["+"] = "", a = "", h = "" },
    },
  },
  right = {
    " ",
    wilder.popupmenu_scrollbar(),
  },
})

local wildmenu_renderer = wilder.wildmenu_renderer {
  highlights = highlights,
  highlighter = highlighters,
  separator = " · ",
  left = { " ", wilder.wildmenu_spinner(), " " },
  right = { " ", wilder.wildmenu_index() },
}
wilder.set_option(
  "renderer",
  wilder.renderer_mux {
    [":"] = popupmenu_renderer,
    ["/"] = wildmenu_renderer,
    substitute = wildmenu_renderer,
  }
)
