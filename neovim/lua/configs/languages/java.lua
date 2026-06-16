---@type LanguageConfig
return {
  treesitters = { "java" },
  lspservers = { "jdtls", "gradle_ls" },
  handlers = {
    ["jdtls"] = function(lspconfig, opts)
      local lombok_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls/lombok.jar"
      local full_options = vim.tbl_extend("force", opts, {
        cmd = {
          "jdtls",
          "--jvm-arg=-javaagent:" .. lombok_path,
        },
      })
      return function(servername)
        lspconfig(servername, full_options)
      end
    end
  },
}
