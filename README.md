# vim-chores

This is a simple vim (neovim) plug-in to quickly run tedious tasks. You define a dictionary of commands to run, and this plugin lets you choose between them, quickly and easily.

It ties really well with [vim-modularvimrc](https://github.com/ArtBIT/vim-modularvimrc), because you can define tasks per project (per-directory really).

## Installation

The easiest way to install the plugin is to install it as a bundle.
For example:

### Using [Pathogen](https://github.com/tpope/vim-pathogen):
```
cd ~/.vim/bundle
git clone git://github.com/ArtBIT/vim-chores.git
```

### Using [VimPlug](https://github.com/junegunn/vim-plug):

```
Plug 'ArtBIT/vim-chores'

```

### Or manually
```
cd /tmp && git clone git://github.com/ArtBIT/vim-chores.git
cp -r vim-chores/* ~/.vim/
```

## Config

```
let g:VimChores = {'About': 'echo "This is a simple vim (neovim) plug-in to quickly run tedious tasks."'}
" If you wish to use a different name for the chores dict global variable, just define the name in the following variable:
g:chores_dict_name = 'CommonTasks'
...
let g:CommonTasks = extend(g:CommonTasks, {'Run Tests': 'npm test'})
```

# LICENSE
[MIT](LICENSE.md)

