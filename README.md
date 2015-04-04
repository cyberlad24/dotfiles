# Dotfiles

Dotfiles for OS X and Linux 

## Install

```sh
git clone https://github.com/fer/dotfiles ~/.dotfiles
cd ~/.dotfiles
make install
```

Linux:
 
```sh
make clean install post-install install-wiki

```

OS X:

```sh
make clean pre-osx install post-install install-wiki
```

## Uninstall

 
```sh
make clean 
```
