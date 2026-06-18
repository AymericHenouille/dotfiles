---@alias LspConfigFn fun(name: string, config: vim.lsp.Config)

---@class LanguageSupport
---@field treesitters fun(): string[] The treesitters config to install.
---@field lspservers fun(): string[] The lsp server to install.
---@field handlers fun(opts: table): table<string, fun(lspconfig: LspConfigFn, servername: string)> handlers The handlers function to call for init the lsp server.

---@class LanguageConfig 
---@field treesitters string[] The trissiters bin to install and load.
---@field lspservers string[] The lsp servers bin to install and load.
---@field handlers table<string, fun(opts: table): fun(lspconfig: LspConfigFn, servername: string)> The handlers called to apply a custom configuration for a given lsp server

local languages = vim.fn.stdpath("config") .. "/lua/configs/languages/*.lua"
local paths = vim.fn.split(vim.fn.glob(languages), "\n")
local supports = vim.tbl_map(
  ---load a language config from it's path
  ---@param path string The path of the language config
  ---@return LanguageConfig config The language config
  function(path)
    local modulename = vim.fn.fnamemodify(vim.fs.basename(path), ":r")
    local module = "configs.languages." .. modulename
    return require(module)
  end,
paths) --[[ @as LanguageConfig[] ]]

local M = {}

--- Load all treesitters configurations
---@return string[] treesitters The treesitters config.
M.treesitters = function()
  return vim.iter(supports)
    :map(function(support)
      return support.treesitters or {}
    end)
    :filter(function(treesitters)
      return vim.tbl_count(treesitters) > 0
    end)
    :flatten()
    :totable()
end

---Load all lsp server
---@return string[] lspservers The lsp servers to enable
M.lspservers = function()
  return vim.iter(supports)
    :map(function(support)
      return support.lspservers or {}
    end)
    :filter(function(lspservers)
      return vim.tbl_count(lspservers) > 0
    end)
    :flatten()
    :totable()
end

---Load the lsp server handlers
---@param opts table The lsp config options
---@return fun()[] handlers The handlers function to call for init the lsp server 
M.handlers = function(opts)
  ---@type table<string, fun(lspconfig: LspConfigFn, servername: string)>
  local result = {}
  local handlers = vim.tbl_map(
    --- map a support config to it's handler function
    ---@param support LanguageConfig The support config to map
    ---@return fun(lspconfig: LspConfigFn, servername: string)[] handlers The handlers active function.
    function(support)
      return vim.tbl_map(
        --- Call an handler with it's options
        ---@param handler fun(opts: table): fun(lspconfig: LspConfigFn, servername: string) The handler to call
        ---@return fun(lspconfig: LspConfigFn, servername: string) result - The handler active function
        function(handler )
          return handler(opts)
        end,
        support.handlers or {}
      )
    end,
    supports or {}
  ) --[[ @as table<string, fun(lspconfig: LspConfigFn, servername: string)>[] ]]

  for _, sub_handlers in ipairs(handlers) do
    for servername, handler in pairs(sub_handlers) do
      result[servername] = handler
    end
  end

  return result
end

return M --[[ @as LanguageSupport ]]
