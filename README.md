<img width="1440" alt="Screenshot 2024-03-22 at 11 13 50 AM" src="https://github.com/LOTaher/dotfiles/assets/86690869/9a5c6dca-80be-4644-a694-cd6bcf6cbe26">

## Requirements

Ensure you have the following installed on your system

### **Git**

**MacOS**

`brew install git`

**Debian**

`apt install git`

### **Stow**

**MacOS**

`brew install stow`

**Debian**

`apt install stow`

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com/LOTaher/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```
