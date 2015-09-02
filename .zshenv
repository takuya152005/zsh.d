### ~/.zshenv

# おすすめ設定を読み込む。
source ~/.zsh.d/zshenv

# これより↓に自分用の設定を書く。
export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.8"`
PATH=${JAVA_HOME}/bin:${PATH}

# DBD::mysql設定(perl)
export DBD_MYSQL_CFLAGS=-I/Applications/XAMPP/bin/mysql
export DBD_MYSQL_LIBS="-L/Applications/XAMPP/bin/mysql -lmysqlclient"
export DBD_MYSQL_EMBEDDED=
export DBD_MYSQL_CONFIG=/Applications/XAMPP/xamppfiles/bin/mysql_config
export DBD_MYSQL_NOCATCHSTDERR=0
export DBD_MYSQL_NOFOUNDROWS=0
export DBD_MYSQL_SSL=
export DBD_MYSQL_TESTDB=test
export DBD_MYSQL_TESTHOST=localhost
export DBD_MYSQL_TESTPASSWORD=
export DBD_MYSQL_TESTPORT=3306
export DBD_MYSQL_TESTUSER=root
export DYLD_LIBRARY_PATH="/Applications/XAMPP/bin:$DYLD_LIBRARY_PATH"
PATH=/Applications/XAMPP/bin:${PATH}


