# JACK to ASIO with pipewire on NixOS

Script

## Table of contents

1. [NixOS Configuration](/guides/setup/nixos/1.md#nixos-configuration)
1. [Choose your method](/guides/setup/nixos/1.md#choose-your-method)
1. [Method 1 - Manual](/guides/setup/nixos/2-manual.md)
	1. [Create a clean prefix](/guides/setup/nixos/2-manual.md#create-a-clean-prefix)
	1. [wineasio](/guides/setup/nixos/2-manual.md#wineasio)
	1. [Installing RS_ASIO](/guides/setup/nixos/2-manual.md#installing-rs_asio)
	1. [Reboot](/guides/setup/nixos/2-manual.md#reboot-your-pc)
1. [Method 2 - script](#table-of-contents) 🡰 You are here
1. [Set up JACK](/guides/setup/nixos/3.md#set-up-jack)
1. [Starting the game](/guides/setup/nixos/3.md#starting-the-game)
1. [Known Issues](/guides/setup/nixos/3.md#known-issues)
1. [Troubleshooting](/guides/setup/nixos/3.md#a-bit-of-troubleshooting)

## Method 2: Script

Simply [download the script](/scripts/patch-nixos.sh) and execute it.

```sh
chmod +x patch-nixos.sh
steam-run ./patch-nixos.sh
```
First it will ask you if you want to override its default values, you can press enter to accept the default.

- Proton Version: the proton version you have installed. By default it assumes `Proton - Experimental`. You can select another version by writing the corresponding number and pressing enter.

- RS_ASIO: The RS_ASIO you want to install. Currently it downloads the version `0.7.4`.

Reboot your PC after the script finishes.

[Continue here](/guides/setup/nixos/3.md)
