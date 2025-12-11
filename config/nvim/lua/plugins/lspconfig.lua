-- lua/plugins/lspconfig.lua
-- Modern Neovim 0.11+ LSP config using vim.lsp.config / vim.lsp.enable

-- safely require cmp_nvim_lsp
local cmp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_status then
  vim.notify("cmp_nvim_lsp not found", vim.log.levels.ERROR)
  return
end

local capabilities = cmp_nvim_lsp.default_capabilities()
local keymap = vim.keymap

-- on_attach keymaps
local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts)
  keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
  keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  keymap.set("n", "<leader>K", "<cmd>Lspsaga hover_doc<CR>", opts)
  keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)
  keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, opts)
  keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

-- ======== Lua Language Server ========
do
  local cfg = vim.lsp.config["lua_ls"]
  if cfg then
    cfg.settings = {
      Lua = {
        diagnostics = { globals = { "vim", "test_case", "it" } },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,
          },
        },
      },
    }
    cfg.on_attach = on_attach
    cfg.capabilities = capabilities
    vim.lsp.enable("lua_ls")
  else
    vim.notify("LSP server 'lua_ls' not found", vim.log.levels.WARN)
  end
end

-- ======== clangd ========
do
  local cfg = vim.lsp.config["clangd"]
  if cfg then
    cfg.cmd = {
      "clangd",
      "--header-insertion=never",
      "--background-index",
      "--clang-tidy",
      "--limit-references=0",
      "--limit-results=0",
      "--log=error",
      "--offset-encoding=utf-16",
      "--function-arg-placeholders=false",
      "--query-driver=/usr/bin/arm-none-eabi-gcc",
    }
    cfg.filetypes = { "c", "cpp" }
    cfg.on_attach = on_attach
    cfg.capabilities = capabilities
    vim.lsp.enable("clangd")
  else
    vim.notify("LSP server 'clangd' not found", vim.log.levels.WARN)
  end
end

