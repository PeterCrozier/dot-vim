Managing vim setup
==================

Installing MacVim
-----------------

* Get it as a .dmg from [here](http://macvim-dev.github.io/macvim/)

* Install `mvim` and `gvimdiff` into `/usr/local/bin`


Installing .vim
---------------

* `git clone` the `.vim` directory from my repo

		git clone https://github.com:PeterCrozier/dot-vim.git ~/.vim

* Symbolically link the rc files back into your home directory

		cd ~
		ln -s .vim/.vimrc .vimrc
		ln -s .vim/.gvimrc .gvimrc

* Update the pathogen managed bundles

		cd ~/.vim
		git submodule init
		git submodule update

* Build the help paths with `:Helptags`

Managing bundles
----------------

* To add a new bundle in a working repo, say vim-fugitive

		cd ~/.vim
		git submodule init
		git submodule add git://github.com/tpope/vim-fugitive.git bundle/vim-fugitive
		git commit -m 'Added vim-fugitive'
		git push


* To remove a submodule from the directory use

		git submodule deinit --force bundle/vim-fugitive
