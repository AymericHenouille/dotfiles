local M = {}

---Create a config loader used to create LanguageConfig handler object.
---@param options table The options used to load the config by the config loader.
---@return fun(lspconfig: LspConfigFn, servername: string) load_options The function to call for loading the options.
M.load_options = function(options)
  return function(lspconfig, servername)
    lspconfig(servername, options)
  end
end

---Create a basic handler config that add some particular options to an lsp server 
---@param options table The options to set to the lsp server
---@return fun(opts: table): fun(lspconfig: LspConfigFn, servername: string) handler The created handler
M.handler_with_options = function(options)
  return function(opts)
    local built_options = vim.tbl_extend("force", opts, options)
    return M.load_options(built_options)
  end
end

return M
