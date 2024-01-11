#!/bin/sh
# Keep this script simple and easily auditable!
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
    *) target="x86_64-unknown-linux-musl";;
	esac
fi

if [ "$OS" = "Windows_NT" ]; then
	archive_ext=".zip"
else
  archive_ext=".tar.xz"
fi

if [ "$OS" = "Windows_NT" ]; then
	exe_ext=".exe"
else
  exe_ext=""
fi

folder="typst-$target"
file="$folder$archive_ext"

typst_install="${TYPST_INSTALL:-$HOME/.typst}"
mkdir -p "$typst_install"

if [ -n "$1" ]; then
  url="https://github.com/typst/typst/releases/download/v$1/$file"
else
  url="https://github.com/typst/typst/releases/latest/download/$file"
fi

echo "Downloading Typst from $url"
curl -fsSL "$url" -o "$typst_install/$file"
if [ "$archive_ext" = ".zip" ]; then
  unzip -d "$typst_install" -o "$typst_install/$file"
else
  tar -xJf "$typst_install/$file" -C "$typst_install"
fi
rm -f "$typst_install/$file"

mkdir -p "$typst_install/bin"
mv -f "$typst_install/$folder/typst$exe_ext" "$typst_install/bin/typst$exe_ext"
chmod +x "$typst_install/bin/typst$exe_ext"

mv -f "$typst_install/$folder"/* "$typst_install"
rm -rf "${typst_install:?}/$folder"

echo "Typst installed to $typst_install/bin/typst$exe_ext"

if command -v typst >/dev/null; then
	echo "Run 'typst$exe_ext --help' to get started"
else
	case $SHELL in
    /bin/zsh) shell_profile=".zshrc";;
    *) shell_profile=".bashrc";;
	esac
  cat <<EOF
Manually add the directory to your \$HOME/$shell_profile (or similar)
  export TYPST_INSTALL="$typst_install"
  export PATH="\$TYPST_INSTALL/bin:\$PATH"

Example:
  echo 'export TYPST_INSTALL="$typst_install"' >> ~/$shell_profile
  echo 'export PATH="\$TYPST_INSTALL/bin:\$PATH"' >> ~/$shell_profile

Run '$typst_install/bin/typst$exe_ext --help' to get started
EOF
fi

echo "Stuck? Open an Issue https://github.com/typst-community/typst-install/issues"
