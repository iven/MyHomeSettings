local runtime_path = vim.split(package.path, ';')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local flags = {
  -- This will be the default in neovim 0.7+
  debounce_text_changes = 150,
}
local on_attach = function(client)
  require("lsp-format").on_attach(client)
end

require('lsp-format').setup()
local servers = { 'pyright', 'gopls', 'rust_analyzer' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities,
    flags = flags,
    on_attach = on_attach,
  }
end

require('lspconfig')['sumneko_lua'].setup {
  capabilities = capabilities,
  flags = flags,
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
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
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
