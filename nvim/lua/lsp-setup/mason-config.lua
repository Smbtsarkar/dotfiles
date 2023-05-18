-- Ensuring the plugins are installed
local status_msn, msn = pcall(require,"mason")
if not status_msn then
  return
end


local status_msnlc, msnlc = pcall(require,"mason-lspconfig")
if not status_msnlc then
  return
end

-- Setting up mason
msn.setup({
  -- UI Elements
  ui = {
    border = "rounded",
    height = 0.6,
    -- Icons section
    icons = {
     -- The list icon to use for installed packages.
     package_installed = "",
     -- The list icon to use for packages that are installing, or queued for installation.
     package_pending = "",
     -- The list icon to use for packages that are not installed.
     package_uninstalled = "" 
    }
  },
})

-- Setting up mason config
msnlc.setup({
  -- Ensure Installed
  ensure_installed = { "pyright" },
  -- Auto Install
  automatic_installation = true,
})
