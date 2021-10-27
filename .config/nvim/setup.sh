#!/bin/sh

echo Installing latest stable NeoVim version
./scripts/nvim.sh

echo Font setup
./scripts/fonts.sh

echo LSP setup
./scripts/lsp_setup.sh


