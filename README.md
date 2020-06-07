# Lock screen on usb remove

Simple udev rule to run a script when a chosen USB device is removed. This example locks the screen and shuts the computer down in 5 minutes.

### Prerequisites

Created for Ubuntu 20.04 although the UDEV rule will likely work in other versions and GNU/Linux distros.

The executable script will only work for Ubuntu with GNOME.

## Deployment

Insert the USB device you want to create a rule for.

Run the udevadm monitor.
```bash
$ udevadm monitor --kernel --property --subsystem-match=usb | grep PRODUCT
```
Remove the device and note down the product id. You should get something like this.

> PRODUCT=90c/1000/1100

Create a new .rules file in `/etc/udev/rules.d/`.
```
ACTION=="remove", SUBSYSTEM=="usb", ENV{PRODUCT}=="$product_id", RUN+="/bin/su $user --command='$path/stop.sh'"
```
Where `$user` is your host name, `$path` is the path to the executable and `$product_id` is the previously obtained id.

Note: `remove` can be replaced with `add` to run script on USB insertion.

## License


## Acknowledgments

* Inspired by a Greekdiary [blog post](https://www.thegeekdiary.com/how-to-run-a-script-when-usb-devices-is-attached-or-removed-using-udev/)
