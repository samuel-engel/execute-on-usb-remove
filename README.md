# Lock screen on usb remove

Simple udev rule to run a script when a particualar usb is removed. Lock screen and shutdown in 5 minutes.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Created for Ubuntu 20.04 although it is likely to work in different versions and GNU/Linux distros.

Concept reiles on UDEV monitor and UDEV rules.


## Deployment

Insert USB device you want to monitor.
Run the udevadm monitor.
```
$ udevadm monitor --kernel --property --subsystem-match=usb | grep PRODUCT
```
Remove the device and note down the product id.

create a new .rules file in the /etc/udev/rules.d/ folder.
```
ACTION=="remove", SUBSYSTEM=="usb", ENV{PRODUCT}=="$product_id", RUN+="/bin/su $user --command='$path/stop.sh'"
```
Where $user is your host name, $path is the path to executable and $product_id the previously obtained id.

Note: remove can be replaced with add to run script on USB insertion.

## License


## Acknowledgments

* Inspired by the greekdiary blog post https://www.thegeekdiary.com/how-to-run-a-script-when-usb-devices-is-attached-or-removed-using-udev/
