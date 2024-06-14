# Configuring RS_ASIO

![](/img/rs-asio.png)

Set every driver to `wineasio-rsasio` and you're done. This setup is ready for multiplayer.

You can bind up to 3 inputs (mono) to Rocksmith.

## Rocksmith

The names inside Rocksmith will always be these ones and do not correlate with the input device you're using. It only has to do with the configured inputs in RS_ASIO.ini.

## RS_ASIO

The configuration is fine as is. But if you want to disable the other inputs, you can by putting `;` in front of every line of the other inputs.

Only mono inputs are accepted by RS_ASIO. The Channel sets which in_# is responsible for the input. So if i were to set Channel=7 in Asio.Input.0, the device would need to be bound to in_8.

(Computers start counting at 0. This is a very common practice. so channel=0 is in_1, channel=1 is in_2, and the last one is channel=15, which is in_16)
