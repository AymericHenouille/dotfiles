---@alias LspConfigFn fun(name: string, config: vim.lsp.Config)

---@class LanguageSupport
---@field treesitters fun(): string[] The treesitters config to install.
---@field lspservers fun(): string[] The lsp server to install.
---@field handlers fun(lspconfig: LspConfigFn, opts: table): table<string, fun(servername: string)> handlers The handlers function to call for init the lsp server.

---@class LanguageConfig 
---@field treesitters string[] The trissiters bin to install and load.
---@field lspservers string[] The lsp servers bin to install and load.
---@field handlers table<string, fun(lspconfig: LspConfigFn, opts: table): fun(servername: string)> The handlers called to apply a custom configuration for a given lsp server

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
    :flatten()
    :totable()
end

---Load the lsp server handlers
---@param lspconfig LspConfigFn The lsp config instance.
---@param opts table The lsp config options
---@return fun()[] handlers The handlers function to call for init the lsp server 
M.handlers = function(lspconfig, opts)
  return vim.iter(supports):map(function(support)
    local handlers_config = support.handlers or {}
    return vim.tbl_map(function(handler)
      return handler(lspconfig, opts)
    end, handlers_config)
  end):filter(function(handlers)
    return #handlers > 0
  end):flatten():totable()
end

return M --[[ @as LanguageSupport ]]
