local M = {}

local base_capabilities = vim.lsp.protocol.make_client_capabilities()
base_capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

M.capabilities = base_capabilities

M.on_init = function(client, _)
  if client:supports_method("textDocument/semanticTokens") then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

vim.lsp.config("*", {
  capabilities = vim.deepcopy(base_capabilities),
  on_init = M.on_init,
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = {
        library = {
          vim.fn.expand("$VIMRUNTIME/lua"),
          vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
          "${3rd}/luv/library",
        },
        checkThirdParty = false,
      },
      diagnostics = { globals = { "vim" } },
    },
  },
})
vim.lsp.enable("lua_ls")

vim.diagnostic.config({
  virtual_text = { prefix = "●", spacing = 4 },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { border = "rounded", source = "if_many" },
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local function opts(desc)
      return { buffer = bufnr, desc = "LSP " .. desc }
    end

    local map = vim.keymap.set
    map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
    map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))
    map("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts("List workspace folders"))
    map("n", "<leader>D", vim.lsp.buf.type_definition, opts("Go to type definition"))
    map("n", "<leader>ra", vim.lsp.buf.rename, opts("Rename"))
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
    map("n", "K", vim.lsp.buf.hover, opts("Hover"))
    map("n", "gr", vim.lsp.buf.references, opts("References"))
    map("n", "gi", vim.lsp.buf.implementation, opts("Implementation"))
    map("n", "[d", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, opts("Prev diagnostic"))
    map("n", "]d", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, opts("Next diagnostic"))
  end,
})

return M
