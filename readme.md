# Some thing you need to do to use this init.vim

## XDG Base Directory

	export XDG_CONFIG_HOME=$HOME/.config
	export XDG_CACHE_HOME=$HOME/.cache
	export XDG_DATA_HOME=$HOME/.local/share

## [vim-solarized8](https://github.com/vim-solarized8)

	ln -s $XDG_DATA_HOME/nvim/plugged/vim-solarized8/colors $XDG_DATA_HOME/nvim/site/colors

## [vim-markdown-composer](https://github.com/euclio/vim-markdown-composer)

Check [vim-markdown-composer](https://github.com/euclio/vim-markdown-composer) for install instructions

## [go-langserver](https://github.com/sourcegraph/go-langserver)

To install go-langserver:

	go get -u github.com/sourcegraph/go-langserver

Remember add `$GOPATH` to `$PATH`, such as:

	export GOPATH=~/go/bin:~/go
	export PATH=$PATH:$GOPATH
	export PATH=$PATH:/usr/local/go/bin

## [python-language-server](https://github.com/palantir/python-language-server)

To install pyls:

	pip install python-language-server

## [Installing Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

If you're using Neovim, check [Installing Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) for install instruction.
