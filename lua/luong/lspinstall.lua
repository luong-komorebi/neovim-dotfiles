local status_ok, lspinstall = pcall(require, "lspinstall")
if not status_ok then
  return
end

local function setup_servers()
  lspinstall.setup()
  -- this part automatically installs configs for all servers, leading to duplicated and overriden configs
  -- TODO: refactor
  -- local servers = require'lspinstall'.installed_servers()
  -- for _, server in pairs(servers) do
  --   require'lspconfig'[server].setup{}
  -- end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
lspinstall.post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd "bufdo e"
end
