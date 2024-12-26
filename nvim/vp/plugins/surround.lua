return function ()
	require	("nvim-surround").setup({
		surrounds = {
			["("] = {
				add = { "(", ")" },
				find = function()
					return M.get_selection({ motion = "a(" })
				end,
				delete = "^(. ?)().-( ?.)()$",
			},
			[")"] = {
				add = { "(", ")" },
				find = function()
					return M.get_selection({ motion = "a)" })
				end,
				delete = "^(.)().-(.)()$",
			},
		}
	})
end
