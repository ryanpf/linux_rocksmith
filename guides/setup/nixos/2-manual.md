# JACK to ASIO with pipewire on NixOS

Manual

## Table of contents

1. [NixOS Configuration](/guides/setup/nixos/1.md#nixos-configuration)
1. [Choose your method](/guides/setup/nixos/1.md#choose-your-method)
1. [Method 1 - Manual](#table-of-contents) 🡰 You are here
	1. [Create a clean prefix](create-a-clean-prefix)
	1. [wineasio](#wineasio)
	1. [Installing RS_ASIO](#installing-rs_asio)
	1. [Reboot](#reboot-your-pc)
1. [Method 2 - script](/guides/setup/nixos/2-script.md)
1. [Set up JACK](/guides/setup/nixos/3.md)
1. [Starting the game](/guides/setup/nixos/3.md#starting-the-game)
1. [Known Issues](/guides/setup/nixos/3.md#known-issues)
1. [Troubleshooting](/guides/setup/nixos/3.md#a-bit-of-troubleshooting)

## Method 1: Manual

## Create a clean prefix

Set the Proton version you want to use. There's two ways to do this. In steam

* go to `Settings` 🡲 `Compatibility` 🡲 `Enable Steam play for all other titles`, then restart Steam.
* open your library, right click Rocksmith and go to`Properties` 🡲 `Compatibility` and force one.

Delete or rename `$STEAMLIBRARY/steamapps/compatdata/221680`, then start Rocksmith and stop the game once it's running.

The rest will be set up later.

## BEFORE PROCEDING FURTHER ENTER THE STEAM FHS ENVIRONMENT WITH `steam-run bash`

All commands below assume that you are in this environment, they won't work otherwise.

Please set the environment variables from [here](https://github.com/theNizo/linux_rocksmith/blob/main/README.md#common-paths) now.

## wineasio

To make Proton use wineasio, we need to copy these files into the appropriate locations.

```
# !!! WATCH OUT FOR VARIABLES !!!
cp "/lib/wine/i386-unix/wineasio32.dll.so" "$PROTON/lib/wine/i386-unix/wineasio32.dll.so"
cp "/lib/wine/x86_64-unix/wineasio64.dll.so" "$PROTON/lib/wine/x86_64-unix/wineasio64.dll.so"
```

In theory, this should also work with Lutris runners.

<details><summary> How to check if this worked correctly</summary>

> First check that `/lib/wine/i386-unix/wineasio32.dll.so` and `/lib/wine/x86_64-unix/wineasio64.dll.so` exist. The copy should give you an error if something went wrong.
</details>

Now add the dlls to Rocksmith's prefix

```sh
cp "/lib/wine/i386-windows/wineasio32.dll" "$WINEPREFIX/drive_c/windows/syswow64/wineasio32.dll"
cp "/lib/wine/x86_64-windows/wineasio64.dll" "$WINEPREFIX/drive_c/windows/system32/wineasio64.dll"
```

Finally register the dlls
It's important that we use the wine binary that come with proton.

```sh
cd "$PROTONPATH/bin"
./wine regsvr32 /lib/wine/i386-windows/wineasio32.dll
./wine64 regsvr32 /lib/wine/x86_64-windows/wineasio64.dll
```

<details><summary> How to check if this worked correctly</summary>

> After ever `regsvr32` command you should get an alert from wine stating that the dll was registered correctly.
</details>

## Installing RS_ASIO

1. [Download](https://github.com/mdias/rs_asio/releases) the newest release, unpack everything to the root of your Rocksmith installation (`$STEAMLIBRARY/steamapps/common/Rocksmith2014/`)
1. Edit RS_ASIO.ini: fill in `wineasio-rsasio` where it says `Driver=`. Do this for every Output and Input section.

## Reboot your PC
Simply reboot your PC.

[Continue here](/guides/nixos/3.md)
