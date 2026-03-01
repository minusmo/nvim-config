return {
  "milanglacier/minuet-ai.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "InsertEnter",
  config = function()
    require("minuet").setup({
      provider = "openai_fim_compatible",
      n_completions = 1,
      context_window = 1024,
      throttle = 500,
      debounce = 200,
      virtualtext = {
        auto_trigger_ft = {},
        keymap = {
          accept = "<A-a>",
          accept_line = "<A-l>",
          prev = "<A-[>",
          next = "<A-]>",
          dismiss = "<A-e>",
        },
      },
      provider_options = {
        openai_fim_compatible = {
          api_key = "TERM",
          name = "Ollama",
          end_point = "http://localhost:11434/v1/completions",
          model = "qwen2.5-coder:7b",
          optional = {
            max_tokens = 100,
            top_p = 0.9,
          },
        },
      },
    })
  end,
}
