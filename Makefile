# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aoizel <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/20 10:17:45 by aoizel            #+#    #+#              #
#    Updated: 2024/02/20 11:19:04 by aoizel           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	cp -r nvim_config ~/.config/
	mv ~/.config/nvim_config ~/.config/nvim
	echo '' >> ~/.zshrc
	echo 'alias nvim="~/Downloads/nvim-linux64/bin/nvim' >> ~/.zshrc
	cp aka.zsh-theme ~/.oh-my-zsh/themes/
	nvim
