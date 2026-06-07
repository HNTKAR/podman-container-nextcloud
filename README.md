# podman-container-nextcloud

```bash
cd /PATH/TO/podman-container-nextcloud
rm -r $HOME/.config/containers/systemd/p-nextcloud*
./replace.sh
mkdir -p ~/.config/containers/systemd
cp tmp/p-* ~/.config/containers/systemd/
systemctl --user daemon-reload
systemctl --user restart pp-nextcloud
```
