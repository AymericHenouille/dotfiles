---Create the command parameters used to run the angular language service.
---@param root_dir string - The root directory of the current working project.
---@return string[] cmd The start server command.
local function create_run_angularls_command(root_dir)
  -- Register the probe location
  local ts_probe_location = vim.fs.joinpath(root_dir)
  local ng_probe_location = ts_probe_location
  local lsp_package_path = vim.fs.joinpath(ts_probe_location, "@angular", "language-service")

  -- Check if the current working directory has a valid language service installed.
  -- If it doesn't have one, it uses the Mason one.
  if vim.fn.isdirectory(lsp_package_path) == 0 then
    local registry = require("mason-registry")
    local install_path = registry.get_package("angular-language-server"):get_install_path()
    ts_probe_location = vim.fs.joinpath(install_path, "node_modules")
    ng_probe_location = vim.fs.joinpath(ts_probe_location, "@angular", "language-service")
  end

  return { "ngserver", "--stdio", "--tsProbeLocation", ts_probe_location, "--ngProbeLocation", ng_probe_location }
end

return {
  treesitters = { "angular" },
  lspservers = { "angularls", "emmet_ls" },
  handlers = {
    ["angularls"] = function(lspconfig, opts)
      local root_dir = vim.fn.getcwd()
      return function()
        local options = {
          cmd = create_run_angularls_command(root_dir),
          on_new_config = function(new_config, new_root_dir)
            new_config.cmd = create_run_angularls_command(new_root_dir)
          end,
          filetypes = {
            "typescript",
            "html",
            "typescriptreact",
            "typescript.tsx",
            "htmlangular",
          },
        }
        local full_options = vim.tbl_extend("force", { opts, options })
        lspconfig.angularls.setup(full_options)
      end
    end,
  },
}


