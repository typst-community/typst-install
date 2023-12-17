#!/bin/bash
set -e

if [ "$OS" = "Windows_NT" ]; then
  pwsh -command 'type install.ps1 | iex'
else
  cat install.sh | sh
fi

typst --version
typst compile test.typ
