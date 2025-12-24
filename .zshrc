# 環境変数
## 言語設定(apt install language-pack-ja)
export LANG=ja_JP.UTF-8
## XDG configuration
export XDG_CONFIG_HOME=$HOME/.config
## path設定
path=($HOME/local/bin $path)
path=($HOME/.local/bin $path)
path=($HOME/bin $path)

# brew install commands path設定
## coreutils, findutils, grep, gawk, gnu-sed, gzip, gnu-tar
if type brew &> /dev/null; then
	brewpath="/opt/homebrew"
	for bindir in "${brewpath}/opt/"*"/libexec/gnubin"; do export PATH=$bindir:$PATH; done
	for mandir in "${brewpath}/opt/"*"/libexec/gnuman"; do export MANPATH=$mandir:$MANPATH; done
	unset brewpath
fi

# メタ文字対策
setopt nonomatch

# キー設定
## キーバインドをemacs風に
bindkey -e
## Ctrl+sのロック, Ctrl+qのロック解除を無効にする
stty stop undef
stty start undef
bindkey "^[[3~" delete-char
## Ctrl+カーソルキー移動の有効化
bindkey ";5C" forward-word
bindkey ";5D" backward-word
bindkey "5C" forward-word
bindkey "5D" backward-word
## Ctrl-Dでログアウトしない
setopt ignoreeof

# エイリアス設定
## sudo
alias sudo='sudo '
## ls
alias ls='ls -F --color'
alias la='ls -F --color -a'
alias ll='ls -F --color -lh'
alias lla='ls -F --color -lha'
alias lls='ls -F --color -lhS'
alias llt='ls -F --color -lht'
## files
alias md='mkdir -p'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
## find
alias fn='find -iname'
## grep
alias gr='grep --color -irn --include="*"'
alias grl='grep --color -irl --include="*"'
## global alias
alias -g L='| less'
alias -g H='| head -n'
alias -g T='| tail -n'
alias -g G='| grep --color -i'
## tmux
alias t='tmux'
alias tl='tmux ls'
alias tn='tmux new -s'
alias ta='tmux a -t'
alias tk='tmux kill-session -t'
alias tka='tmux kill-server'
## git
alias g='git'
alias gs='git status'
alias ga='git add'
alias gu='git restore --staged'
alias gc='git commit'
alias gcm='git commit -m'
alias grs='git reset'
alias grb='git rebase -i'
alias gsv='git stash'
alias gld='git stash pop'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdi='git diff --no-index'
alias gch='git checkout'
alias gchb='git checkout -b'
alias gb='git branch'
alias gbm='git branch --merged'
alias gbn='git branch --no-merged'
alias gmr='git merge'
alias gcp='git cherry-pick -e'
alias gdump='git cat-file -p'
alias gcl='git clone --recursive'
alias gfe='git fetch --prune'
alias gps='git push'
alias gpsb='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias gpl='git pull'
alias gplb='git pull origin $(git rev-parse --abbrev-ref HEAD)'
alias gl='git log --graph --decorate'
alias gla='git log --graph --decorate --all'
alias glo='git log --graph --decorate --oneline'
alias gloa='git log --graph --decorate --oneline --all'
## docker
alias d='docker'
alias di='docker image'
alias dil='docker image ls'
alias dila='docker image ls -a'
alias dirm='docker image rm'
alias dipr='docker image prune'
alias dc='docker container'
alias dcl='docker container ls'
alias dcla='docker container ls -a'
alias dcrm='docker container rm'
alias dcpr='docker container prune'
alias dn='docker network'
alias dnl='docker network ls'
alias dni='docker network inspect'
alias dnco='docker network connect'
alias dndi='docker network disconnect'
alias dncr='docker network create'
alias dnrm='docker network rm'
alias dnpr='docker network prune'
alias dsta='docker start'
alias dsto='docker stop'
alias dl='docker logs'
alias dr='docker run --rm -it *image* /bin/bash'
alias de='docker exec -it *container* /bin/bash'
alias db='docker build -t *imagename* .'
alias d-='docker compose'
alias d-u='docker compose up --build'
alias d-d='docker compose down'
## kubernetes
alias k='kubectl'
alias kcu='kubectl config get-contexts'
alias kch='kubectl config use-context'
alias ki='kubectl describe'
alias kic='kubectl cluster-info'
alias kg='kubectl get'
alias kga='kubectl get all -o wide'
alias kl='kubectl logs'
alias ktest='kubectl run busybox --image busybox --restart Never --rm -it sh'
alias kr='kubectl run'
alias ke='kubectl exec -it *pod* -c *container* /bin/bash'
alias kc='kubectl create'
alias ka='kubectl apply'
alias ks='kubectl scale'
alias kd='kubectl delete'
## commands
alias to='touch'
alias wi='which'
alias pico='sudo picocom /dev/ttyUSB0 -b 115200'
alias dd='sudo dd if=* of=* bs=64M status=progress'
## rust
alias c='cargo'
alias cn='cargo new'
alias cr='RUST_BACKTRACE=1 cargo run'
alias cf='cargo fmt'
alias cb='cargo build'
alias cc='cargo check'
alias ct='RUST_BACKTRACE=1 cargo test -- --nocapture'
alias cs='cargo search'
alias ca='cargo add'
alias crm='cargo remove'
alias ci='cargo install'
alias cu='cargo uninstall'
## python
alias u='uv'
alias ut='uvx'
alias ui='uv init'
alias ur='uv run'
alias ua='uv add'
alias ul='uv pip list'
alias urm='uv remove'
alias upl='uv python list'
alias upf='uv python find'
alias upi='uv python install'
alias upu='uv python uninstall'
alias upp='uv python pin'
## alias expand
function expand-alias() {
	zle _expand_alias
	zle self-insert
}
zle -N expand-alias
bindkey -M main ' ' expand-alias

# 色設定
## 色を使用
autoload -Uz colors
colors
## 256色を使用
export TERM=xterm-256color
## ls color
export LSCOLORS=gxfxcxdxbxegedabagacag
export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;46'
# 補完候補もLS_COLORSに合わせて色が付くようにする
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# プロンプト表示系
## 基本設定
PROMPT="%F{white}[%n@%m] %F{yellow}%d%F{reset_color}
%# "
## git設定
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
### stageされているがコミットされていないものがあれば[黄色で!]
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
### addされていないものがあれば[赤色で+]
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
### 通常状態なら[緑色で]
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
### 上記の表示形式
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

# 補完機能系
## FPATH系
### brew
if type brew &> /dev/null; then
	FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi
### rust(cargo)
if type rustc &> /dev/null; then
	FPATH="$(rustc --print sysroot)/share/zsh/site-functions:${FPATH}"
fi
## bash互換レイヤーを有効化
autoload -Uz bashcompinit && bashcompinit
## 補完の挙動設定系
### 補完で大文字にもマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
### 補完候補一覧表示
setopt auto_list
### tabで補完候補切り替え
setopt auto_menu
### tab,矢印キーで補完選択
zstyle ':completion:*:default' menu select=1
## 補完有効化
autoload -Uz compinit && compinit
## completion設定読み込みk系
### kubectl
if type kubectl &> /dev/null; then
	source <(kubectl completion zsh)
fi
### azure cli
if [[ -f "$HOME/.config/zsh/az.completion" ]]; then
	source $HOME/.config/zsh/az.completion
fi
### rust(rustup)
if type rustup &> /dev/null; then
	source <(rustup completions zsh)
fi
### uv
if type uv &> /dev/null; then
	source <(uv generate-shell-completion zsh)
fi

# 移動系
## ディレクトリ名だけで移動
setopt auto_cd
## cdしたら自動でpushdする
setopt auto_pushd
## pushdから重複を削除
setopt pushd_ignore_dups
## cd -[Tab]で移動履歴検索
setopt auto_pushd
## cdしたら自動でlsする
chpwd() {
	ls
}

# 区切り文字系
## 単語の区切り文字設定
autoload -Uz select-word-style
select-word-style default
## ここで指定した文字は単語区切りとみなされる
## / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# history系
## 保存先
HISTFILE=$HOME/.zsh-history
## 保存サイズ
HISTSIZE=1000000  # メモリ
SAVEHIST=1000000  # ファイル
## 異なるウィンドウでもhistoryを共有
setopt share_history
## 重複コマンドを記録しない
setopt hist_ignore_all_dups
## コマンド履歴検索
## Ctrl-P（前）/Ctrl-N（後）
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# プログラミング関係
## go
if type go &> /dev/null; then
	path=($HOME/go/bin $path)
fi

# その他
## デフォルトシェルの設定
export EDITOR='vim'
export VISUAL='vim'
## ビープ音無効
setopt no_beep
setopt no_hist_beep
setopt no_list_beep
## コマンド訂正
setopt correct
## #をコマンドとみなす
setopt interactive_comments
