return {
    "EdenEast/nightfox.nvim",

    config = function()
	    local mynight = require("nightfox")
	    mynight.setup({
             palettes = {
               carbonfox = {
                    sel0 = "#482046"
               },
            },
	    })
    end
}

