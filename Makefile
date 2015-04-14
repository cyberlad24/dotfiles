install-homebrew:
ifeq ($(shell uname),Darwin)
	@make install-homebrew-osx
endif
ifeq ($(shell uname),Linux)
	@make install-homebrew-linux
endif

clean: clean-aliases \
	clean-git \
	clean-homebrew \
	clean-node \
	clean-ohmyzsh \
	clean-ruby \
	clean-tmux \
	clean-vim

install: install-aliases \
	install-homebrew \
	install-homebrew-packages \
	install-node \
	install-node-packages \
	install-ohmyzsh \
	install-ruby \
	install-rubygems-packages \
	install-vim \
	symlink-git \
	symlink-tmux

install-aliases:
	ln -s ~/.dotfiles/templates/.aliases ~/.aliases

clean-aliases:
	rm -f ~/.aliases

install-homebrew-linux:
	sudo apt-get install build-essential curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev libpython-dev zsh
	export PATH="$HOME/.linuxbrew/bin:$PATH"
	export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
	export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

install-homebrew-osx:
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

install-homebrew-packages:
	brew install ack  						--overwrite # grep-like text finder
	brew install arp-scan 					--overwrite # the ARP scanner
	brew install coreutils  --default-names --overwrite # most essential UNIX commands
	brew install git 						--overwrite # git from homebrew
	brew install git-extras 				--overwrite # git utilities
	brew install jsawk 						--overwrite # like awk, but for JSON
	brew install ngrok 						--overwrite # secure introspectable tunnels to localhost
	brew install rbenv 						--overwrite # picks a Ruby version
	brew install ruby-build					--overwrite # rbenv plugin that provides an rbenv install
	brew install tig   						--overwrite # git ncurses interface
	brew install tmux  						--overwrite # terminal multiplexer
	brew install vim   --override-system-vi --overwrite # vim editor
	brew install watch 						--overwrite # runs the specified command repeatedly
	brew install wget 						--overwrite # web get
	brew install htop						--overwrite # nice top command

clean-homebrew:
	rm -rf /usr/local/Cellar
	brew prune
	rm -rf /usr/local/.git

install-ruby:
	rbenv install 2.2.1
	rbenv global 2.2.1

clean-ruby:
	rm -rf ~/.rbenv

install-rubygems-packages:
	gem install compass                     			# open-source CSS authoring framework
	gem install jekyll				    				# simple, blog-aware, static sites
	gem install tmuxinator			    				# manage tmux sessions easily
	gem install gist 			  	    				# post gists

install-node:
	git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`
	. ~/.nvm/nvm.sh && nvm install stable && nvm use stable && nvm alias default stable

install-node-packages:
	. ~/.nvm/nvm.sh && npm install -g bower grunt-cli http-server jshint less

clean-node:
	rm -rf ~/.nvm
	rm -rf ~/.npm

symlink-git:
	ln -s ~/.dotfiles/templates/.gitconfig ~/.gitconfig
	ln -s ~/.dotfiles/templates/.gitignore_global ~/.gitignore_global

clean-git:
	rm -f ~/.gitconfig
	rm -f ~/.gitignore_global

symlink-tmux:
	ln -s ~/.dotfiles/templates/.tmux.conf ~/.tmux.conf

clean-tmux:
	rm -f ~/.tmux.conf

install-vim:
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	ln -s ~/.dotfiles/templates/.vimrc ~/.vimrc
	vim +PluginInstall +qall

clean-vim:
	rm -rf ~/.vim
	rm -rf ~/.vimrc

install-ohmyzsh:
	git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.dotfiles/.oh-my-zsh
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.dotfiles/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
	ln -s ~/.dotfiles/templates/.zshrc ~/.zshrc
	touch ~/.z
	chsh -s /bin/zsh

clean-ohmyzsh:
	rm -rf ~/.z											# quick navigation through folders
	rm -rf ~/.zshrc                         			# linked zsh conf file
	rm -rf ~/.dotfiles/.oh-my-zsh						# in case is already cloned
	chsh -s /bin/bash 									# change back to bash

post-install:
	brew update                                         # just in case
	brew doctor                                         # check if all went ok with homebrew
	gist --login 										# configure homebrew gist
	tmuxinator doctor                                   # check if all went ok with tmuxinator

install-wiki:
	git clone https://github.com/fer/dotfiles.wiki.git ~/.dotfiles/dotfiles.wiki

install-iterm2-shell-integration:
	curl -L iterm2.com/misc/install_shell_integration.sh | bash

pre-osx:
	sudo xcode-select --install
	brew install caskroom/cask/brew-cask
	# Quick Look plugins
	brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package
	# TODO: kill finder after installing brew cast packages
	# defaults write com.apple.finder QLEnableTextSelection -bool true && killall Finder 
	
	# TODO: install google-chrome, iterm2, sizeup, webstorm, menumeters, transmission, dropbox, spotify, skype
	# 	evernote, readkit, type2phone, 1password, vlc
