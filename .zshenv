### ~/.zshenv

# おすすめ設定を読み込む。
source ~/.zsh.d/zshenv

# これより↓に自分用の設定を書く。
export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.8"`
PATH=${JAVA_HOME}/bin:${PATH}
