return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function(_, opts)
    -- Ensure sections exist before modifying
    opts.sections = opts.sections or {}
    opts.sections.lualine_x = opts.sections.lualine_x or {}

    -- Timerly function
    local function get_timerly_status()
      local state = require("timerly.state")
      if state.progress == 0 then
        return ""
      end

      local total = math.max(0, state.total_secs + 1) -- Sync with display
      local mins = math.floor(total / 60)
      local secs = total % 60

      return string.format("%s %02d:%02d", state.mode:gsub("^%l", string.upper), mins, secs)
    end

    -- Insert Timerly into lualine_x
    table.insert(opts.sections.lualine_x, get_timerly_status)

    -- Set theme
    opts.options = opts.options or {}
    opts.options.theme = "gruvbox-material"
  end,
}

