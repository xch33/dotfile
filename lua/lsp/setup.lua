local lsp_installer = require "nvim-lsp-installer"

-- 安装列表
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- { key: 语言 value: 配置文件 }
local servers = {
  sumneko_lua = require "lsp.lua", -- /lua/lsp/lua.lua
  clangd = require "lsp.cpp", --/lua/lsp/cpp.lua
  pyright = require "lsp.py", --/lua/lsp/py.lua
  gopls = require "lsp.go", --/lua/lsp/go.lua
  rust_analyzer = require "lsp.rust", -- /lua/lsp/rust.lua
  prosemd_lsp = require "lsp.markdown", -- /lua/lsap/markdown.lua
}

-- 自动安装 LanguageServers
for name, _ in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()) --nvim-cmp
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  -- 绑定快捷键
  require('keybindings').maplsp(buf_set_keymap)
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local nvim_lsp = require('lspconfig')

-- setup languages 

lsp_installer.on_server_ready(function(server)
  local opts = servers[server.name]
  if opts then
    opts.on_attach = on_attach
    opts.capabilities = capabilities
  end
  opts.flags = {
    debounce_text_changes = 150,
  }
  server:setup(opts)
end)
