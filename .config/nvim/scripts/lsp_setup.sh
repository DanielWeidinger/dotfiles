#!/bin/sh

echo --TSServer
sudo npm install -g typescript typescript-language-server
        
echo --Python 
sudo -H pip install python-lsp-server

echo --JSON
sudo npm install -g vscode-langservers-extracted

echo --Docker
sudo npm install -g dockerfile-language-server-nodejs

echo --Bash
sudo npm install -g bash-language-server

echo --CSS and HTML
sudo npm install -g vscode-langservers-extracted

echo --Emmet
sudo npm install -g emmet-ls

# echo --Lua
# cd ~/.vim
# git clone https://github.com/sumneko/lua-language-server
# cd lua-language-server
# git submodule update --init --recursive
# git checkout 9b33f628e7904a6bac6051d6d590a4b595257c6b #TODO: remove when maintainer fixed version error
# cd 3rd/luamake
# ./compile/install.sh
# cd ../..
# ./3rd/luamake/luamake rebuild
# cd ~/.vim
# sudo rm -r -f lang-servers
# mkdir lang-servers
# mv lua-language-server/bin/Linux/lua-language-server lang-servers
# mv lua-language-server/bin/Linux/main.lua lang-servers
# chmod +x lang-servers/lua-language-server
# sudo rm -r -f lua-language-server
