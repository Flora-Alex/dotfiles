# ============================================
# Flora's Zsh Configuration
# ============================================

# Oh My Zsh 路径
export ZSH="$HOME/.oh-my-zsh"

# 主题：使用 starship（在文件末尾初始化）
# 这里设置为空，避免与 starship 冲突
ZSH_THEME=""

# 更新行为
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 13

# 插件配置
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-z
)

source $ZSH/oh-my-zsh.sh

# ============================================
# 环境变量
# ============================================

# 语言环境
export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8

# 编辑器
export EDITOR='vim'
export VISUAL='vim'

# PATH 配置
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# MySQL（如果使用 Homebrew 安装的 MySQL）
# export PATH="/opt/homebrew/opt/mysql/bin:$PATH"

# Node.js Corepack
export COREPACK_ENABLE_AUTO_PIN=0

# ============================================
# 开发工具配置
# ============================================

# Java（通过 Homebrew 管理）
# 如需切换版本，使用：brew install openjdk@17
# export JAVA_HOME=$(/usr/libexec/java_home)
# export PATH="$JAVA_HOME/bin:$PATH"

# Maven
export M2_HOME="/opt/homebrew/opt/maven"
export PATH="$M2_HOME/bin:$PATH"

# Go（如果安装）
# export GOPATH="$HOME/go"
# export PATH="$GOPATH/bin:$PATH"

# ============================================
# 别名配置
# ============================================

# 安全起见，用 trash 替代 rm
alias rm="trash"

# 常用目录快捷跳转
alias projects="cd ~/projects"
alias i="cd ~/projects/i"
alias r="cd ~/projects/r"
alias dl="cd ~/Downloads"
alias doc="cd ~/Documents"

# 开发相关
alias ll="ls -la"
alias la="ls -A"
alias l="ls -CF"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Git 快捷别名（详见 .gitconfig）
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"
alias gd="git diff"
alias glog="git log --oneline --graph --decorate"

# Maven 快捷命令
alias mvn-clean="mvn clean"
alias mvn-build="mvn clean package -DskipTests"
alias mvn-test="mvn test"
alias mvn-run="mvn spring-boot:run"

# npm 快捷命令
alias ni="npm install"
alias nid="npm install --save-dev"
alias nr="npm run"
alias ns="npm start"
alias nt="npm test"

# Docker 快捷命令
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dc="docker compose"
alias dcup="docker compose up -d"
alias dcdown="docker compose down"
alias dclogs="docker compose logs -f"

# ============================================
# 函数定义
# ============================================

# 快速创建并进入目录
function mkcd() {
  mkdir -p "$1" && cd "$1"
}

# 快速查找文件
function ff() {
  find . -name "*$1*" -type f
}

# 快速查找目录
function fd() {
  find . -name "*$1*" -type d
}

# 查看端口占用
function port() {
  lsof -i :"$1"
}

# 快速启动 HTTP 服务器
function serve() {
  local port="${1:-8000}"
  python3 -m http.server "$port"
}

# Git 快速提交
function gac() {
  git add -A && git commit -m "$1"
}

# Git 快速推送
function gacp() {
  git add -A && git commit -m "$1" && git push
}

# ============================================
# 工具初始化
# ============================================

# Starship 提示符（现代化、快速、可定制）
eval "$(starship init zsh)"

# nvm（Node 版本管理，如果安装）
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# pyenv（Python 版本管理，如果安装）
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# ============================================
# 本地配置（可选）
# ============================================

# 如果有本地特定配置，可以放在 ~/.zshrc.local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
