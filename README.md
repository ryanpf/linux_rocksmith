# Rocksmith 2014 on Linux

These are a few Guides to get [Rocksmith 2014](https://store.steampowered.com/app/221680/Rocksmith_2014_Edition__Remastered/) running on Linux. In case you haven't tried gaming on Linux yet, other than not working, it won't get harder than this by far for other games.

## Disclaimer

This is the bare minimum to get it to work. I don't know if certain changes recommended by other people have a performance impact.

I tested it on Manjaro, Arch and a Linux Mint VM. Due to the VM factor, I was actually able to start the game, but I got about 1fps, definitely not playable.

I have only tested the Steam version.

**I take no responsibility and will not guarantee for this working.**

## Prerequisites

Don't install or copy Rocksmith from/to an NTFS drive. It will not start. (I think that's because of permissions, but I'm not sure.) There's probably a way, but it's easier not having to bother with it.

If you use Proton-GE, install scripts sometimes don't run. In that case, use Valve's Proton for the first start, then switch to Proton-GE.

We will need wine, which is installed in the first step.

### Common paths

Some paths that we need difer from system to system. I use environment variables in this guide so you don't have to edit every second command you run. Here's what we need:

* **`$HOME`:** Already set, don't worry about it. (redirects to `/home/<username>`)
* **`$STEAMLIBRARY`:** The Steam Library where Rocksmith is installed in. This is important if you installed the game on a different drive. You can check where it's installed by opening Steam, then going to `Steam -> Settings -> Storage`. Search for the disk where Rocksmith is installed on. The path you need will be Above the disk usage indicator, [picture for visual explanation](/img/storage.png). Most of the time this will be in `$HOME/.steam/steam/`
* **`$PROTON`:** A specific location inside your Proton installation.
	* Valve Release: (Example with Proton 7) `/path/to/steamapps/common/Proton\ 7.0/dist`
	* Valve Beta/Experimental: (Example with Experimental) `/path/to/steamapps/common/Proton\ -\ Experimental/files`
	* Custom Proton: (Example with GE-Proton 9.11) `$HOME/.steam/steam/compatibilitytools.d/GE-Proton9-11/files`
	* Lutris Runners: (Example with lutris-7.2-2) No specific location, just `$HOME/.local/share/lutris/runners/wine/lutris-7.2-2-x86_64`

Example for default paths and Proton 7:

```
STEAMLIBRARY=$HOME/.steam/steam/
PROTON=$HOME/.steam/steam/steamapps/common/Proton 7.0/dist/
```

<details><summary>How to set environment variables</summary>

You can check the environment variables by running `echo $NAME`.

I recommend putting double quotes around the paths, just to be sure.

```

# Temporary:
# Totally fine for our usecase. Copy these lines into a terminal, enter the paths and hit enter.
# Keep in mind that these are only temporary. It only applies to the terminal instance you set it in.
# If you were to open a new terminal window, you'd have to enter them again to be able to use them.
STEAMLIBRARY=<path>
PROTON=<path>

# Permanent:
# Add these lines to ~/.profile
# You will need to log out and back in after adding them.
export STEAMLIBRARY=<path>
export PROTON=<path>
```

</details>


## Guides

There are two ways to do this. The one most people on [ProtonDB](https://www.protondb.com/app/221680) use is quicker, but results in high delay and distorted sound. It routes the sound through ALSA. This can be found in "Other Guides".

Then there's the way of routing the audio through JACK -> wineASIO -> RS_ASIO, which has less delay and sounds better, but also takes longer to set up. These can be found in the table below.

**Recent Proton versions:**

|| pipewire | non-pipewire |
|---|---|---|
| Arch | [Guide](guides/setup/arch-pipewire.md) | [Guide](guides/setup/arch-non-pipewire.md) |
| Debian | [Guide](guides/setup/deb-pipewire.md) | [Guide](guides/setup/deb-non-pipewire.md) |
| Fedora | [Guide](guides/setup/fed-pipewire.md) | N/A |
| Steam Deck | [Guide](guides/setup/deck-pipewire.md) | N/A |
| NixOS | [Guide](guides/setup/nixos/1.md) | missing |

**Other Guides:**

* [OBS guide for these setups](guides/obs.md)
* [Differences: Proton versions 6.5 and below](guides/6.5-differences.md)
* [ALSA - Quick and dirty](guides/quick.md)
* [Different sound processing with Tonelib-GFX](guides/tonelibgfx.md)

**Other information:**
* [Steps I cut out](guides/unused.md)
* [Why all of this works](guides/theory.md)

### Scripts

These are outated. I'll leave the content here just in case.

<details>
Because someone asked, I have written scripts that do everything for you.

For native Steam: `wget https://raw.githubusercontent.com/theNizo/linux_rocksmith/main/scripts/native-steam.sh && ./native-steam.sh && rm native-steam.sh`

For other Rocksmith installations: `wget https://raw.githubusercontent.com/theNizo/linux_rocksmith/main/scripts/other.sh && ./other.sh && rm other.sh`
</details>

## Credits

* [preflex](https://gitlab.com/preflex) for showing me how to do it on Arch-based distros.
* [u/JacKeTUs](https://www.reddit.com/user/JacKeTUs) for publishing a [Debian-based Guide](https://old.reddit.com/r/linux_gaming/comments/jmediu/guide_for_setup_rocksmith_2014_steam_no_rs_cable/) on [r/linux_gaming](https://old.reddit.com/r/linux_gaming/)
* [the_Nizo](https://github.com/theNizo), for using that information and updating it regularly in the past. My original Guide was posted [here](https://old.reddit.com/r/linux_gaming/comments/jmediu/guide_for_setup_rocksmith_2014_steam_no_rs_cable/gdhg4zx/).
* [BWagener](https://github.com/BWagener) for writing the Steam Deck Guide.
* [Siarkowy](https://github.com/Siarkowy) for replacing the "JustInCaseWeNeedIt" workaround and the shortcut in Steam.
* [TimP4w](https://github.com/TimP4w) for the NixOS guide.

Thank you all for the work ^^
