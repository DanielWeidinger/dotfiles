dap_dir="$HOME/.local/share/nvim/debugger"
if [ ! -d "$dap_dir" ]; then
	mkdir $dap_dir
fi
cd $dap_dir

echo --NodeJs Debugger
cd ~/.local/share/nvim/debugger
git clone git@github.com:microsoft/vscode-js-debug.git
cd vscode-js-debug
npm install --legacy-peer-deps
npx gulp dapDebugServer
