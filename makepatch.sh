#!/bin/sh

# Get the diffs between the official 3.10.18 and HEAD
git diff 4e77f7f1261f65cff06918bc5e66d02a418fc842.. > rpi-patches-3.10.18.patch

# Split big patch into smaller ones

filterdiff -i '?/drivers/usb/*' rpi-patches-3.10.18.patch > 001-Add-dwc_otg-driver.patch

filterdiff -i '?/arch/*' -i '?/kernel/*' -i '?/include/linux/broadcom/*' rpi-patches-3.10.18.patch > 002-Main-bcm2708-linux-port.patch

filterdiff -i '?/drivers/watchdog/*' rpi-patches-3.10.18.patch > 003-bcm2708-watchdog-driver.patch

filterdiff -i '?/drivers/video/*' -i '?/include/uapi/linux/fb.h' rpi-patches-3.10.18.patch > 004-bcm2708-framebuffer-driver.patch

filterdiff -i '?/drivers/char/*' -i '?/drivers/misc/*' rpi-patches-3.10.18.patch > 005-bcm2708-vchiq-driver.patch

filterdiff -i '?/drivers/net/usb/*' rpi-patches-3.10.18.patch > 006-Allow-mac-address-to-be-set-in-smsc95xx.patch

filterdiff -i '?/drivers/char/*' rpi-patches-3.10.18.patch > 007-bcm2708_hw_random-driver.patch

filterdiff -i '?/drivers/staging/media/*' rpi-patches-3.10.18.patch > 008-lirc_rpi_driver.patch

filterdiff -i '?/drivers/spi/*' rpi-patches-3.10.18.patch > 009-bcm2708-spi-driver.patch

filterdiff -i '?/drivers/thermal/*' rpi-patches-3.10.18.patch > 010-bcm2835-thermal-driver.patc

filterdiff -i '?/drivers/cpufreq/*' rpi-patches-3.10.18.patch > 011-bcm2835-cpufreq-driver.patch

filterdiff -i '?/sound/arm/*' rpi-patches-3.10.18.patch > 012-bcm2708-sound-driver.patch

filterdiff -i '?/drivers/hwmon/*' rpi-patches-3.10.18.patch > 013-bcm2835-hwmon-driver.patch

filterdiff -i '?/drivers/mmc/*' -i '?/include/linux/mmc/*' rpi-patches-3.10.18.patch > 014-bcm2708-sdhci-driver.patch

filterdiff -i '?/drivers/i2c/*' rpi-patches-3.10.18.patch > 015-bcm2708-i2c-driver.patch

filterdiff -i '?/drivers/tty/serial/*' rpi-patches-3.10.18.patch > 016-amba-pl011-fifosize.patch

