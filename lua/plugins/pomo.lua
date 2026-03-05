return {
  "epwalsh/pomo.nvim",
  version = "*",  -- Recommended, use latest release instead of latest commit
  lazy = true,
  cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
  opts = {
    notifiers = {
      {
        name = "Default",
        opts = {
          sticky = false,
        },
      },
    },

    sessions = {
      pomodoro = {
        { name = "Work", duration = "25m" },
        { name = "Break", duration = "5m" },
        { name = "Work", duration = "25m" },
        { name = "Break", duration = "5m" },
        { name = "Work", duration = "25m" },
        { name = "Long Break", duration = "15m" },
      }
    }
  },
}
