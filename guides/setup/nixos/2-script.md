Simply [download the script](/scripts/patch-nixos.sh) and execute it.

```sh
chmod +x patch-nixos.sh
steam-run ./patch-nixos.sh
```
First it will ask you if you want to override its default values, you can press enter to accept the default.

- Proton Version: the proton version you have installed. By default it assumes `Proton - Experimental`. You can select another version by writing the corresponding number and pressing enter.

- RS_ASIO: The RS_ASIO you want to install. Currently it downloads the version `0.7.1`.

Reboot your PC after the script finishes.

[Continue here](/guides/nixos/3.md)
