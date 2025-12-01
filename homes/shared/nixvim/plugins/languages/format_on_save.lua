function(bufnr)
  if vim.g.disable_autoformat then
    return
  end

  if vim.bo[bufnr].filetype == "sql" then
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

    local function capitalize_first(s)
      return s:sub(1, 1):upper() .. s:sub(2)
    end

    for i, line in ipairs(lines) do
      lines[i] = vim.fn.substitute(
        line,
        [[\$P{\(\w\+\)}]],
        function(...)
          local m = vim.fn.submatch(1)
          return "@" .. capitalize_first(m)
        end,
        "g"
      )
    end

    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
  end
  return { timeout_ms = 500, lsp_format = "fallback" }
end
