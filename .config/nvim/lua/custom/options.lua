local opt = vim.opt
opt.spelllang = "en_gb"
opt.spell = true
--shell related
-- opt.shell = "bash"
-- opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -c [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
-- opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
-- opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
-- opt.shellquote = ""
-- opt.shellxquote = ""
-- opt.shell = "cmd"
--

opt.undodir = os.getenv "HOME" .. "/.nvim/undodir"

opt.scrolloff = 8

opt.incsearch = true
opt.updatetime = 50
