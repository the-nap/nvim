return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function(_, opts)
    -- Ensure sections exist before modifying
    opts.sections = opts.sections or {}
    opts.sections.lualine_x = opts.sections.lualine_x or {}

    local function getPomoStatus()
      local ok, pomo = pcall(require, "pomo")
      if not ok then
        return ""
      end

      local timer = pomo.get_first_to_finish()
      if timer == nil then
        return ""
      end

      return "󰄉 " .. tostring(timer)
    end
    -- Timer function
    table.insert(opts.sections.lualine_x, getPomoStatus)
    table.insert(opts.sections.lualine_x, require("doing").status)

    -- Set theme
    opts.options = opts.options or {}
    opts.options.theme = "gruvbox-material"
  end,
}

