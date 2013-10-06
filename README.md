dotfiles.git
============
Clone and run this on Ubuntu 12.04.2 LTS to
configure your `bash` and `vim` development environment as follows:

```sh
cd $HOME
git clone https://github.com/SinghAsDev/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
mv .vim .vim~
ln -s dotfiles/.vim .
ln -s dotfiles/.tmux.conf .
