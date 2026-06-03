# Flora's Dotfiles

我的 macOS 个人开发环境配置文件集合。涵盖 Zsh、Git、Vim、Starship 等工具的配置。

## 文件一览

| 文件 | 用途 | 说明 |
|------|------|------|
| `.zshrc` | Zsh Shell | Oh My Zsh + Starship，别名、函数、PATH 配置 |
| `.gitconfig` | Git | 用户身份、别名、delta 分页器、颜色配置 |
| `.gitignore_global` | Git | 全局忽略规则（macOS、IDE、多语言构建产物） |
| `.vimrc` | Vim | Leader 键、行号、按键映射 |
| `.ideavimrc` | IdeaVim | JetBrains IDE 中的 Vim 键位和插件 |
| `starship.toml` | Starship | 跨 Shell 提示符：目录、Git、语言版本检测 |
| `config.ghostty` | Ghostty 终端 | 主题、字体、快捷键、分屏、Quick Terminal |
| `.npmrc` | npm | 国内镜像源配置 |
| `.bash_profile` | Bash | MySQL PATH（仅一行） |

## 快速设置

### 1. 安装依赖

```bash
# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Oh My Zsh 插件
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

# Starship 提示符
brew install starship
```

可选工具：

```bash
brew install git-delta   # 更好的 git diff 显示
brew install trash       # 安全删除（替代 rm）
```

### 2. 部署配置

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
cp starship.toml ~/.config/starship.toml
cp config.ghostty ~/.config/ghostty/config.ghostty
```

### 3. 生效

```bash
source ~/.zshrc
```

## Zsh 配置

### 插件

| 插件 | 功能 |
|------|------|
| `git` | Git 命令补全和别名 |
| `zsh-autosuggestions` | 基于历史记录的命令建议 |
| `zsh-syntax-highlighting` | 命令语法实时高亮 |
| `zsh-z` | 智能目录跳转（按频率） |

### 目录导航

| 命令 | 作用 |
|------|------|
| `projects` | `~/projects` |
| `i` | `~/projects/i`（个人项目） |
| `r` | `~/projects/r`（复现/学习项目） |
| `dl` | `~/Downloads` |
| `doc` | `~/Documents` |
| `mkcd <dir>` | 创建并进入目录 |

### Git 快捷命令

| 命令 | 等价操作 |
|------|----------|
| `gs` | `git status` |
| `ga` | `git add` |
| `gc` | `git commit` |
| `gp` | `git push` |
| `gl` | `git pull` |
| `gd` | `git diff` |
| `glog` | `git log --oneline --graph --decorate` |
| `gac "msg"` | `git add -A && git commit -m "msg"` |
| `gacp "msg"` | `git add -A && git commit -m "msg" && git push` |

### Maven / npm / Docker

| 命令 | 等价操作 |
|------|----------|
| `mvn-build` | `mvn clean package -DskipTests` |
| `mvn-run` | `mvn spring-boot:run` |
| `ni` | `npm install` |
| `nr` | `npm run` |
| `dcup` | `docker compose up -d` |
| `dcdown` | `docker compose down` |
| `dclogs` | `docker compose logs -f` |

### 实用函数

| 命令 | 功能 |
|------|------|
| `ff <name>` | 在当前目录下查找文件 |
| `fd <name>` | 在当前目录下查找目录 |
| `port <number>` | 查看端口占用 |
| `serve [port]` | 启动 Python HTTP 服务器（默认 8000） |

### 其他约定

- `rm` 被替换为 `trash`，防止误删（需 `brew install trash`）
- 本地特定配置可放在 `~/.zshrc.local`，会自动加载

## Git 配置

### 核心设置

- 默认分支：`main`
- Pull 策略：rebase（非 merge）
- 冲突样式：diff3
- 自动设置远程追踪分支
- 启用 rerere（记住冲突解决方式）

### Git 别名速查

| 别名 | 作用 |
|------|------|
| `git st` | 简洁状态（`-sb`） |
| `git lg` | 图形化日志（全分支） |
| `git co <branch>` | 切换分支 |
| `git cob <branch>` | 创建并切换分支 |
| `git cm "msg"` | 提交 |
| `git cma` | 修改上次提交 |
| `git aa` | 添加所有文件 |
| `git unstage` | 取消暂存 |
| `git psf` | 安全强制推送（`--force-with-lease`） |
| `git stash-all "msg"` | 暂存所有文件（含未追踪） |
| `git clean-all` | 清理未追踪文件（`-fd`） |

### Delta（可选）

安装 `git-delta` 后，在 `.gitconfig` 中取消注释 `pager = delta` 即可启用 side-by-side diff 显示和行号。

## Starship 提示符

提示符显示内容：

```
用户名 目录名  git分支 git状态 ➜
```

自动检测项目语言并显示版本：

| 语言 | 触发条件 |
|------|----------|
| Node.js | 存在 `package.json`、`.node-version` 或 `.js/.ts` 文件 |
| Java | 存在 `pom.xml`、`build.gradle` 或 `.java/.kt` 文件 |
| Python | 存在 `requirements.txt`、`pyproject.toml` 或 `.py` 文件 |
| Go | 存在 `go.mod`、`go.sum` 或 `.go` 文件 |
| C/C++ | 存在 `.c/.cpp` 文件 |
| Docker | 存在 `Dockerfile` 或 `docker-compose.yml` |

## Ghostty 终端配置

基于 Kanagawa 配色方案的终端配置。

### 外观

| 项目 | 设置 |
|------|------|
| 字体 | Liga Comic Mono, 14pt |
| 背景色 | `#060e24`（深蓝黑） |
| 前景色 | `#dcd7ba`（暖白） |
| 光标 | 方块样式，80% 透明度，闪烁 |
| 单元格高度 | +4px 行距 |

### 窗口行为

- 窗口状态持久化（`window-save-state = always`）
- 非聚焦分屏透明度 40%
- 背景透明和毛玻璃效果已预留（默认注释）

### 快捷键

**标签页：**

| 按键 | 功能 |
|------|------|
| `Cmd+T` | 新建标签页 |
| `Cmd+Shift+←/→` | 切换标签页 |
| `Cmd+W` | 关闭当前面板 |

**分屏：**

| 按键 | 功能 |
|------|------|
| `Cmd+D` | 右侧分屏 |
| `Cmd+Shift+D` | 下方分屏 |
| `Cmd+Alt+方向键` | 跳转到对应分屏 |
| `Cmd+Shift+E` | 均分分屏 |
| `Cmd+Shift+F` | 最大化/还原分屏 |

**其他：**

| 按键 | 功能 |
|------|------|
| `Option+Space` | 全局唤起 Quick Terminal（下拉式） |
| `Cmd+Shift+,` | 重载配置 |
| `Cmd+Plus/Minus/Zero` | 调整/重置字号 |

### Quick Terminal

类 Quake 的下拉终端，按 `Option+Space` 从屏幕顶部呼出，自动隐藏，动画 0.15s。

### 安全特性

- 剪贴板粘贴保护（防误粘）
- 括号粘贴安全模式

## IdeaVim 配置

JetBrains IDE 中的 Vim 键位映射：

| 按键 | 功能 |
|------|------|
| `H` / `L` | 行首 / 行尾 |
| `J` / `K` | 向下 / 向上翻半页 |
| `<Space>b` | 跳转到声明 |
| `<Space>r` | 重命名 |
| `<Space>d` | 启动调试 |
| `<Space>k` | 快速 JavaDoc |
| `<Space>w` | 保存文件 |
| `<Space>q` | 关闭编辑器 |
| `f` | Ace Jump（快速跳转） |
| `]e` / `[e` | 跳转到下一个/上一个错误 |

启用的 IdeaVim 插件：`vim-highlightedyank`（高亮复制文本）、`vim-commentary`（快速注释）。

## npm 配置

- 镜像源：`registry.npmmirror.com`（国内加速）
- 关闭 SSL 验证（适配镜像源）

## License

MIT
