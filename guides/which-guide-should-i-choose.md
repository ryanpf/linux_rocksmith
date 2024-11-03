# Which guide should I choose?

## "I do not use pipewire."

Native JACK it is.

The rest of these statements will be for pipewire users.

## "What do you think?"

pipewire-jack integrates better, native jack is way more reliable. I'm probably going with the second one.

## "I don't want my device to be exclusive."

pipewire-jack.

(Maybe it's possible with `pipewire-jack-client`, but I couldn't figure that out yet.)

## "I want it to be reliable."

Native JACK.

## "I just want to click one button and expect the thing to work pretty much all the time."

Just saying, pressing 2 buttons makes this close to possible without giving you headaches. But if you want to...

Not impossible, but additional effort (and ability to write shell scripts) needed. It would be something along the lines of

* Native JACK
* Start script
* edit start script, check if jack is running and start it if not (you can get the command from the "Messages" window from QjackCtl)
* maybe stop JACK after playing

# LD_PRELOAD or start script?

## I use native JACK

LD_PRELOAD is going to be easier, but you can do either one or both.

## I use pipewire-jack

I've heard of cases where the audio devices don't connect reliably when using LD_PRELOAD.

The start script takes a bit longer, but is in my opinion more reliable in this situation.

In some cases, one of the approaches doesn't work on a specific distro. I've put warnings there. In this case, obviously use the one that works.
