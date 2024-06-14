# Get the start script: Proton 8 or lower

In Steam, right click on Rocksmith and choose "Properties". Set the following launch options:

```
PROTON_LOG=1 PROTON_DUMP_DEBUG_COMMANDS=1 %command%
```

then start the game from Steam again. You will now have a script at `/tmp/proton_$USER/run` that represents the command Steam runs when starting the game. If we run this script, Rocksmith can start via Steam and have sound. (`PIPEWIRE_LATENCY="256/48000" /tmp/proton_$USER/run`)

Let's copy the script to somewhere else and give it a better name. This is an example that I will use in the rest of the guide. You can change the path or the name of the script, if you want to.

```
cp /tmp/proton_$USER/run $STEAMLIBRARY/steamapps/common/rocksmith-launcher.sh
```

Please continue with the guide.
