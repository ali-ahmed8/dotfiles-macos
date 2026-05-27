# My Dotfiles Setup

This repository contains my Linux configuration setup.

## How I set it up

1. Installed Git
2. Created dotfiles folder
3. Moved config files into dotfiles
4. Created symlinks from system paths
5. Connected repository to GitHub using SSH

## What is included inside ~/dotfiles
1) Managed configuration files/folders: Linked to system path
2) Repository files: NOT linked to system path 

dotfiles/
├── keyd
│   └── default.conf
├── nvim
│   ├── init.lua
│   ├── lazy-lock.json
│   └── lua
│       ├── config
│       │   ├── autocmds.lua
│       │   ├── keymaps.lua
│       │   ├── lazy.lua
│       │   └── options.lua
│       └── plugins
│           ├── nightfox.lua
│           └── oil.lua
└── README.md

Managed configuration files/folders original paths:
- Neovim config (`~/.config/nvim`)

Repository files:
- README.md


## Configured terminal appearance (font and size)
- Font: AdwaitaMono Nerd Font
- Font size: 19
- Source: https://www.nerdfonts.com/
- Installed via: ~/.local/share/fonts
- Updated font cache using: fc-cache -fv
- Selected in terminal settings:
GNOME Terminal → Preferences → Profile → Custom font → AdwaitaMono Nerd Font

## How to add new plugin
1) Go to plugin github page and copy the lazy.nvim plugin command
2) Create new directory for the plugin inside nvim/lua/plugins/:

Example: Nightfox color theme

~/dotfiles$ touch nvim/lua/plugins/nightfox.lua

3) Inside nightfox.lua type: return  {plugin command} 

return {
    "EdenEast/nightfox.nvim",
    -- Other stuff could be in here also
}

4) Save & exit and it will work

- Note: If you want to configure a plugin's setting you need setup()
- Read the plugin's github page to know the plugin's settings and there structure

return {
    "EdenEast/nightfox.nvim",

    config = function()
	    local myPlugin = require("nightfox")
	    myPlugin.setup({
             -- Here you change the settings, inside setup()
             palettes = {
               carbonfox = {
                    sel0 = "#393737"
               },
            },
	    })
    end
}

## Important commands

### Move config
mv ~/.config/nvim/init.vim ~/dotfiles/nvim/

### Create symlink 
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim

### Commit changes
git add .
git commit -m "update config message"
git push

## Notes

- Better to always edit files inside ~/dotfiles
- System paths are only symlinks
- GitHub is backup + version control
