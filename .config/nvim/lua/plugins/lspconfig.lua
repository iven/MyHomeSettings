local lspconfig = require("lspconfig")
local lsputil = require("lspconfig.util")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local lsp_format = require("lsp-format")
local null_ls = require("null-ls")
local lsp_signature = require('lsp_signature')
local lsp_inlayhints = require("lsp-inlayhints")
local navic = require("nvim-navic")

local runtime_path = vim.split(package.path, ';')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- https://www.reddit.com/r/neovim/comments/tul8pb/lsp_clangd_warning_multiple_different_client/
capabilities.offsetEncoding = "utf-8"
local on_attach = function(client, bufnr)
  lsp_format.on_attach(client)
  lsp_signature.on_attach()
  lsp_inlayhints.on_attach(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

lsp_format.setup()
lsp_inlayhints.setup {
  inlay_hints = {
    only_current_line = true,
  },
}
null_ls.setup {
  sources = {
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.golangci_lint,
  },
  debug = true,
  on_attach = on_attach,
}

local servers = { 'cmake', 'pyright', 'gopls', 'rust_analyzer', 'tsserver' }
for _, lsp in pairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

lspconfig['clangd'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = { "clangd", "--pch-storage=memory", "-j=64" },
}

lspconfig['sumneko_lua'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        -- https://github.com/neovim/nvim-lspconfig/issues/1700
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
  root_dir = lsputil.root_pattern(
    "init.lua",
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
    ".git"
  ),
}

-- 为 LSP 浮动窗口添加边框
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or 'single'
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- 输入时实时提示错误
vim.diagnostic.config {
  update_in_insert = true,
}
