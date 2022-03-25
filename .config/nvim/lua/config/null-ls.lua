local null_ls = require("null-ls")

null_ls.setup {
  sources = {
    null_ls.builtins.code_actions.gitsigns,
  },
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      -- 保存文件时自动格式化
      vim.cmd([[
        augroup LspFormatting
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
        augroup END
      ]])
    end
  end,
}
