# Get the start script: Proton 9 or higher

(Using the launch script from previous Proton versions and just adjusting paths works as well.)

(folder names and script name can be changed, if you want to.)

In Steam, right click on Rocksmith and choose "Properties". Set the following launch options:

```
PRESSURE_VESSEL_SHELL=instead %command%
```

then start the game. You will get a terminal. Type in these commands:

```
mkdir start-script
cd start-script
echo $@ > launch
echo $(env) > vars
# you can exit now
```

You can now remove the launch options.

You have now exported everything you need to build a launch script. Enter a terminal, cd into the directory where you placed `launch` and `vars` in the last step. Run these commands:

```
# again, make sure you've set $STEAMLIBRARY. You will need it here one last time.
sed -i 's/ /\n/g' vars
rm rocksmith-launcher.sh
echo '#!/bin/bash' >> rocksmith-launcher.sh
echo '' >> rocksmith-launcher.sh
echo cd "$STEAMLIBRARY/steamapps/common/Rocksmith2014/" >> rocksmith-launcher.sh
echo 'PIPEWIRE_LATENCY="256/48000" \' >> rocksmith-launcher.sh
grep -iP "steamappid|SteamOverlayGameId|SteamGameId|SteamEnv|SteamClientLaunch|STEAM_COMPAT_APP_ID|STEAM_COMPAT_DATA_PATH|STEAM_COMPAT_MEDIA_PATH|STEAM_COMPAT_SHADER_PATH|STEAM_COMPAT_INSTALL_PATH|STEAM_COMPAT_CLIENT_INSTALL_PATH" vars | tr '\n' ' \\n' >> rocksmith-launcher.sh
sed -e 's/container-runtime /container-runtime "/g' -e 's/ waitforexitandrun /" waitforexitandrun "/g' -e 's/ -uplay_steam/" -uplay_steam/g' launch >> rocksmith-launcher.sh
chmod +x rocksmith-launcher.sh
```

<details><summary>In case you want to strip the environment variables down</summary>

If you really want to, you can change the regex to your liking.

Minimum: `SteamAppId|STEAM_COMPAT_CLIENT_INSTALL_PATH|STEAM_COMPAT_DATA_PATH`
Recommened: `steamenv|steamappid|steam_compat_client_install_path|compat_data_path|SteamOverlayGameId`

Theoretically, you could even remove SteamAppId, but then the savegame location changes and you can't use the Steam cloud for your saves. Here's what some flags do:

| Name | Function |
| --- | --- |
| SteamAppId | Gives Steam information, which game is running |
| SteamOverlayGameId | Sets the Steam overlay to the correct game. |
| SteamGameId | Steam integration |
| SteamEnv | Steam integration |
| SteamClientLaunch | Steam integration |
| STEAM_COMPAT_SHADER_PATH | precompiled shaders, I guess. |

For the others, I've collected what seemed reasonable.

</details>

You've got a launch script now. Please continue with the guide

Note: The Steam overlay relies on files that are only placed in RAM when a game is started from Steam. You will therefore not see the overlay when running from a terminal.
