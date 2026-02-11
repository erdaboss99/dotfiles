-- Helper to avoid repeating { confirm = false }
local function pack(spec) vim.pack.add(spec, { confirm = false }) end

-- ======================
-- Shared Dependencies
-- ======================

pack { { src = "https://github.com/nvim-lua/plenary.nvim" } }
pack { { src = "https://github.com/nvim-tree/nvim-web-devicons" } }

-- ======================
-- Theme
-- ======================

pack { { src = "https://github.com/catppuccin/nvim", name = "catppuccin", version = vim.version.range "^1" } }

-- ======================
-- Formatting & Tooling
-- ======================

pack { { src = "https://github.com/williamboman/mason.nvim" } }
pack { { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" } }
pack { { src = "https://github.com/stevearc/conform.nvim" } }
pack { { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" } }

-- ======================
-- Completion
-- ======================

pack { { src = "https://github.com/zbirenbaum/copilot.lua" } }
pack { { src = "https://github.com/L3MON4D3/LuaSnip" } }
pack { { src = "https://github.com/fang2hou/blink-copilot" } }
pack { { src = "https://github.com/saghen/blink.cmp", version = vim.version.range "^1" } }

-- ======================
-- Fuzzy Finder
-- ======================

pack { { src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" } }
pack { { src = "https://github.com/nvim-telescope/telescope.nvim" } }

-- ======================
-- File Explorer
-- ======================

pack { { src = "https://github.com/stevearc/oil.nvim" } }
pack { { src = "https://github.com/refractalize/oil-git-status.nvim" } }

-- ======================
-- Git
-- ======================

pack { { src = "https://github.com/lewis6991/gitsigns.nvim" } }
pack { { src = "https://github.com/kdheepak/lazygit.nvim" } }

-- ======================
-- Debugger
-- ======================

pack { { src = "https://github.com/nvim-neotest/nvim-nio" } }
pack { { src = "https://github.com/rcarriga/nvim-dap-ui" } }
pack { { src = "https://github.com/theHamsta/nvim-dap-virtual-text" } }
pack { { src = "https://github.com/leoluz/nvim-dap-go" } }
pack { { src = "https://github.com/mxsdev/nvim-dap-vscode-js" } }
pack { { src = "https://github.com/mfussenegger/nvim-dap", version = "90616ae6ae40053103dc66872886fc26b94c70c8" } }

-- ======================
-- UI
-- ======================

pack { { src = "https://github.com/nvim-lualine/lualine.nvim" } }
pack { { src = "https://github.com/akinsho/bufferline.nvim" } }
pack { { src = "https://github.com/MunifTanjim/nui.nvim" } }
pack { { src = "https://github.com/rcarriga/nvim-notify" } }
pack { { src = "https://github.com/folke/noice.nvim" } }
pack { { src = "https://github.com/folke/which-key.nvim" } }

-- ======================
-- Notes
-- ======================

pack { { src = "https://github.com/obsidian-nvim/obsidian.nvim" } }
pack { { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" } }

-- ======================
-- QoL
-- ======================

pack { { src = "https://github.com/echasnovski/mini.comment" } }
pack { { src = "https://github.com/echasnovski/mini.surround" } }
pack { { src = "https://github.com/laytan/cloak.nvim" } }
pack { { src = "https://github.com/b0o/schemastore.nvim" } }
