### ~/.zshrc

# おすすめ設定を読み込む。
source ~/.zsh.d/zshrc

# これより↓に自分用の設定を書く。

preexec () {
  [ ${STY} ] && echo -ne "\ek${1%% *}\e\\"  # 20070907 修正
}
# [ ${STY} ] || screen -rx || screen -D -RR  # 20070905 修正

## MacVim brewでインストールのため必要なし
#alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim -u $HOME/.vimrc "$@"'
#alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# nvm(Node Version Manager)
#source ~/.nvm/nvm.sh

# The next line updates PATH for the Google Cloud SDK.
#source ~/shell/google/google-cloud-sdk/path.zsh.inc

# The next line enables shell command completion for gcloud.
#source ~/shell/google/google-cloud-sdk/completion.zsh.inc

# git
git config --global alias.loga 'log --graph --oneline --decorate=full  --date=short --format="%C(yellow)%h%C(reset) %C(magenta)[%ad]%C(reset)%C(auto)%d%C(reset) %s %C(cyan)@%an%C(reset)"'

# ruby rbenv
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

# screenのセッション保存
export SCREENDIR=~/.zsh.d/screen

# Go
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# nodebrew デフォルトのnodeを使用する場合はコメントすること
export PATH=$HOME/.nodebrew/current/bin:$PATH


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/t-iwamoto/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/t-iwamoto/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/t-iwamoto/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/t-iwamoto/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

# direnv setting
eval "$(direnv hook zsh)"


# mysql
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/sbin:$PATH"
