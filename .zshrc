### ~/.zshrc

# おすすめ設定を読み込む。
source ~/.zsh.d/zshrc

# これより↓に自分用の設定を書く。

preexec () {
  [ ${STY} ] && echo -ne "\ek${1%% *}\e\\"  # 20070907 修正
}
[ ${STY} ] || screen -rx || screen -D -RR  # 20070905 修正

## MacVim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim -u $HOME/.vimrc "$@"'
#alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

