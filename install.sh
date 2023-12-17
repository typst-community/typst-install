#!/bin/sh
# ⚠️ Keep this script simple and easily auditable!
set -e
if [ -n "$DEBUG" ]; then
  set -x
fi

if [ "$OS" = "Windows_NT" ]; then
	target="x86_64-pc-windows-msvc"
else
	case $(uname -sm) in
    "Darwin x86_64") target="x86_64-apple-darwin";;
    "Darwin arm64") target="aarch64-apple-darwin";;
    "Linux aarch64") target="aarch64-unknown-linux-musl";;
    *) target="x86_64-unknown-linux-gnu";;
	esac
fi

if [ "$OS" = "Windows_NT" ]; then
	archive_ext=".zip"
else
  archive_ext=".tar.xz"
fi

folder="typst-$target"
file="$folder$archive_ext"

typst_install="${TYPST_INSTALL:-$HOME/.typst}"
mkdir -p "$typst_install"

if [ -n "$1" ]; then
  url="https://github.com/typst/typst/releases/latest/download/$file"
else
  url="https://github.com/typst/typst/releases/download/$1/$file"
fi

echo "Downloading Typst from $url"
curl -fsSL "$url" -o "$typst_install/$file"
if [ "$archive_ext" = ".zip" ]; then
  unzip -d "$typst_install" -o "$file"
else
  tar -xJf "$file" -C "$typst_install"
fi

mkdir -p "$typst_install/bin"
mv -f "$typst_install/$folder/typst" "$typst_install/bin/typst"
chmod +x "$typst_install/bin/typst"

mv -f "$typst_install/$folder"/* "$typst_install"
rm -rf "${typst_install:?}/$folder"

echo "Typst installed to $typst_install/bin/typst"

if command -v typst >/dev/null; then
	echo "Run 'typst --help' to get started"
else
	case $SHELL in
    /bin/zsh) shell_profile=".zshrc";;
    *) shell_profile=".bashrc";;
	esac
  cat <<EOF
Manually add the directory to your \$HOME/$shell_profile (or similar)
  export TYPST_INSTALL=\"$typst_install\"
  export PATH=\"\$TYPST_INSTALL/bin:\$PATH\"
Run '$typst_install/bin/typst --help' to get started
EOF
fi

echo "Suck? Open an Issue https://github.com/typst-community/install_typst/issues"
