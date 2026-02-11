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

`apt-get install stow`

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
