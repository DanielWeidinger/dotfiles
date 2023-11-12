# Interactive sub-shells source .env, unless this is bash or zsh,
# because they already sourced .env in .bashrc or .zshrc.
if test -z "$BASH_VERSION" -a -z "$ZSH_VERSION" || test -n "$BASH_VERSION" -a \( "${BASH##*/}" = "sh" \); then
	test -f "$HOME"/.env && . "$HOME"/.env
fi
