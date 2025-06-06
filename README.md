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

# Installation
## vim
```shell
git clone -b vim https://github.com/JiuYu77/vim-conf.git ~/vim
mv ~/vim/.vimrc ~/vim/.vim ~/
rm -rf ~/vim
```

## neovim
```bash
git clone -b neovim-lua https://github.com/JiuYu77/vim-conf.git ~/.config/nvim/
```

# vim Attention

## vim9 需要 ncurses
apt search ncurses 查询有哪些可以安装的 ncurses 版本，如 libncurses5-dev：
```shell
sudo apt-get install libncurses5-dev
```

## clangd
语法检查。

[clangd GitHub](https://github.com/clangd/clangd)

## node
node 即 node.js。

[Node.js官网](https://nodejs.org/)

## ctags
源码追踪。Universal Ctags

安装`universal-ctags`
```shell
sudo apt install universal-ctags
```
`exuberant-ctags` 停止更新十多年了。

**注意**：最新版 universal ctags 调用时需要加一个 --output-format=e-ctags，输出格式才和老的 exuberant ctags 兼容否则会有 windows 下路径名等小问题

## silversearcher-ag
搜索。

[the_silver_searcher Github](https://github.com/ggreer/the_silver_searcher)

[silversearcher-ag 镜像仓库](https://mirrors.cqupt.edu.cn/deepin/pool/main/s/silversearcher-ag/)

```shell
sudo apt install silversearcher-ag
```

## Nerd Fonts
主要用于解决图标乱码。

[Nerd Fonts 官网](https://www.nerdfonts.com/)

