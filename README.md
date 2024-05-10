# flean - flutter clean

flean is simple utility script used to clean multiple flutter projects in given directory.

currently only tested on Mac OS. it is assumed that you are using zsh.
if you are using bash then edit the install.sh and replace the `zshrc` with `bashrc`

## Installation

Clone the repo in any place.

### first install the required dependencies.
- **fzf** - command-line fuzzy finder - https://github.com/junegunn/fzf
- **fd** - fast alternative to finder command - https://github.com/sharkdp/fd

```sh
brew install fzf fd
```

after installing the dependencies, run the `install.sh` script. by going into flean folder first.
```sh
cd flean
sudo ./install.sh
```

if you are unable to run the script you will need to change the file permission to allow execution. then run it again.

```sh
chmod +x install.sh
```

after that verify that is has been installed correctly by running.
```sh
flean
```

## Usage
run the flean command in the directory containing all your flutter projects.

Use Tab/S-Tab to select/deselect.

Use CTRL-A to toggle selection for all items.

Use CTRL-C to cancel the process if you wish to not continue.
