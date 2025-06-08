# Clone

```shell
git clone https://github.com/JiuYu77/vim-conf.git


git clone -b vim https://github.com/JiuYu77/vim-conf.git path/vim


git clone -b neovim-lua https://github.com/JiuYu77/vim-conf.git path/neovim-lua
```

```shell
git clone git@github.com:JiuYu77/vim-conf.git

git checkout vim  # git switch vim
```

## Installation

### vim

```shell
git clone -b vim https://github.com/JiuYu77/vim-conf.git ~/vim
mv ~/vim/.vimrc ~/vim/.vim ~/
rm -rf ~/vim
```

### neovim

```bash
git clone -b neovim-lua https://github.com/JiuYu77/vim-conf.git ~/.config/nvim/
```

## Software 软件

### vim9 需要 ncurses

apt search ncurses 查询有哪些可以安装的 ncurses 版本，如 libncurses5-dev：

```shell
sudo apt-get install libncurses5-dev
```

### clangd

语法检查。

[clangd GitHub](https://github.com/clangd/clangd)

### node

node 即 node.js。

[Node.js官网](https://nodejs.org/)

### ctags

源码追踪。Universal Ctags

安装`universal-ctags`

```shell
sudo apt install universal-ctags
```

`exuberant-ctags` 停止更新十多年了。

**注意**：最新版 universal ctags 调用时需要加一个 --output-format=e-ctags，输出格式才和老的
 exuberant ctags 兼容否则会有 windows 下路径名等小问题。

### silversearcher-ag

搜索。

[the_silver_searcher Github](https://github.com/ggreer/the_silver_searcher)

[silversearcher-ag 镜像仓库](https://mirrors.cqupt.edu.cn/deepin/pool/main/s/silversearcher-ag/)

```shell
sudo apt install silversearcher-ag
```

### Nerd Fonts

主要用于解决图标乱码。

[Nerd Fonts 官网](https://www.nerdfonts.com/)

## vim extensions 插件

`科学上网`，才可以更顺利的安装各种`插件`。

`settings/vim-plugin.vim` 中放置了要安装的插件，部分插件`注释`掉了，可以根据需要**取消**注释 或 增加其他插件。

`settings/map.vim` 中是部分**按键**映射。

### coc.nvim

`coc.nvim` 自动补全 等功能，不只是智能（自动）补全。

`~/.vim/coc-settings.json` 是 coc.nvim 配置文件，可以通过 `:CocConfig` 打开，也可以用其他方式打开，这个文件也可以自己`手动创建`。

若 `Nodejs`(node) 版本过低，则无法使用 coc.nvim，需要安装新版本 nodejs。

#### coc-clangd

`coc-clangd` 插件 依赖 `clangd`，需要安装。

该插件通常需要较新版本的 `clangd`，**方法1**、**方法3** 可安装满足coc-clangd要求的版本，**方法2** apt使用的软件源 不一定更新及时更新软件版本(即clangd版本可能过低)。

shell中执行 `vim` 命令，`coc.nvim` 会提示需要的 `clangd` 版本，如

```plaintext
[coc.nvim] clangd was not found on your PATH. :CocCommand clangd.install will install 19.1.2.
```

1. 方法1 需要科学上网

- 添加代理，编辑 `coc-settings.json` 配置文件

```shell
{
  "http.proxy": "http://127.0.0.1:8889",
  "http.proxyStrictSSL": false
}
```

- 在vim中执行以下 coc-nvim 命令

```shell
:CocCommand clangd.install
```

该方法 可安装满足 `coc-clangd`要求版本的`clangd`，但 需要科学上网，且挂了梯子，速度也不一定好。

2. 方法2
- `apt` 安装
```shell
sudo apt install clangd-19
```
- 配置 clangd 路径：安装完成发现，`PATH`变量中存在的 `clang-19` 是 可执行文件`clangd` 的软链接，而 `coc-clangd` 识别的是`clangd`可执行文件
  - 方式1 在 `coc-settings.json`中配置
  ```shell
  {
      "clangd.path":"/lib/llvm-19/bin/clangd"
  }
  ```
  - 方式2 配置环境变量 `~/.bashrc`
  ```shell
  export PATH=$PATH:/lib/llvm-19/bin/
  ```
  - 方式3 设置软链接
  ```shell
  sudo ln -s /lib/llvm-19/bin/clangd /usr/bin/clangd
  ```

3. 方法3

- Github下载压缩包<br/>
[clangd 官网  有 GitHub地址](https://clangd.llvm.org/installation)
- 解压
- 配置 clangd 路径
  - 方法1：在 `coc-settings.json`中配置

  ```shell
  {
      "clangd.path":"~/.config/coc/extensions/coc-clangd-data/download/clangd_15.0.3/bin/clangd"
  }
  ```

  - 方法2 将 `bin`目录 添加到 `PATH` 环境变量

  ```shell
  export Clangd_PATH=/home/nk/install/clangd_16.0.2/bin
  export PATH=$PATH:$Clangd_PATH
  ```

#### coc-snippets

要求 `vim` 拥有 `Python` 支持？

### ale

`ale` 是语法检查插件。

[ale GitHub](https://github.com/dense-analysis/ale)

**示例**：

使用 clang 等，对 C 和 C++ 进行语法检查；使用 pylint 等，对 Python 进行语法检查

```shell
let g:ale_linters = {
\   'c': ['gcc', 'clangd', 'clang'],
\   "c++": ['gcc', 'clangd', 'clang'],
\   'python': ['pylint', 'flake8', 'mypy'],
\}
```

针对一种语言，安装了一个 可以`检查语法`的软件就已经可以，不一定要全部安装，以下是安装方式。

安装 `clang`

```shell
sudo apt install clang-17  # 17是版本
```

安装 `clangd`

```shell
sudo apt install clangd-19
```

安装 `pylint`：

```shell
# 方法1
sudo apt install pylint

# 方法2：pip 安装 pylint，如果使用 python 虚拟环境
pip install pylint
```

安装 `flake8`

```shell
# 方法1
sudo apt install flake8

# 方法2
pip install flake8
```

安装 `mypy`

```shell
# 方法1
sudo apt install mypy

# 方法2
pip install mypy
```

## LeaderF

[`LeaderF`](https://github.com/Yggdroot/LeaderF) 是一个高效的模糊查找器，要求 vim 支持 python 插件。

查看 vim 是否支持 python

```shell
vim --version | grep python
```

`vim` 安装 python 支持

```shell
sudo apt install vim-python-jedi
```

