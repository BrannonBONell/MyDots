return {
	{
		"robitx/gp.nvim",
		config = function()
			-- For customization, refer to Install > Configuration in the Documentation/Readme
			require("gp").setup({
				providers = {
					openai = {
						endpoint = "https://api.openai.com/v1/chat/completions",
						secret = os.getenv("OPENAI_API_KEY"),
					},
				},
			})

			-- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
		end,
	},
}
