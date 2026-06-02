# Flora's Dotfiles

这是我的个人开发环境配置文件集合。

## 📁 文件说明

- `.zshrc` - Zsh shell 配置（Oh My Zsh + Starship）
- `.gitconfig` - Git 配置和别名
- `.gitignore_global` - Git 全局忽略规则
- `.vimrc` - Vim 编辑器配置
- `.ideavimrc` - IntelliJ IDEA 的 IdeaVim 插件配置

## 🚀 快速设置

### 1. 安装必要的工具

```bash
# Homebrew（如果未安装）
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Oh My Zsh 插件
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

# Starship 提示符
brew install starship

# 可选：安装 delta（更好的 git diff 显示）
brew install git-delta

# 可选：安装 trash（安全删除）
brew install trash
```

### 2. 复制配置文件

```bash
# 备份原有配置
mv ~/.zshrc ~/.zshrc.backup
mv ~/.gitconfig ~/.gitconfig.backup
mv ~/.gitignore_global ~/.gitignore_global.backup

# 复制新配置
cp .zshrc ~/.zshrc
cp .gitconfig ~/.gitconfig
cp .gitignore_global ~/.gitignore_global
cp .vimrc ~/.vimrc
cp .ideavimrc ~/.ideavimrc
```

### 3. 重新加载配置

```bash
source ~/.zshrc
```

## 🛠️ Zsh 别名速查

### 目录导航
- `projects` - 进入 ~/projects
- `i` - 进入 ~/projects/i（个人项目）
- `r` - 进入 ~/projects/r（复现/学习项目）
- `dl` - 进入 ~/Downloads
- `doc` - 进入 ~/Documents
- `mkcd <dir>` - 创建并进入目录

### Git 快捷命令
- `gs` - git status
- `ga` - git add
- `gc` - git commit
- `gp` - git push
- `gl` - git pull
- `gd` - git diff
- `glog` - 图形化日志
- `gac "message"` - 添加所有并提交
- `gacp "message"` - 添加、提交并推送

### Maven 快捷命令
- `mvn-clean` - mvn clean
- `mvn-build` - mvn clean package -DskipTests
- `mvn-test` - mvn test
- `mvn-run` - mvn spring-boot:run

### npm 快捷命令
- `ni` - npm install
- `nid` - npm install --save-dev
- `nr` - npm run
- `ns` - npm start
- `nt` - npm test

### Docker 快捷命令
- `dps` - docker ps
- `dpsa` - docker ps -a
- `dc` - docker compose
- `dcup` - docker compose up -d
- `dcdown` - docker compose down
- `dclogs` - docker compose logs -f

### 其他实用命令
- `ff <name>` - 查找文件
- `fd <name>` - 查找目录
- `port <number>` - 查看端口占用
- `serve [port]` - 启动 HTTP 服务器

## 🔧 Git 别名速查

- `git st` - 简洁状态
- `git lg` - 图形化日志
- `git co <branch>` - 切换分支
- `git cob <branch>` - 创建并切换分支
- `git cm "message"` - 提交
- `git cma` - 修改上次提交
- `git a` - 添加文件
- `git aa` - 添加所有文件
- `git unstage` - 取消暂存
- `git f` - 获取远程更新
- `git ps` - 推送
- `git psf` - 强制推送（安全方式）

## ⚙️ 配置说明

### Starship 提示符

Starship 显示以下信息：
- 当前目录（截断显示）
- Git 分支和状态
- Node.js 版本（在 JS 项目中）
- Java 版本（在 Java 项目中）
- Python 版本（在 Python 项目中）
- Docker 上下文（在 Docker 项目中）

### Zsh 插件

- `git` - Git 命令补全和别名
- `zsh-autosuggestions` - 命令历史建议
- `zsh-syntax-highlighting` - 命令语法高亮
- `zsh-z` - 智能目录跳转

## 📝 更新日志

- 2026-06-02: 优化配置，解决主题冲突，添加 Starship 支持
