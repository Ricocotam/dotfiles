local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

local language_servers = {
    "bashls",
    "dockerls",
    "docker_compose_language_service",
    "gopls",
    "html",
    "tsserver",
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "sqlls",
    "svelte",
    "taplo",  -- toml
    "yamlls"
}

-- see :help lsp-zero-guide:integrate-with-mason-nvim
-- to learn how to use mason.nvim with lsp-zero
require('mason').setup({})
require('mason-lspconfig').setup({
  ensured_installed = language_servers,
  handlers = {lsp_zero.default_setup},
  automatic_installation=true
})

local lspconfig = require('lspconfig')
for _, lsp in pairs(language_servers) do
    lspconfig[lsp].setup{}
end
