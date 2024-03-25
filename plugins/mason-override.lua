return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- lua stuff
      "lua-language-server",
      "stylua",

      -- web dev stuff
      "css-lsp",
      "html-lsp",
      "htmlbeautifier",
      "typescript-language-server",
      "prettier",
      "ts-standard",
      "cssmodules-language-server",
      "sonarlint-language-server",
      "emmet-language-server",
      "emmet-ls",
      "tailwindcss-language-server",
      "json-lsp",
      "jsonlint",
      "eslint-lsp",
      "js-debug-adapter",
      "node-debug2-adapter",
      "graphql-language-service-cli",
      "chrome-debug-adapter",
      "vtsls",
      "rustywind",
      "erb-lint",
      "htmlhint",
      "lwc-language-server",
      "markuplint",
      "css-variables-language-server",
      "some-sass-language-server",
      "biome",
      "trivy",
      "harper-ls",

      -- json/yaml
      "cfn-lint",
      "fixjson",
      "json-lsp",
      "nxls",
      "jq",
      "hydra-lsp",
      "yaml-language-server",
      "yamlfmt",
      "yamllint",
      "yamlfix",

      -- c/cpp/c# stuff
      "clangd",
      "clang-format",
      "codelldb",
      "cortex-debug",
      "cpplint",
      "cpptools",
      "csharp-language-server",
      "csharpier",
      "netcoredbg",
      "omnisharp",
      "omnisharp-mono",

      -- Docker
      "dockerfile-language-server",
      "docker-compose-language-service",
      "hadolint",
      "snyk",

      -- Others
      "nginx-language-server",
      "beautysh",
      "vim-language-server",

      -- SQL
      "prisma-language-server",
      "sql-formatter",
      "sqlfluff",
      "sqlfmt",
      "sqlls",

      -- Markdown
      "zk",
      "vale",
      "vale-ls",
      "remark-language-server",
      "remark-cli",
      "glow",
      "markmap-cli",
      "prosemd-lsp",
      "write-good",
    },
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonInstallAll",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
    },
    ui = {
      icons = {
        package_installed = "",
        package_pending = "",
        package_uninstalled = "",
      },
    },
  },
}
