---Create the command parameters used to run the angular language service.
---@param root_dir string
---@return string[]
local function create_run_angularls_command(root_dir)
  local project_node_modules = vim.fs.joinpath(root_dir, "node_modules")
  local project_ng_ls = vim.fs.joinpath(
    project_node_modules,
    "@angular",
    "language-service"
  )

  local ts_probe_location = project_node_modules
  local ng_probe_location = project_ng_ls

  if vim.fn.isdirectory(project_ng_ls) == 0 then
    local mason_package_path = vim.fn.expand("$MASON/packages/angular-language-server")

    if mason_package_path == "$MASON/packages/angular-language-server" then
      mason_package_path =
        vim.fn.stdpath("data") .. "/mason/packages/angular-language-server"
    end

    ts_probe_location = vim.fs.joinpath(mason_package_path, "node_modules")
    ng_probe_location = vim.fs.joinpath(
      ts_probe_location,
      "@angular",
      "language-service"
    )
  end

  return {
    "ngserver",
    "--stdio",
    "--tsProbeLocation",
    ts_probe_location,
    "--ngProbeLocation",
    ng_probe_location,
  }
end

---@type LanguageConfig
return {
  treesitters = { "angular" },
  lspservers = { "angularls", "emmet_ls" },
  handlers = {
    ["angularls"] = function(opts)
      local root_dir = vim.fn.getcwd()
      local options = vim.tbl_extend("force", opts, {
        filetypes = {
          "typescript",
          "html",
          "typescriptreact",
          "typescript.tsx",
          "htmlangular",
        },
        cmd = create_run_angularls_command(root_dir),
        on_new_config = function(new_config, new_root_dir)
          new_config.cmd = create_run_angularls_command(new_root_dir)
        end
      })
      local lsp_loader = require("features.lsp_loader")
      return lsp_loader.load_options(options)
    end
  }
}


