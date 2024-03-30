local nnoremap = require("user.keymap_utils").nnoremap
local vnoremap = require("user.keymap_utils").vnoremap
local inoremap = require("user.keymap_utils").inoremap
local tnoremap = require("user.keymap_utils").tnoremap
local xnoremap = require("user.keymap_utils").xnoremap
local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")
local conform = require("conform")
local utils = require("user.utils")

local M = {}

local TERM = os.getenv("TERM")

-- Normal --
-- Disable spacebar since it will be used ad leader key
nnoremap("<space>", "<nop>")


-- Window + better kitty navigation
nnoremap("<C-j>", function()
  if vim.fn.exists(":KittyNavigationDown") ~= 0 and TERM == "xterm-kitty" then
    vim.cmd.KittyNavigationDown()
  elseif vim.fn.exists(":NvimTmuxNavigationDown") ~= 0 then
    vim.cmd.NvimTmuxNavigationDown()
  else
    vim.cmd.wincmd("j")
  end
end)

nnoremap("<C-k>", function()
	if vim.fn.exists(":KittyNavigateUp") ~= 0 and TERM == "xterm-kitty" then
		vim.cmd.KittyNavigateUp()
	elseif vim.fn.exists(":NvimTmuxNavigateUp") ~= 0 then
		vim.cmd.NvimTmuxNavigateUp()
	else
		vim.cmd.wincmd("k")
	end
end)

nnoremap("<C-l>", function()
	if vim.fn.exists(":KittyNavigateRight") ~= 0 and TERM == "xterm-kitty" then
		vim.cmd.KittyNavigateRight()
	elseif vim.fn.exists(":NvimTmuxNavigateRight") ~= 0 then
		vim.cmd.NvimTmuxNavigateRight()
	else
		vim.cmd.wincmd("l")
	end
end)

nnoremap("<C-h>", function()
	if vim.fn.exists(":KittyNavigateLeft") ~= 0 and TERM == "xterm-kitty" then
		vim.cmd.KittyNavigateLeft()
	elseif vim.fn.exists(":NvimTmuxNavigateLeft") ~= 0 then
		vim.cmd.NvimTmuxNavigateLeft()
	else
		vim.cmd.wincmd("h")
	end
end)

-- Swap between two buffers
nnoremap("<leader>", "<C-^>", { desc = "Switch to last buffer" })

-- Save with Leader Key
nnoremap("<leader>w", "<cmd>w<cr>", {silent = false})


-- Quit with leader key
nnoremap("<leader>q", "<cmd>q<cr>")

-- Save and Quit with leader key
nnoremap("<leader>wq", "<cmd>wq<cr>")


-- Map oil to leader key
nnoremap("<leader>e", function()
  require("oil").toggle_float()
end)


-- Center buffer while navigating
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("{", "{zz")
nnoremap("}", "}zz")
nnoremap("N", "Nzz")
nnoremap("n", "nzz")
nnoremap("G", "Gzz")
nnoremap("gg", "ggzz")
nnoremap("<C-i>", "<C-i>zz")
nnoremap("<C-o>", "<C-o>zz")
nnoremap("%", "%zz")
nnoremap("*", "*zz")
nnoremap("#", "#zz")


-- Press 'S' for quick find/replace for the word under the cursor
nnoremap("S", function()
	local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
	local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
	vim.api.nvim_feedkeys(keys, "n", false)
end)


-- Open Spectre for global find/replace
nnoremap("<leader>S", function()
	require("spectre").toggle()
end)


-- Open Spectre for global find/replace for the word under the cursor in normal mode
-- TODO Fix, currently being overriden by Telescope
nnoremap("<leader>sw", function()
	require("spectre").open_visual({ select_word = true })
end, { desc = "Search current word" })


-- Press 'H', 'L' to jump to start/end of a line (first/last char)
nnoremap("<C-e>", "$")
nnoremap("<C-a>", "^")

-- Press 'U' for redo
nnoremap("U", "<C-r>")

-- Turn off highlighted results
nnoremap("<leader>no", "<cmd>noh<cr>")


-- Harpoon keybinds --
-- Open harpoon ui
nnoremap("<leader>ho", function()
	harpoon_ui.toggle_quick_menu()
end)

-- Add current file to harpoon
nnoremap("<leader>ha", function()
	harpoon_mark.add_file()
end)

-- Remove current file from harpoon
nnoremap("<leader>hr", function()
	harpoon_mark.rm_file()
end)

-- Remove all files from harpoon
nnoremap("<leader>hc", function()
	harpoon_mark.clear_all()
end)

-- Quickly jump to harpooned files
nnoremap("<leader>1", function()
	harpoon_ui.nav_file(1)
end)


nnoremap("<leader>2", function()
	harpoon_ui.nav_file(2)
end)

nnoremap("<leader>3", function()
	harpoon_ui.nav_file(3)
end)

nnoremap("<leader>4", function()
	harpoon_ui.nav_file(4)
end)

nnoremap("<leader>5", function()
	harpoon_ui.nav_file(5)
end)

-- git key maps
nnoremap("<leader>gb", ":Gitsigns toggle_current_line_blame<cr>")
nnoremap("<leader>gf", function()
  local cmd = {
    "sort",
		"-u",
		"<(git diff --name-only --cached)",
		"<(git diff --name-only)",
		"<(git diff --name-only --diff-filter=U)",
  }
  if not utils.is_git_directory() then
    vim.notify(
      "Current project is not a git directory",
      vim.log.levels.WARN,
      { title = "Telescope Git Files", git_command = cmd }
    )
  else
    require("telescope.builtin").git_files()
  end
end, { desc = "Search [G]it [F]iles" })


-- Telescope keybinds --
nnoremap("<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
nnoremap("<leader>sb", require("telescope.builtin").buffers, { desc = "[S]earch Open [B]uffers" })
nnoremap("<leader>sf", function()
	require("telescope.builtin").find_files({ hidden = true })
end, {desc = "[S]earch [F]iles"})
nnoremap("<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
nnoremap("<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })

nnoremap("<leader>sc", function()
  require("telescope.builtin")
  .commands(
    require("telescope.themes")
    .get_dropdown({previewer = false})
  )
end, {desc = "[S]earch [C]ommands"})

-- Current Buffer Fuzzy Find
nnoremap("<leader>/", function()
	require("telescope.builtin")
  .current_buffer_fuzzy_find(
    require("telescope.themes")
    .get_dropdown({previewer = false})
  )
end, { desc = "[/] Fuzzily search in current buffer]" })

-- Spelling Suggestions
nnoremap("<leader>ss", function()
	require("telescope.builtin")
  .spell_suggest(
    require("telescope.themes")
    .get_dropdown({previewer = false})
  )
end, { desc = "[S]earch [S]pelling suggestions" })


-- LSP Keybinds
M.map_lsp_keybinds = function(buffer_name)
  nnoremap("<leader>rn", vim.lsp.buf.rename, { desc = "LSP: [R]e[n]ame", buffer = buffer_number })
  nnoremap("<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: [C]ode [A]ction", buffer = buffer_number })

  nnoremap("gd", vim.lsp.buf.definition, { desc = "LSP: [G]oto [D]efinition", buffer = buffer_number })


  -- Telescope LSP keybinds --
	nnoremap(
		"gr",
		require("telescope.builtin").lsp_references,
		{ desc = "LSP: [G]oto [R]eferences", buffer = buffer_number }
	)

end

return M

