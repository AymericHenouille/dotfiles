local function get_prob_location(root_dir)
  local project_node_module = vim.fs.joinpath(root_dir, "node_modules")
  local project_ng_ls = vim.fs.joinpath(project_node_module, "@angular", "language-service")
  local ts_probe_location, ng_probe_location = project_node_module, project_ng_ls

  return ts_probe_location, ng_probe_location
end

---Create the command parameters used to run the angular language service.
---@param root_dir string
---@return string[]
local function create_run_angularls_command(root_dir)
  local ts_probe_location, ng_probe_location = get_prob_location(root_dir)
  local is_not_localy_installed = vim.fn.isdirectory(ts_probe_location) + vim.fn.isdirectory(ng_probe_location) == 0

  if is_not_localy_installed then
    local mason_root_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "mason/packages/angular-language-server")
    ts_probe_location, ng_probe_location = get_prob_location(mason_root_dir)
  end

  return {
    "ngserver",
    "--stdio",
    "--tsProbeLocations",
    ts_probe_location,
    "--ngProbeLocations",
    ng_probe_location,
  }
end

---@type LanguageConfig
return {
  treesitters = { "angular", "htmlangular" },
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


