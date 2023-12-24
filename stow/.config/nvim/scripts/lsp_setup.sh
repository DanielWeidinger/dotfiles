# !/bin/bash

echo --TSServer
sudo npm install -g typescript typescript-language-server

echo --Python
sudo npm install -g pyright
sudo pacman -S autopep8 --noconfirm

echo --Docker
sudo npm install -g dockerfile-language-server-nodejs

echo --Bash
sudo npm install -g bash-language-server

echo --Bash Formatting
sudo pacman -S shfmt --noconfirm

echo --JSON, CSS and HTML
sudo npm install -g vscode-langservers-extracted

echo --YAML
sudo npm install -g yaml-language-server

echo --Emmet
sudo npm install -g emmet-ls

echo --eslint + prettier
sudo npm install -g eslint_d @fsouza/prettierd

echo --Lua
langserver_dir="$HOME/.local/share/nvim/lang-servers"
if [ ! -d "$langserver_dir" ]; then
	mkdir $langserver_dir
fi
sudo pacman -S stylua --noconfirm
cd $langserver_dir
git clone https://github.com/LuaLS/lua-language-server
cd lua-language-server
git submodule update --init --recursive
cd 3rd/luamake
./compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild

echo --LaTex
sudo pacman -S texlab --noconfirm

# echo --OmniSharp
# cd $langserver_dir
# if [ ! -d "omnisharp" ]; then
# 	mkdir omnisharp
# fi
# cd omnisharp
# curl -s https://api.github.com/repos/OmniSharp/omnisharp-roslyn/releases/latest |
# 	grep "browser_download_url.*omnisharp-linux-x86.tar.gz" |
# 	cut -d : -f 2,3 |
# 	tr -d \" |
# 	wget -qi -
# tar -xzf omnisharp-linux-x86.tar.gz
