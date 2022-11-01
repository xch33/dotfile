-- local lsp_installer = require "nvim-lsp-installer"
--
-- 安装列表
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- { key: 语言 value: 配置文件 }
local servers = {
  sumneko_lua = require "lsp.lua", -- /lua/lsp/lua.lua
  clangd = require "lsp.cpp", --/lua/lsp/cpp.lua
  jedi_language_server = require "lsp.py", --/lua/lsp/py.lua
  gopls = require "lsp.go", --/lua/lsp/go.lua
  rust_analyzer = require "lsp.rust", -- /lua/lsp/rust.lua
  -- prosemd_lsp = require "lsp.markdown", -- /lua/lsap/markdown.lua
}
--
-- 自动安装 LanguageServers
-- for name, _ in pairs(servers) do
--   local server_is_found, server = lsp_installer.get_server(name)
--   if server_is_found then
--     if not server:is_installed() then
--       print("Installing " .. name)
--       server:install()
--     end
--   end
-- end
--
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()) --nvim-cmp
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
-- 绑定快捷键
  require('keybindings').maplsp(buf_set_keymap)
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end
--
-- require("nvim-lsp-installer").setup{}
--
-- -- setup languages 
--
--
-- for _, server in ipairs(servers_lsp) do
--   require('lspconfig')[server].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end

-- local servers_lsp = {
--   "sumneko_lua",
--   "clangd",
--   "pylsp",
--   "gopls",
--   "rust_analyzer",
-- }
--
-- lsp_installer.on_server_ready(function(server)
--   local opts = servers[server.name]
--   if opts then
--     opts.on_attach = on_attach
--     opts.capabilities = capabilities
--     if opts.flags ~= nil then
--       opts.flags = {
--         debounce_text_changes = 150,
--       }
--     end
--   end
--   server:setup(opts)
-- end)


-- mason setup
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {
      "gopls",
      "jedi_language_server",
      "clangd",
      "sumneko_lua",
      "rust_analyzer",
    }
})

local servers_lsp = {
  "sumneko_lua",
  "clangd",
  "jedi_language_server",
  "gopls",
  "rust_analyzer",
}
for _, server in ipairs(servers_lsp) do
  local opts = servers[server]
  if opts ~= nil then
    if server == 'jedi_language_server' then
      require('lspconfig')['jedi_language_server'].setup{
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = require("lspconfig/util").root_pattern(".git"),
        init_options = {
          workspace = {
            extraPaths = {"/usr/local/lib/python3.8/dist-packages/"}
          }
        }
      }
    else
      require('lspconfig')[server].setup {
        settings = opts.settings,
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end
  else
    require('lspconfig')[server].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end

