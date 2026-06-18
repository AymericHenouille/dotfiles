local lsp_loader = require("features.lsp_loader")

---@type LanguageConfig
return {
  treesitters = { "java" },
  lspservers = { "jdtls", "gradle_ls" },
  handlers = {
    ["jdtls"] = lsp_loader.handler_with_options({
      cmd = {
        "jdtls",
        "--jvm-arg=-javaagent:"
          .. vim.fn.stdpath("data")
          .. "/mason/packages/jdtls/lombok.jar",
      },
    })
  },
}
