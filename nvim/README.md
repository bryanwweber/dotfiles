# Neovim

Installing Neovim 0.7.0 or higher is required.

## Initial Setup

Plugins are managed with [`packer.nvim`](https://github.com/wbthomason/packer.nvim).
Install with:

```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Then, once the configuration is installed, run:

```shell
nvim -c ":PackerSync"
```

to install the configured plugins.

`coc.nvim` also has a list of plugins to install. Once `coc.nvim` is installed by
packer, open `nvim` and run:

```vim
:CocInstall <plugin>
```

The current list of plugins is:

- `coc-pyright`
