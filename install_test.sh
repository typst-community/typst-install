#!/bin/bash
set -e

if [ "$OS" = "Windows_NT" ]; then
  DEBUG=1 pwsh -command 'type install.ps1 | iex'
else
  cat install.sh | DEBUG=1 sh
fi

echo 'export TYPST_INSTALL="/home/runner/.typst"' >> ~/.bashrc
echo 'export PATH="$TYPST_INSTALL/bin:$PATH"' >> ~/.bashrc
exec "$SHELL"

typst --version
typst compile test.typ
