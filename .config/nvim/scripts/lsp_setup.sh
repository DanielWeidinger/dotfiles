# !/bin/bash

 echo --TSServer
 sudo npm install -g typescript typescript-language-server
        
 echo --Python 
 sudo npm install -g pyright

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

 echo --eslint + prettier
 sudo npm install -g eslint_d prettier_d_slim

 echo '--General purpose lang server (efm)'
 export GO111MODULE=on
 go get github.com/mattn/efm-langserver@latest

echo --Lua
lua_dir="$HOME/.vim/lang-servers/"
if [ ! -d "$lua_dir" ]; then
    mkdir $lua_dir
fi
cd $lua_dir
git clone https://github.com/sumneko/lua-language-server
cd lua-language-server
git submodule update --init --recursive
cd 3rd/luamake
./compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild
# cd ~/.vim
# sudo rm -r -f lang-servers
# mkdir lang-servers
# mv lua-language-server/bin/Linux/lua-language-server lang-servers
# mv lua-language-server/bin/Linux/main.lua lang-servers
# chmod +x lang-servers/lua-language-server
# sudo rm -r -f lua-language-server
