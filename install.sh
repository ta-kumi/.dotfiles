#!/bin/bash

# path
DOTPATH=~/.dotfiles

# mkdir
if [[ ! -d ${HOME}/local ]]; then
	mkdir ${HOME}/local
fi
if [[ ! -d ${HOME}/bin ]]; then
	mkdir ${HOME}/bin
fi
if [[ ! -d ${HOME}/.config/zsh ]]; then
	mkdir ${HOME}/.config/zsh
fi

# dotfiles
for file in .??*
do
	[ ${file} = ".git" ] && continue
	[ ${file} = ".gitignore" ] && continue
	[ ${file} = ".config" ] && continue

	ln -snfv $DOTPATH/${file} ${HOME}/${file}
done
if [[ ! -e ${HOME}/.config ]]; then
	mkdir ${HOME}/.config
fi
ln -snfv ${DOTPATH}/.config/nvim ${HOME}/.config/nvim

# tmux plugin
if [[ ! -d ${HOME}/.tmux/plugins/tpm ]]; then
	git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
fi

# zsh completion
if [[ ! -e ${HOME}/.config/zsh/az.completion ]]; then
	wget https://raw.githubusercontent.com/Azure/azure-cli/dev/az.completion -O ${HOME}/.config/zsh/az.completion
fi
