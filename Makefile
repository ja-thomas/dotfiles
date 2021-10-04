# Ubuntu 20.04 makefile
#
# Author: Janek Thomas
#


update:
	sudo apt update

upgrade:
	make update
	sudo apt -y upgrade

basics:
	make upgrade
	sudo apt -y install vim git tmux meld

chrome:
	rm -f google-chrome-stable_current_amd64.deb
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo apt -y install libappindicator1 libindicator7
	sudo dpkg -i google-chrome-stable_current_amd64.deb
	rm -f google-chrome-stable_current_amd64.deb

dotfiles:
	git clone git@github.com:ja-thomas/dotfiles.git ~/dotfiles 

enpass:
	echo "deb https://apt.enpass.io/ stable main" | sudo tee -a /etc/apt/sources.list.d/enpass.list
	wget -O - https://apt.enpass.io/keys/enpass-linux.key | sudo tee /etc/apt/trusted.gpg.d/enpass.asc        
	make update
	sudo apt -y install enpass

latex:
	sudo apt install texlive-full pandoc pandoc-citeproc

links:
	ln -s ~/dotfiles/.Renviron ~/.Renviron
	ln -s ~/dotfiles/.Rprofile ~/.Rprofile
	ln -s ~/dotfiles/.gitconfig ~/.gitconfig
	ln -s ~/dotfiles/.aliases ~/.aliases
	ln -s ~/dotfiles/.zshrc ~/.zshrc
	ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

mattermost:
	sudo snap install mattermost-desktop --beta

python:
	sudo apt -y install python3-dev python3-venv python3-pip ipython3
	pip3 install black
R:
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
	sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
	sudo apt -y install r-base r-base-dev
	sudo apt -y install libxml2-dev libssl-dev libcurl4-openssl-dev
	mkdir -p ~/.R/library
	sudo apt -y install r-cran-xml2
	Rscript -e "install.packages(c('remotes'))"
	Rscript -e "remotes::install_github('rdatsci/rtcl')"
	rtcl --init

slack:
	sudo snap install slack --classic

spotify:
	sudo snap install spotify

ssh-key:
	ssh-keygen -t rsa -b 4096 -C "janek.tho@gmail.com"
	ssh-add ~/.ssh/id_rsa

telegram:
	sudo snap install telegram-desktop

vscode:
	wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
	sudo apt install code
	code --install-extension ikuyadeu.r
	code --install-extension James-Yu.latex-workshop
	code --install-extension vscodevim.vim
	code --install-extension ms-python.python
zsh:
	sudo apt -y install zsh
	sudo usermod -s /usr/bin/zsh janek
	chsh -s /usr/bin/zsh

ohmyzsh:
	wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
	sh ./install.sh

powerlevel10:
	wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
	wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
	wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
	wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

zoom:
	wget https://zoom.us/client/latest/zoom_amd64.deb
	sudo apt install ./zoom_amd64.deb
	rm zoom_amd64.deb
