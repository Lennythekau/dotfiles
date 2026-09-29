# Setup

No setup script yet. Most things can just be symlinked as usual under `~/.config`, with the following exceptions:

- `systemd/user/ssh-agent.service` defines a `systemd` service that automatically runs `ssh-agent`. It should not be symlinked to `~/.config`. Instead:
  - Run `systemctl --user enable systemd/user/ssh-agent.service --now`
  - Symlink ssh-config as shown below.
- `ssh-config`: adds the keys to `ssh-agent` (see above). Symlink this as `~/.ssh/config`

- `systemd/system/ydotoold.service`: this is to enable the `ydotoold` daemon, which needs to run as root:
  - Symlink to `/etc/systemd/system/ydotoold.service` (you'll need to run this as root).
  - `sudo systemctl daemon-reload`: re-read service file
  - `sudo systemctl enable --now ydotoold`: enable the service
`
