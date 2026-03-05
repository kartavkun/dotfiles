return {
  "snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        pick = function(cmd, opts)
          return LazyVim.pick(cmd, opts)()
        end,
        --        header = [[
        --        ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
        --        ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
        --        ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
        --        ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
        --        ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
        --        ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
        -- ]],
        header = [[
                                          
       ⣿⣿⣿⠿⠟⠛⠛⣉⢉⣉⣉⣤⣬⣥⣤⣤⣤⣤⣬⣭⣈⣉⡙⠻⣿⣿⣿⣿⣿⣿   
       ⣿⣿⢠⣶⣶⣿⣿⢫⢷⢋⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⣿⣿⣿⣿   
       ⣿⣿⠀⣿⣿⠟⡛⠛⠳⣾⣿⣿⣿⣿⣿⣿⡿⢋⡤⠀⠉⢿⣿⡇⠿⠛⠛⢿⣿⣿   
       ⣿⣿⡀⣿⣏⠈⣁⢤⣠⢻⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠄⣸⣿⡇⠀⣾⣿⣘⠛⢿   
       ⣿⣿⠇⣿⣧⡽⠟⣛⣛⣛⣛⠛⢛⡛⣛⣛⣛⣛⢛⡛⠿⣿⣿⣶⣷⣿⢻⣿⣇⠸   
       ⣿⠃⣼⣿⣿⣧⡠⣍⣿⣿⣧⣤⣽⣿⣿⣿⣿⣿⣩⡅⣠⣿⣿⣿⣿⣟⣾⣿⡟⢰   
       ⠇⣼⣿⢻⣿⣿⣿⣶⣭⣝⣙⣻⠻⠻⠛⠿⣟⣉⣭⣾⣿⣿⣿⣿⠿⠛⣋⣬⣤⣾   
       ⣇⠻⣿⢺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⡆⢸⣿⣿⣿⣿⣿   
       ⣇⠻⣿⢺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⡆⢸⣿⣿⣿⣿⣿   
       ⣿⣿⣿⠀⣿⣿⣿⣿⣿⣶⣶⢠⣤⣤⣤⡄⢰⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿   
       ⣿⣿⣿⣦⣉⣛⣛⠛⣛⣉⣁⣼⣿⣿⣿⣷⣌⡛⠛⠛⠛⢛⣋⣤⣿⣿⣿⣿⣿⣿   
                                        
              t.me/kartaviykun          
 ]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          -- { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":cd ~/.dotfiles/ | lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "v", desc = "Nvim config", action = ":cd ~/.dotfiles/.config/nvim-stable/ | lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "g", desc = "Git repos", action = ":cd ~/git/my-repos/ | lua Snacks.dashboard.pick('files')" },
          -- { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          -- { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          -- { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
  },
}
