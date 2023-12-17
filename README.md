# typst_install

🤖 `curl | sh` installer script for Typst

<table align=center><td>

```sh
# ✨🚀
curl -fsSL https://typst.community/install_typst/install.sh | sh
typst compile paper.typ
```

</table>

🚀 Easy to get started; just one shell command! \
🟦 Works on Windows too

👀 Don't want to use `curl | sh`? You can follow the [official Typst
installation instructions] to download a binary from the [typst/typst releases].

## Usage

![Linux](https://img.shields.io/static/v1?style=for-the-badge&message=Linux&color=222222&logo=Linux&logoColor=FCC624&label=)
![Windows](https://img.shields.io/static/v1?style=for-the-badge&message=Windows&color=0078D4&logo=Windows&logoColor=FFFFFF&label=)
![macOS](https://img.shields.io/static/v1?style=for-the-badge&message=macOS&color=000000&logo=macOS&logoColor=FFFFFF&label=)

Linux, macOS, WSL

```sh
curl -fsSL https://typst.community/install_typst/install.sh | sh
```

Windows

```ps1
irm https://typst.community/install_typst/install.ps1 | iex
```

<details><summary>Change install location</summary>

Linux, macOS, WSL

```sh
export TYPST_INSTALL="/usr/local"
curl -fsSL https://typst.community/install_typst/install.sh | sh
```

Windows

```ps1
$Env:TypstInstall = "C:\Program Files\typst"
irm https://typst.community/install_typst/install.ps1 | iex
```

</details>

<details><summary>Install specific version</summary>

Linux, macOS, WSL

```sh
curl -fsSL https://typst.community/install_typst/install.sh | sh -s 0.10.0
```

Windows

```ps1
v="0.10.0"; irm https://typst.community/install_typst/install.ps1 | iex
```

</details>

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
