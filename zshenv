# -*- mode: sh; indent-tabs-mode: nil -*-

# パスの設定
## 重複したパスを登録しない。
typeset -U path
## (N-/): 存在しないディレクトリは登録しない。
##    パス(...): ...という条件にマッチするパスのみ残す。
##            N: NULL_GLOBオプションを設定。
##               globがマッチしなかったり存在しないパスを無視する。
##            -: シンボリックリンク先のパスを評価。
##            /: ディレクトリのみ残す。
path=(# システム用
      /bin(N-/)
      # 自分用（--prefix=$HOME/localでインストールしたもの）
      $HOME/local/bin(N-/)
      # 自分用（gem install --user-installでインストールしたもの）
      ## 2012-01-07
      $HOME/.gem/ruby/*/bin(N-/)
      # rbenv用
      ## 2012-02-21
      $HOME/.rbenv/bin(N-/)
      ## 2022-07-30 ggrep
      /opt/homebrew/opt/grep/libexec/gnubin(N-/)
      # Debian GNU/Linux用
      /var/lib/gems/*/bin(N-/)
      # MacPorts用
      /opt/local/bin(N-/)
      # Solaris用
      /opt/csw/bin(N-/)
      /usr/sfw/bin(N-/)
      /usr/ccs/bin(N-/)
      # Cygwin用
      /cygdrive/c/meadow/bin(N-/)
      # システム用
      /sbin(N-/)
      /usr/local/bin(N-/)
      /usr/local/sbin(N-/)
      /usr/bin(N-/)
      /usr/sbin(N-/)
      /usr/games(N-/))

# sudo時のパスの設定
## -x: export SUDO_PATHも一緒に行う。
## -T: SUDO_PATHとsudo_pathを連動する。
typeset -xT SUDO_PATH sudo_path
## 重複したパスを登録しない。
typeset -U sudo_path
## (N-/): 存在しないディレクトリは登録しない。
##    パス(...): ...という条件にマッチするパスのみ残す。
##            N: NULL_GLOBオプションを設定。
##               globがマッチしなかったり存在しないパスを無視する。
##            -: シンボリックリンク先のパスを評価。
##            /: ディレクトリのみ残す。
sudo_path=({,/usr/pkg,/usr/local,/usr}/sbin(N-/))

if [ $(id -u) -eq 0 ]; then
    # rootの場合はsudo用のパスもPATHに加える。
    path=($sudo_path $path)
else
    # 一般ユーザーの場合はsudo時にsudo用のパスをPATHに加える。
    # alias sudo="sudo env PATH=\"$SUDO_PATH:$PATH\""
    :
fi

# man用パスの設定
## 重複したパスを登録しない。
typeset -U manpath
## (N-/) 存在しないディレクトリは登録しない。
##    パス(...): ...という条件にマッチするパスのみ残す。
##            N: NULL_GLOBオプションを設定。
##               globがマッチしなかったり存在しないパスを無視する。
##            -: シンボリックリンク先のパスを評価。
##            /: ディレクトリのみ残す。
manpath=(# 自分用
         $HOME/local/share/man(N-/)
         # MacPorts用
         /opt/local/share/man(N-/)
         # Solaris用
         /opt/csw/share/man(N-/)
         /usr/sfw/share/man(N-/)
         # システム用
         /usr/local/share/man(N-/)
         /usr/share/man(N-/))

# Rubyの設定
## ライブラリのロードパス
### -x: export RUBYLIBも一緒に行う。
### -T: RUBYLIBとruby_pathを連動する。
typeset -xT RUBYLIB ruby_path
### 重複したパスを登録しない。
typeset -U ruby_path
### パスを設定
ruby_path=(# カレントディレクトリのライブラリを優先する
           ./lib)

# Pythonの設定
## ライブラリのロードパス
### -x: export PYTHONPATHも一緒に行う。
### -T: PYTHONPATHとpython_pathを連動する。
typeset -xT PYTHONPATH pyhon_path
### 重複したパスを登録しない。
typeset -U python_path
### パスを設定。
python_path=(# カレントディレクトリのライブラリを優先する
             ./lib)

# pkg-configの設定
## .pcのロードパス
### -x: export PKG_CONFIG_PATHも一緒に行う。
### -T: PKG_CONFIG_PATHとpkg_config_pathを連動する。
typeset -xT PKG_CONFIG_PATH pkg_config_path
### 重複したパスを登録しない。
typeset -U pkg_config_path
### パスを設定。
### (N-/) 存在しないディレクトリは登録しない。
###    パス(...): ...という条件にマッチするパスのみ残す。
###            N: NULL_GLOBオプションを設定。
###               globがマッチしなかったり存在しないパスを無視する。
###            -: シンボリックリンク先のパスを評価。
###            /: ディレクトリのみ残す。
pkg_config_path=(# 自分用
                 $HOME/local/lib/pkgconfig(N-/)
                 # MacPorts用
                 /opt/local/lib/pkgconfig(N-/))

# ページャの設定
if type lv > /dev/null 2>&1; then
    ## lvを優先する。
    export PAGER="lv"
else
    ## lvがなかったらlessを使う。
    export PAGER="less"
fi

# lvの設定
## -c: ANSIエスケープシーケンスの色付けなどを有効にする。
## -l: 1行が長くと折り返されていても1行として扱う。
##     （コピーしたときに余計な改行を入れない。）
export LV="-c -l"

if [ "$PAGER" != "lv" ]; then
    ## lvがなくてもlvでページャーを起動する。
    alias lv="$PAGER"
fi

# lessの設定
## -R: ANSIエスケープシーケンスのみ素通しする。
## 2012-09-04
export LESS="-R"

# grepの設定
## GNU grepがあったら優先して使う。
if type ggrep > /dev/null 2>&1; then
    alias grep=ggrep
fi
## grepのバージョンを検出。
grep_version="$(grep --version | head -n 1 | sed -e 's/^[^0-9.]*\([0-9.]*\)[^0-9.]*$/\1/')"
## デフォルトオプションの設定
export GREP_OPTIONS
### バイナリファイルにはマッチさせない。
GREP_OPTIONS="--binary-files=without-match"
case "$grep_version" in
    1.*|2.[0-4].*|2.5.[0-3])
        ;;
    *)
        ### grep 2.5.4以降のみの設定
        ### grep対象としてディレクトリを指定したらディレクトリ内を再帰的にgrepする。
        GREP_OPTIONS="--directories=recurse $GREP_OPTIONS"
        ;;
esac
### 拡張子が.tmpのファイルは無視する。
GREP_OPTIONS="--exclude=\*.tmp $GREP_OPTIONS"
## 管理用ディレクトリを無視する。
#if grep --help 2>&1 | grep -q -- --exclude-dir; then
    GREP_OPTIONS="--exclude-dir=.svn $GREP_OPTIONS"
    GREP_OPTIONS="--exclude-dir=.git $GREP_OPTIONS"
    GREP_OPTIONS="--exclude-dir=.deps $GREP_OPTIONS"
    GREP_OPTIONS="--exclude-dir=.libs $GREP_OPTIONS"
#fi
### 可能なら色を付ける。
#if grep --help 2>&1 | grep -q -- --color; then
    GREP_OPTIONS="--color=auto $GREP_OPTIONS"
#fi

# sedの設定
## GNU sedがあったら優先して使う。
## 2012-03-04
if type gsed > /dev/null 2>&1; then
    alias sed=gsed
fi

# エディタの設定
## vimを使う。
export EDITOR=vim
## vimがなくてもvimでviを起動する。
if ! type vim > /dev/null 2>&1; then
    alias vim=vi
fi

# メールアドレスの設定
## ~/.zsh.d/email → ~/.emailの順に探して最初に見つかったファイルから読み込む。
## (N-.): 存在しないファイルは登録しない。
##    パス(...): ...という条件にマッチするパスのみ残す。
##            N: NULL_GLOBオプションを設定。
##               globがマッチしなかったり存在しないパスを無視する。
##            -: シンボリックリンク先のパスを評価。
##            .: 通常のファイルのみ残す。
email_files=(~/.zsh.d/email(N-.)
             ~/.email(N-.))
for email_file in ${email_files}; do
    export EMAIL=$(cat "$email_file")
    break
done

# VTEの設定
## 2013-07-14
## gnome-terminal 2.32以降で新しいタブを開いたときに
## カレントディレクトリーが前のタブと同じにならない問題への対応
## 参考: https://bugzilla.gnome.org/show_bug.cgi?id=697475
##
## ディレクトリーが変わる毎に
## OSC (Operating System Command)エスケープシーケンスを送って
## 現在のディレクトリー情報を更新する必要があるらしい。
## 具体的には以下のエスケープシーケンス。\eがEscで\aがBEL。
## "\e7;"と"\a"の間に現在のディレクトリーをURI形式で入れる。
##   "\e7;file:///${PWD}\a"
## これを実行するシェルスクリプトが/etc/profile.d/vte.shに
## インストールされているので、あったら読み込む。
[ -f /etc/profile.d/vte.sh ] && . /etc/profile.d/vte.sh


# gradle用の設定
gradle_home=(/Applications/gradle(N-/))
path=($gradle_home/bin $path)
