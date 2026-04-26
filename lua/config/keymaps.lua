local map = vim.keymap.set

map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>Q", "<cmd>qa!<cr>", { desc = "Quit all" })

map("n", "<leader>e", "<cmd>Neotree reveal left toggle<cr>", { desc = "Explorer" })

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find word under cursor" })

map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
map("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Git branches" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })
map("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Git status" })
map("n", "<leader>gd", "<cmd>Gitsigns diffthis<cr>", { desc = "Git diff" })
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview hunk" })
map("n", "<leader>gh", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Reset hunk" })

map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "gR", vim.lsp.buf.references, { desc = "References" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover docs" })

map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line diagnostics" })
map("n", "<leader>lj", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>lk", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
map("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LSP info" })

map("n", "<leader>cf", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file" })

map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics" })
map("n", "<leader>xw", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer diagnostics" })
map("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols" })
map("n", "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP list" })
map("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix list" })

local ok_dap, dap = pcall(require, "dap")
if ok_dap then
  map("n", "<F5>", dap.continue, { desc = "Debug continue" })
  map("n", "<F10>", dap.step_over, { desc = "Debug step over" })
  map("n", "<F11>", dap.step_into, { desc = "Debug step into" })
  map("n", "<F12>", dap.step_out, { desc = "Debug step out" })
  map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
  map("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { desc = "Conditional breakpoint" })
  map("n", "<leader>dc", dap.continue, { desc = "Continue" })
  map("n", "<leader>dr", dap.repl.open, { desc = "Debug REPL" })
  map("n", "<leader>dl", dap.run_last, { desc = "Run last" })
  map("n", "<leader>du", function() require("dapui").toggle({}) end, { desc = "Toggle debug UI" })
  map("n", "<leader>dt", function() dap.terminate() end, { desc = "Terminate debug" })
end

map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Float terminal" })
map("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "Horizontal terminal" })
map("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "Vertical terminal" })

map("n", "<C-h>", "<C-w>h", { desc = "Move left" })
map("n", "<C-j>", "<C-w>j", { desc = "Move down" })
map("n", "<C-k>", "<C-w>k", { desc = "Move up" })
map("n", "<C-l>", "<C-w>l", { desc = "Move right" })

map("n", "<leader>wh", "<cmd>vertical resize -5<cr>", { desc = "Resize left" })
map("n", "<leader>wl", "<cmd>vertical resize +5<cr>", { desc = "Resize right" })
map("n", "<leader>wj", "<cmd>resize -3<cr>", { desc = "Resize down" })
map("n", "<leader>wk", "<cmd>resize +3<cr>", { desc = "Resize up" })

map("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New tab" })
map("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "Only tab" })
map("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "Close tab" })
map("n", "<leader>tp", "<cmd>tabprevious<cr>", { desc = "Prev tab" })
map("n", "<leader>tl", "<cmd>tabnext<cr>", { desc = "Next tab" })

map("i", "jk", "<Esc>", { desc = "Escape insert mode" })
