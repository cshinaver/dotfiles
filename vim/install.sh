echo "Checking for Vundle..."
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    echo "Vundle not installed."
    echo "Installing Vundle..."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo "Vundle installed."
fi
