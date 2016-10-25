# .bash_aliasesの中身
echo '.bash_aliases'

# Aliases for MSYS2 bash
# alias hogeを一時的に無効にするには\hoge

# 移動しやすく
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'

# lsを使いやすく
alias ls='ls --color=auto --show-control-chars --time-style=long-iso -FH'
alias ll='ls -lA'
alias la='ls -A'
alias sl=ls

# 設定の読み込み
alias relogin='exec $SHELL -l'
alias re=relogin

# 画面消去
alias c=clear
alias cls=reset

# Windowsっぽく
alias dir=ll
alias path='echo -e ${PATH//:/\\n}'

# ディスクサイズ
alias df='df -h'
alias du='du -h'
alias du1='du -d1'

# grepを使いやすく
# grep -r hogeで./以下のファイルの中身からhogeを検索
# find | grep hogeで./以下のファイル名からhogeを検索
# whereis hogeでコマンドの関連場所を検索(bin, src, man)
# type -a hogeでコマンドを検索
alias grep='grep --color'

# Windowsコマンド文字化け対策
function wincmd()
{
    CMD=$1
    shift
    $CMD $* 2>&1 | iconv -f CP932 -t UTF-8
}
alias cmd='winpty cmd'
alias psh='winpty powershell'
alias ifconfig='wincmd ipconfig'
alias netstat='wincmd netstat'
alias netsh='wincmd netsh'
# pingのコマンド名混同を避けるため絶対パスで指定
alias ping='wincmd /c/windows/system32/ping'

# ネットワーク確認用
alias ping1='ping www.google.com'
alias ping2='ping 192.168.0.1'

# mingw32用
# msysのmakeと被らないようにコマンド名が変えられている
alias make='mingw32-make'
alias m='make -j3'

alias cscript='wincmd cscript'
alias ping='wincmd ping'
alias shutdown='wincmd shutdown'
alias open='cygstart'
alias atom='atom.cmd'
alias apm='apm.cmd'
alias diff='colordiff'
alias arduino='wincmd arduino'
alias open='start'
