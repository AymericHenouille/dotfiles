---@alias LspConfigFn fun(name: string, config: vim.lsp.Config)

---@class LanguageSupport
---@field treesitters fun(): string[] The treesitters config to install
---@field lspservers fun(): string[] The lsp server to install 
---@field handlers fun(lspconfig: LspConfigFn, opts: table): fun()[] handlers The handlers function to call for init the lsp server 

local languages = vim.fn.stdpath("config") .. "/lua/configs/languages/*.lua"
local paths = vim.fn.split(vim.fn.glob(languages), "\n")
local supports = vim.tbl_map(function(path)
  local modulename = vim.fn.fnamemodify(vim.fs.basename(path), ":r")
  local module = "configs.languages." .. modulename
  return require(module)
end, paths) --[[@as LanguageSupport]]

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
  local result = {}
  local handlers = vim.iter(supports):map(function(support)
    return support.handlers or {}
  end):totable()

  for _, config in ipairs(handlers) do
    for servername, handler in pairs(config) do
      result[servername] = handler(lspconfig, opts)
    end
  end

  return result
end

return M --[[@as LanguageSupport]]
