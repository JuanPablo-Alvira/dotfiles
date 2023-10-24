-- CORE
require("nvim_config.core.settings")

-- INSTALL PLUGINS
require("nvim_config.plugins.plugins")

-- CONFIGURE PLUGINS
require("nvim_config.plugins.config.vscode")
require("nvim_config.plugins.config.treesitter")
require("nvim_config.plugins.config.undotree")
require("nvim_config.plugins.config.lspzero")
require("nvim_config.plugins.config.nvim-tree")
require("nvim_config.plugins.config.ale")
require("nvim_config.plugins.config.telescope")

-- CORE
require("nvim_config.core.mappings")