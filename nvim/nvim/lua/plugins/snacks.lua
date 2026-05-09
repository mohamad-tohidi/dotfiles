return {
  {
    "folke/snacks.nvim",
    opts = {
      scratch = {
        ft = "python",
        win = {
          position = "float",
          width = 0.6,
          height = 0.6,
        },
        win_by_ft = {
          python = {
            keys = {
              ["run"] = {
                "<cr>",
                function(self)
                  local python = require("venv-selector").python()
                  if not python or python == "" then
                    python = "python3"
                    vim.notify("No venv active, using system python3", vim.log.levels.WARN)
                  end

                  local file = "/tmp/nvim_scratch.py"
                  vim.cmd("w! " .. file)

                  -- grab output as lines
                  local output = vim.fn.systemlist(python .. " " .. file .. " 2>&1")

                  -- find or create a separator in the buffer
                  local buf = vim.api.nvim_get_current_buf()
                  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

                  -- strip previous output (everything after "# ---")
                  local code_end = #lines
                  for i, line in ipairs(lines) do
                    if line:match("^# %-%-%-") then
                      code_end = i - 1
                      break
                    end
                  end

                  -- build new buffer content: code + separator + output
                  local result = {}
                  for i = 1, code_end do result[#result+1] = lines[i] end
                  result[#result+1] = "# --- output ---"
                  for _, line in ipairs(output) do result[#result+1] = "# " .. line end

                  vim.api.nvim_buf_set_lines(buf, 0, -1, false, result)
                end,
                desc = "Run and show output inline",
                mode = { "n" },
              },
            },
          },
        },
      },
    },
    keys = {
      { "<leader>S",  function() Snacks.scratch() end,         desc = "Toggle Scratchpad" },
      { "<leader>ss", function() Snacks.scratch.select() end,  desc = "Select Scratchpad" },
    },
  },
}
