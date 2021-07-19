# Neovim dotfiles

My colleagues keep asking for my dotfiles. Therefore, I thought I would make it public one day :D (although this repo may not be up-to-date since I don't manage nvim configs with this repo)

Branches:
- Master: init.lua with a lot of new plugins made for nvim 0.5+ only
  - In this branch, one can find all the lua config for my nvim and the plugins that I use. Notably, I organise plugin settings in a modular manner to help maintain them better over time.
- Snapshot: Good old nvim with vim-compatible configurations
  - In this branch, one can find good ways to split `init.vim` into multiple files and load `lua` configs into nvim with minimum hassle.

I hope you are inspired or have learned something new during the exploration of this repo :).

Master:

- Colorscheme: [Tokyonigh](https://github.com/folke/tokyonight.nvim)
- Font: [Operator Mono](https://www.typography.com/fonts/operator/styles) patched with [NerdFont](https://www.nerdfonts.com/)


Got questions ? Please open an issue

![image](https://user-images.githubusercontent.com/15828926/126064955-8e1ad654-c436-4eb5-a01b-c6c2cdd82e83.png)
![image](https://user-images.githubusercontent.com/15828926/126064972-3dc2bf3f-4f13-47da-82c7-3ed9077dbdbe.png)
![image](https://user-images.githubusercontent.com/15828926/126111701-a666524a-5813-49c3-b26c-8e2545774445.png)


Snapshot:

- Colorscheme: [Onedark](https://github.com/joshdick/onedark.vim)

![image](https://user-images.githubusercontent.com/15828926/126114843-1c5b88a5-7986-4cbc-950c-6d84eb1da592.png)


## Q & A

> solargraph server config

```yaml
---
include:
- "**/*.rb"
exclude:
- spec/**/*
- test/**/*
- vendor/**/*
- ".bundle/**/*"
- .git/**/*
- .logs/**/*
require: []
domains: []
reporters:
- rubocop
require_paths: []
max_files: 10000
```
