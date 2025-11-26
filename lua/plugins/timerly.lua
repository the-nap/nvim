return
{
--[[
  dir="~/projects/timerly",
  cmd = "TimerlyToggle",
  dependencies = "nvzone/volt",

  opts = {
    minutes = { 25 , 5 },
    cycle = true,
    delay = 5,
    on_finish = function()
      local state = require "timerly.state"
      if state.mode == "focus" then
        vim.notify "Time's up, take a break"
      else
        vim.notify "It's time to resume"
      end
    end,
  },
]]--
}
