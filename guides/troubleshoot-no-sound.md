# Find your sound problem.

If you're writing an issue about this, please tell me which step fails.

Below the list is an explanation what your problem most likely is.

## List

TEST IN THE GIVEN ORDER.

1. Make sure you have read the "Starting the game" section in the guide.
2. Sound output on your system generally works?
3. Does a native Linux software requiring JACK work? (eg. Ardour, Reaper, Tonelib software, ...)
4. Please test the following:

```
## replace paths as needed.
rm ~/wineasio-test
env WINEPREFIX=/home/$USER/wineasio-test /path/to/wineasio-register

## if the first one of the following commands doesn't work, try the second one.
## (Rocksmith is a 32 bit application and therefore only cares about 32 bit.)
WINEPREFIX=/home/$USER/wineasio-test wine /path/to/VBASIOTest32.exe
LD_PRELOAD=/your/path/to/libjack.so   WINEPREFIX=home/$USER/wineasio-test wine /path/to/VBASIOTest32.exe
```

5. Assuming you have set up the game, start it with the following command: `PIPEWIRE_LATENCY=256/48000 WINEPREFIX="$STEAMLIBRARY/steamapps/compatdata/221680/pfx" "$PROTON/bin/wine" "$STEAMLIBRARY/steamapps/common/Rocksmith2014/Rocksmith2014.exe"`
6. Start the game according to the section "Starting the game" which can be found in the guide. - Sometimes, only one of the 2 ways suggested works.

## Explanation

This just lists the answer to each of the points. It does not go into detail a lot.

1. Read the "Starting the game" section.
2. You have problems with your sound on your system in general, which is out of scope for this guide.
3. Something with JACK is broken. Maybe not set up correct, maybe (for native JACK) you forgot to start it? - This might be out of scope for this guide.
4. Something with wineasio isn't set up correctly. Make sure you installed it properly, make sure wineasio-register works successfully. If the VBASIOTest32 window doesn't show up at all, it doesn't mean this test failed, but we have less information to work with now, which is annoying.
5. You didn't run wineasio-register, or RS_ASIO is misconfigured. Delete your prefix and set it up again. Check if RS_ASIO is configured properly.
6. You have a problem.

## Doesn't help?

You can [create an issue](https://github.com/theNizo/linux_rocksmith/issues/new?assignees=&labels=help+wanted&projects=&template=help-needed.md&title=). Please include at which step you fail.
