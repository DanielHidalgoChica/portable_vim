# portable_vim

Portable and customized version of Vim (Vi Improved 9.1 Normal version without GUI) for Linux, tested on all operating systems of the ETSIIT UGR lab computers except Ubuntu 18.
Specifically, it works on Kubuntu and Ubuntu 20.04, 22.04, and 24.04.

It modifies the `$HOME` directory. Assumes the use of **Bash**.

### Usage
1. Clone the repository files (or use your own `.vimrc`) and run the script `ugr_vim_setup_lite.sh` with one argument: the name of the USB (or directory) where the `.vimrc` and `vim.tgz` are stored.
2. Execute `source .bashrc`.

**Important:** The **Ctrl** and **Caps-Lock** keys are swapped. If you do not want this effect, comment out the last part of the script.
