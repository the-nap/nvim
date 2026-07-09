return
{
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  opts = {
    note_id_func = function(title)
      return title
    end,
  disable_frontmatter = true,
  workspaces = {
    {
      name = "SecondBrain",
      path = "~/Documents/SecondBrain",
    }
  }
}
}


