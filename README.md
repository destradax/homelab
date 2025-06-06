# Setup server

add to `/etc/hosts` so you can `ssh odin@athena`:

```
192.168.1.2 athena
```

# Setup nvim

install from https://github.com/neovim/neovim/blob/master/INSTALL.md#linux

use `update-alternatives` to set as default editor:

```sh
sudo update-alternatives --install /usr/bin/editor editor /opt/nvim-linux-x86_64/bin/nvim 100
```

and then select the editor:

```sh
select-editor
```

install lazy.nvim: https://lazy.folke.io/installation

copy [nvim folder](./nvim/) to `~/.config/` 

# Install Docker

add user to docker group to avoid having to run some docker commands with `sudo`:


```sh
sudo usermod -aG docker $USER
```