[Yo dawg.](/img/yo-dawg.webp)

# What are the differences between the approaches?

## Native JACK vs. pipewire-jack

(You can have pipewire and native JACK installed at the same time)

On Linux, there's multiple audio systems. alsa, pulseaudio, and JACK. JACK is meant for professional audio. With pipewire, we have another one that can act as all of the above, but internally, everything is on the same level.

With native JACK, we would need to start JACK before launching the game. With pipewire-jack, we wouldn't have to do that, but it often acts strange and it can lead to the game crashing immediately. Finding the cause is usually harder.

Bottom line what I think is: pipewire-jack integrates better, native JACK is more reliable. I'm probably going with native JACK

## LD_PRELOAD vs start script

Due to the Steam Runtime, JACK usually doesn't work with Steam games. These are ways to make them work with it.

## "I use native JACK"

LD_PRELOAD is going to be faster to set up, but you can do either one or both.

## "I use pipewire-jack"

I've heard of cases where the audio devices don't connect reliably when using LD_PRELOAD.

The start script takes a bit longer, but is in my opinion more reliable in this situation.

In some cases, one of the approaches doesn't work on a specific distro. I've put warnings there. In this case, obviously use the one that works.

# Which guide should I choose?

## "I do not use pipewire."

Native JACK it is. LD_PRELOAD or start script is up to your preference.

The rest of these statements will be for pipewire users.

## What's the simplest one?

alsa. It's also the one with the worst audio and latency. You might want to look at the next question though.

## "I want the easiest way to set it up"

Native JACK with LD_PRELOAD.

## "I want it to work reliably"

Native JACK with either one of the launch methods.

## "I want to play multiplayer"

There's a way to use multiple devices with native JACK, but I haven't looked into it too much.

If you have an audio interface with multiple inputs, you can use either one.

If you don't, I recommend pipewire-jack.

## "I don't want my device to be exclusive."

pipewire-jack.

(Maybe it's possible with native JACK using `pipewire-jack-client`, but I couldn't figure that out yet.)

## "I just want to click one button and expect the thing to work pretty much all the time."

Just saying, pressing 2 buttons makes this close to possible without giving you headaches. But if you want to...

Not impossible, but additional effort (and ability to write shell scripts) needed. It would be something along the lines of

* Native JACK
* Start script
* edit start script, check if JACK is running and start it if not (you can get the command from the "Messages" window from QjackCtl)
* maybe stop JACK after playing
