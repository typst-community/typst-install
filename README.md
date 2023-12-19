# typst_install

🤖 `curl | sh` installer script for Typst

<table align=center><td>

```sh
# ✨🚀
curl -fsSL https://typst.community/typst_install/install.sh | sh
typst compile paper.typ
```

</table>

🚀 Easy to get started; just one shell command! \
🟦 Works on Windows too

👀 Don't want to use `curl | sh`? Follow the [official Typst installation
instructions] and download a binary from [typst/typst releases].

## Usage

![Linux](https://img.shields.io/static/v1?style=for-the-badge&message=Linux&color=222222&logo=Linux&logoColor=FCC624&label=)
![Windows](https://img.shields.io/static/v1?style=for-the-badge&message=Windows&color=0078D4&logo=Windows&logoColor=FFFFFF&label=)
![macOS](https://img.shields.io/static/v1?style=for-the-badge&message=macOS&color=000000&logo=macOS&logoColor=FFFFFF&label=)

Linux, macOS, WSL

```sh
curl -fsSL https://typst.community/typst_install/install.sh | sh
```

Windows

```ps1
irm https://typst.community/typst_install/install.ps1 | iex
```

<details><summary>Change install location</summary>

Linux, macOS, WSL

```sh
export TYPST_INSTALL="/usr/local"
curl -fsSL https://typst.community/typst_install/install.sh | sh
```

Windows

```ps1
$Env:TypstInstall = "C:\Program Files\typst"
irm https://typst.community/typst_install/install.ps1 | iex
```

</details>

<details><summary>Install specific version</summary>

Linux, macOS, WSL

```sh
curl -fsSL https://typst.community/typst_install/install.sh | sh -s 0.10.0
```

Windows

```ps1
v="0.10.0"; irm https://typst.community/typst_install/install.ps1 | iex
```

</details>

Now you can use `typst`! It's installed to `~/.typst/*` by default.

```sh
The Typst compiler

Usage: typst [OPTIONS] <COMMAND>

Commands:
  compile  Compiles an input file into a supported output format [aliases: c]
  watch    Watches an input file and recompiles on changes [aliases: w]
  query    Processes an input file to extract provided metadata
  fonts    Lists all discovered fonts in system and custom font paths
  update   Self update the Typst CLI
  help     Print this message or the help of the given subcommand(s)

Options:
  -v, --verbosity...  Sets the level of logging verbosity: -v = warning & error, -vv = info, -vvv = debug, -vvvv = trace
      --cert <CERT>   Path to a custom CA certificate to use when making network requests [env: TYPST_CERT=]
  -h, --help          Print help
  -V, --version       Print version
```

## Development

![sh](https://img.shields.io/static/v1?style=for-the-badge&message=sh&color=4EAA25&logo=GNU+Bash&logoColor=FFFFFF&label=)
![PowerShell](https://img.shields.io/static/v1?style=for-the-badge&message=PowerShell&color=5391FE&logo=PowerShell&logoColor=FFFFFF&label=)

GitHub Pages is enabled and pulls straight from the `main` branch's root folder.
That's how the `https://typst.community/typst_install/install.sh` script is
published. That means it's a good idea to **make sure that the `main` branch
always works!** 😉

<!-- prettier-ignore-start -->
[official Typst installation instructions]: https://github.com/typst/typst#installation
[typst/typst releases]: https://github.com/typst/typst/releases
<!-- prettier-ignore-end -->
