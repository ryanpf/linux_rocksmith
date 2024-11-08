# Configuring RS_ASIO

(Please note that there is much more detail (including reports for certain audio interfaces) on the [RS_ASIO repo](https://github.com/mdias/rs_asio))

![](/img/rs-asio.webp)

You can bind up to 3 inputs (mono) to Rocksmith.

The available audio devices in Rocksmith will always be in this order with this description, regardless of what's actually plugged in. Rocksmith will do an amp sim for the RealToneCables (of which you can turn the volume down), but not for the mic input.

## RS_ASIO.ini

Set every driver to `wineasio-rsasio` and you did most of the work.

The configuration is fine as is. But if you want to disable the other inputs, you can by putting `;` in front of every line of the other inputs.

Only mono inputs are accepted by RS_ASIO. The `Channel` sets which in_# of Rocksmith picks up the input for that device. Keep in mind that jack shows the first input as in_1, but this ini lists the first input as 0, so you need to calculate -1 for those.

(Computers start counting at 0. This is a very common practice. so channel=0 is in_1, channel=1 is in_2, and the last one is channel=15, which is in_16)
