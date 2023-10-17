set -x;

rm -rf ~/.oh-my-zsh.bak
mv ~/.oh-my-zsh ~/.oh-my-zsh.bak
sudo apt install zsh
# this command will run in sub shell, close it to continue the run
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp .vimrc ~/
cp .zshrc ~/
cp .tmux.conf ~/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
mkdir ~/.vim/undo

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
