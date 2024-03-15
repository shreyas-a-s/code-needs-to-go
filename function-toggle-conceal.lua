keymap("n", "<leader>c", function()
  local conceallevel = vim.api.nvim_get_option_value("conceallevel", { buf = 0})
  if conceallevel ~= 3 then
    vim.api.nvim_set_option_value("conceallevel", 3, { buf = 0})
  else
    vim.api.nvim_set_option_value("conceallevel", 0, { buf = 0})
  end
end, { desc = "Toggle conceal" })
