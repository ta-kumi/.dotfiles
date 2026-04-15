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
alias fnd='find -iname'
## grep
alias grp='grep --color -irn --include="*"'
alias grpf='grep --color -irl --include="*"'
## global alias
alias -g L='| less'
alias -g H='| head -n'
alias -g T='| tail -n'
alias -g G='| grep --color -i'
## vscode
alias e='code'
alias el='code --list-extensions'
alias ea='code --install-extension'
alias er='code --uninstall-extension'
alias ei='code-insiders'
alias eil='code-insiders --list-extensions'
alias eia='code-insiders --install-extension'
alias eir='code-insiders --uninstall-extension'
## tmux
alias t='tmux'
alias tl='tmux ls'
alias tn='tmux new -s'
alias ta='tmux a -t'
alias tk='tmux kill-session -t'
alias tka='tmux kill-server'
## git
alias v='git'
alias vn='git init'
alias vs='git status'
alias va='git add'
alias vr='git restore --staged'
alias vm='git submodule'
alias vma='git submodule add'
alias vms='git submodule sync'
alias vmu='git submodule update --init --recursive'
alias vp='git format-patch'
alias vpa='git apply'
alias vpc='git am'
alias vc='git commit'
alias vcm='git commit -m'
alias vrs='git reset'
alias vrb='git rebase -i'
alias vsv='git stash'
alias vld='git stash pop'
alias vd='git diff'
alias vdc='git diff --cached'
alias vdi='git diff --no-index'
alias vch='git checkout'
alias vchb='git checkout -b'
alias vb='git branch'
alias vbm='git branch --merged'
alias vbn='git branch --no-merged'
alias vmr='git merge'
alias vcp='git cherry-pick -e'
alias vdump='git cat-file -p'
alias vcl='git clone --recursive'
alias vfe='git fetch --prune'
alias vps='git push'
alias vpsb='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias vpl='git pull'
alias vplb='git pull origin $(git rev-parse --abbrev-ref HEAD)'
alias vl='git log --graph --decorate'
alias vla='git log --graph --decorate --all'
alias vlo='git log --graph --decorate --oneline'
alias vloa='git log --graph --decorate --oneline --all'
## docker
alias d='docker'
alias dsl='docker system df'
alias dspr='docker system prune'
alias di='docker image'
alias dil='docker image ls'
alias dila='docker image ls -a'
alias dii='docker image inspect'
alias dir='docker image rm'
alias dipr='docker image prune'
alias dc='docker container'
alias dcl='docker container ls'
alias dcla='docker container ls -a'
alias dci='docker container inspect'
alias dcr='docker container rm'
alias dcpr='docker container prune'
alias dv='docker volume'
alias dvl='docker volume ls'
alias dvr='docker volume rm'
alias dvpr='docker volume prune'
alias dn='docker network'
alias dnl='docker network ls'
alias dni='docker network inspect'
alias dnco='docker network connect'
alias dndi='docker network disconnect'
alias dnn='docker network create'
alias dnr='docker network rm'
alias dnpr='docker network prune'
alias dl='docker logs'
alias dtest='docker run --rm -it busybox /bin/sh'
alias dr='docker run --rm -it *image* /bin/bash'
alias de='docker exec -it *container* /bin/bash'
alias db='docker build -t *imagename* .'
alias dsta='docker start'
alias dsto='docker stop'
alias d-='docker compose'
alias d-b='docker compose build'
alias d-u='docker compose up'
alias d-d='docker compose down'
alias d-l='docker compose logs'
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
## bitbake
alias b='bitbake'
alias bs='bash -c "source *recipe* build && exec zsh"'
alias bll='bitbake-layers show-layers'
alias bcl='bitbake-layers create-layer'
alias bal='bitbake-layers add-layer'
alias blr='bitbake-layers show-recipes'
alias be='bitbake -e'
alias bb='bitbake -k'
alias bc='bitbake -c clean'
## commands
alias com='picocom /dev/ttyUSB0 -b 115200'
alias dd='dd if=* of=* bs=64M status=progress'
## rust
alias r='cargo'
alias rn='cargo new'
alias rf='cargo fmt'
alias rc='cargo check'
alias rb='cargo build'
alias rx='RUST_BACKTRACE=1 cargo run'
alias rt='RUST_BACKTRACE=1 cargo test -- --nocapture'
alias rpl='cargo tree --depth 1'
alias rplg='cargo install --list'
alias rpa='cargo add'
alias rpr='cargo remove'
alias rpu='cargo update'
alias rpag='cargo install'
alias rprg='cargo uninstall'
alias rpug='cargo install-update -a'
## python
alias p='uv'
alias pn='uv init'
alias px='uv run'
alias ppl='uv pip list'
alias ppa='uv add'
alias ppr='uv remove'
alias ppu='uv sync --upgrade'
alias pv='uv python'
alias pvv='uv run python --version'
alias pvl='uv python list --only-installed'
alias pvlr='uv python list'
alias pva='uv python install'
alias pvr='uv python uninstall'
alias pvp='uv python pin'
alias pvpg='uv python pin --global'
## node
alias n='npm'
alias nn='npm init'
alias nc='npm run lint'
alias nb='npm run build'
alias nx='npm run'
alias nt='npm run test'
alias npl='npm list'
alias nplg='npm list -g --depth=0'
alias npa='npm install'
alias npr='npm uninstall'
alias npu='npm update'
alias npag='npm install -g'
alias nprg='npm uninstall -g'
alias npug='npm update -g'
alias nv='nvm'
alias nvl='nvm ls'
alias nvlr='nvm ls-remote'
alias nvv='nvm current'
alias nva='nvm install'
alias nvr='nvm uninstall'
alias nvp='nvm use'
alias nvpf='nvm current > .nvmrc'
alias nvpg='nvm alias default'
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
if [[ -z "$TERM" ]]; then
  export TERM=xterm-256color
fi
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
precmd () {
	vcs_info
	enter_directory
}
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

# プログラミング関係
## go
if type go &> /dev/null; then
	path=($HOME/go/bin $path)
fi
## nvm
enter_directory() {
	if [[ $PWD == $PREV_PWD ]]; then
		return
	fi
	PREV_PWD=$PWD
	[[ -f ".nvmrc" ]] && current_node_ver=`cat .nvmrc` && nvm use $current_node_ver
}
unset PROMPT_COMMAND

# 補完機能系
## FPATH系
### zsh-completions
if [[ -d ${HOME}/.config/zsh/zsh-completions ]]; then
	FPATH="${HOME}/.config/zsh/zsh-completions/src:${FPATH}"
fi
### rust(cargo)
if type rustc &> /dev/null; then
	FPATH="$(rustc --print sysroot)/share/zsh/site-functions:${FPATH}"
fi
### bitbake
if [[ -f "$HOME/.config/zsh/bitbake/_bitbake" ]]; then
	FPATH="${HOME}/.config/zsh/bitbake:${FPATH}"
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
## completion設定読み込み系
### docker
if type docker &> /dev/null; then
	source <(docker completion zsh)
fi
### kubectl
if type kubectl &> /dev/null; then
	source <(kubectl completion zsh)
fi
### rust(rustup)
if type rustup &> /dev/null; then
	source <(rustup completions zsh)
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
