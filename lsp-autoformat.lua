-- Autoformatting on save
if vim.bo.filetype == "python" then
  vim.notify("Hi")
  vim.api.nvim_clear_autocmds({
    buffer = bufnr,
  })
  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })
end
