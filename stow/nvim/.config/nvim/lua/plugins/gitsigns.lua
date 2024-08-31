return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup({
			current_line_blame = false,
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					opts.desc = opts.desc or ""
					vim.keymap.set(mode, l, r, opts)
				end

				-- navigation
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.next_hunk()
					end
				end, { desc = "Git: Go to next hunk" })

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.prev_hunk()
					end
				end, { desc = "Git: Go to previous hunk" })

				-- actions
				map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Git: Stage hunk" })
				map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Git: Reset hunk" })

				map("v", "<leader>hs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Git: Stage selected hunk" })

				map("v", "<leader>hr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Git: Reset selected hunk" })

				map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Git: Stage entire buffer" })
				map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "Git: Undo stage hunk" })
				map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Git: Reset entire buffer" })
				map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Git: Preview hunk" })

				map("n", "<leader>hb", function()
					gitsigns.blame_line({ full = true })
				end, { desc = "Git: Blame line" })

				map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Git: Toggle blame for current line" })
				map("n", "<leader>hd", gitsigns.diffthis, { desc = "Git: Diff against index" })

				map("n", "<leader>hD", function()
					gitsigns.diffthis("~")
				end, { desc = "Git: Diff against previous commit" })

				map("n", "<leader>td", gitsigns.toggle_deleted, { desc = "Git: Toggle deleted lines" })

				-- text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Git: Select hunk" })
			end,
		})
	end,
}
