# Setup

No setup script yet. Most things can just be symlinked as usual under `~/.config`, with the following exceptions:

- `helix` shouldn't be symlinked as a directory, instead you should symlink each file individually. That's because when running `helix --grammar fetch`, Helix creates a `helix/runtime/grammars` with a lot of stuff. After finishing symlinking, run `helix --grammar fetch` and `helix --grammar build`. This is needed because there's an issue with the Tree-sitter grammar for Haskell that comes with Helix.
- `systemd/user/ssh-agent.service` defines a `systemd` service that automatically runs `ssh-agent`. It should not be symlinked to `~/.config`. Instead:
  - Run `systemctl --user enable systemd/user/ssh-agent.service --now`
  - Symlink ssh-config as shown below.
- `ssh-config`: adds the keys to `ssh-agent` (see above). Symlink this as `~/.ssh/config`

- `systemd/system/ydotoold.service`: this is to enable the `ydotoold` daemon, which needs to run as root:
  - Symlink to `/etc/systemd/system/ydotoold.service` (you'll need to run this as root).
  - `sudo systemctl daemon-reload`: re-read service file
  - `sudo systemctl enable --now ydotoold`: enable the service
`
