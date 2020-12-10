# Gummi's Home Assistant Addons: Carwings Homecontrol

HomeKit support for the Nissan Leaf

## About

HomeKit support for the Nissan Leaf using HomeControl and my Carwings Go library.

When running, this service publishes a single HomeKit accessory exposing three services:

* A battery service indicating the current charge of your Leaf and its charging status.
* A switch service indicating whether the Leaf is currently charging. If the Leaf is plugged in but not charging, you can flip this switch on to begin charging the vehicle.
* A fan (v2) service for the Leaf's climate control. Flipping this switch toggles the vehicle's climate control system.

After the vehicle is paired with your iOS Home app, you can control it with any service that integrates with HomeKit, including Siri ("How much battery does the Leaf have?") and Apple Watch. If you have a home hub like an Apple TV or iPad, you can control the Leaf remotely.

To view the source code of this daemon, go to [github.com/joeshaw/carwings-homecontrol](https://github.com/joeshaw/carwings-homecontrol).

## Configuration

Add-on configuration:

```yaml
username: foo@example.com
password: carwingsPassw0rd
region: NNA
accessory_name: Leaf
homekit_pin: 00102003
climate_update_interval: 15
battery_update_interval: 15
storage_path: ~/.homecontrol
debug: false
```