### ~/.zshenv

# おすすめ設定を読み込む。
source ~/.zsh.d/zshenv

# これより↓に自分用の設定を書く。
#export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.8"`
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-15.jdk/Contents/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-16.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-18.jdk/Contents/Home
PAT=H${JAVA_HOME}/bin:${PATH}
