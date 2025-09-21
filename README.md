# NeoVim 

NeoVim is an extension of the popular code editor __Vim__, built in Lua and representing a light and faster approach to code development. Moreover, NeoVim is an high customizable alternative to modern code editor like VsCode, and IDE like those made by JetBrains. 

This repository is a minimal configuration of NeoVim, without LSP, code suggestions or any debugger. I think that learning to code without any suggestion, is a great idea to boost you learning path in any language or framework. This Neovim configuration is composed by the following plugins:

* __Neo Tree__ to manage and navigate through the file system. The description of the plugin can be found ![here](https://github.com/nvim-neo-tree/neo-tree.nvim?tab=readme-ov-file), by the way, the default configuration shows the navigation tree on the left.

* __Tree Sitter__ is a syntax parser adapted as a Neo Vim plugin. There are no default parser installed, however, using the `auto_install` option, a new parser is installed as soon as a new file's language is detected. 

* Finding files or any occurrence of any phrase can be done using __Telescope__, a powerful finder integrated in this.

* __Lualine__ makes the Vim default status bar prettier, adding information about the current file and colors.

* The only plugin that simplify coding is __Autopair__, used to automatically close any open bracked, avoiding pairing mistakes.

* Finally, __Gitfugitive__ is used to show git information about the current file. Honestly, I rarely use this plugin, since I use NeoVim with Lazygit.

To use this configuration you can clone the following repository in you Neo Vim configuration's directory ( by default this should be ~/.config/nvim, if you are using MacOs or Linux). I'm sorry for Window user ...
