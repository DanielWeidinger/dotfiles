echo Installing dependencies
./scripts/dependencies.sh

echo --Downloading Repo...
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout stable

echo --Installing...
sudo make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/usr/ install

cd ..
sudo rm -r -f neovim
