local table = require("features.table")
local languages = vim.fn.stdpath("config") .. "/lua/configs/languages/*.lua"
 ---@type string[]
local paths = vim.fn.split(vim.fn.glob(languages), "\n");

local supports = {}
for index, path in ipairs(paths) do
  local modulename = vim.fn.fnamemodify(vim.fs.basename(path), ":r")
  local module = "configs.languages." .. modulename
  local support = require(module)
  supports[index] = support
end

local handlers = {
  function(lspconfig, opts)
    return function(servername)
      lspconfig[servername].setup(opts)
    end
  end,
}

local fusion = {
  treesitters = {},
  lspservers = {},
  handlers = function(lspconfig, opts)
    local result = {}
    for key, handler in pairs(handlers) do
      result[key] = handler(lspconfig, opts)
    end
    return result
  end,
}

for _, language in pairs(supports) do
  fusion.treesitters = table.concattables({ fusion.treesitters, language.treesitters or {} })
  fusion.lspservers = table.concattables({ fusion.lspservers, language.lspservers or {} })
  handlers = table.concattables({ handlers, language.handlers or {} })
end

return fusion
