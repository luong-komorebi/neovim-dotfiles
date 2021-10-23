**Warning: I have recently moved to LunarVim(https://github.com/LunarVim/LunarVim) so this project is no longer actively maintained.**

# Neovim dotfiles

My colleagues keep asking for my dotfiles. Therefore, I thought I would make it public one day :D (although this repo may not be up-to-date since I don't manage nvim configs with this repo)

Branches:
- Master: init.lua with a lot of new plugins made for nvim 0.5+ only
  - In this branch, one can find all the lua config for my nvim and the plugins that I use. Notably, I organise plugin settings in a modular manner to help maintain them better over time.
- Snapshot: Good old nvim with vim-compatible configurations
  - In this branch, one can find good ways to split `init.vim` into multiple files and load `lua` configs into nvim with minimum hassle.

I hope you are inspired or have learned something new during the exploration of this repo :).

Master:

- Colorscheme: [Tokyonight](https://github.com/folke/tokyonight.nvim)
- Font: [Operator Mono](https://www.typography.com/fonts/operator/styles) patched with [NerdFont](https://www.nerdfonts.com/)


Got questions ? Please open an issue

<img width="1392" alt="Screen Shot 2021-09-09 at 17 13 53" src="https://user-images.githubusercontent.com/15828926/132668281-ce0e9256-d060-4eda-bd35-adc94c2c024f.png">
<img width="1392" alt="Screen Shot 2021-09-09 at 17 14 19" src="https://user-images.githubusercontent.com/15828926/132668298-8e000e8d-cd61-4679-85f5-35b9b7716d40.png">
<img width="1392" alt="Screen Shot 2021-09-09 at 17 14 26" src="https://user-images.githubusercontent.com/15828926/132668304-6c89d303-69df-4b29-a577-20856026f226.png">
<img width="1392" alt="Screen Shot 2021-09-09 at 17 14 58" src="https://user-images.githubusercontent.com/15828926/132668315-9176c044-975d-4bda-83c7-48f68c656703.png">
<img width="1392" alt="Screen Shot 2021-09-09 at 17 15 04" src="https://user-images.githubusercontent.com/15828926/132668318-c2d3bc4d-6270-49f7-9265-213f78633e7e.png">
<img width="1392" alt="Screen Shot 2021-09-09 at 17 15 10" src="https://user-images.githubusercontent.com/15828926/132668323-13481c20-6c5a-4eea-9a64-040e61249a49.png">
<img width="1392" alt="Screen Shot 2021-09-09 at 17 15 32" src="https://user-images.githubusercontent.com/15828926/132668327-950ec0c7-06ab-42e7-8cbf-544da00da16b.png">
<img width="1392" alt="Screen Shot 2021-09-09 at 17 15 55" src="https://user-images.githubusercontent.com/15828926/132668332-ac955560-9bf3-43e2-8260-4a656d0c2a02.png">
<img width="1392" alt="Screen Shot 2021-09-09 at 17 16 02" src="https://user-images.githubusercontent.com/15828926/132668335-085b77a3-65cf-4497-862e-fdfa84591724.png">

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
