# Gummi's Home Assistant Addons: xComfortd

Enable communication with the Eaton xComfort CKOZ-00/14 Communication stick.

## About

xComfort is a wireless European home automation system, using the 868,3MHz band. The system is closed source. This code was reverse engineered from a variety of sources, without documentation from Eaton, and may not follow their specifications. If this code damages your devices, it's on you.

This code supports both extended and regular status messages. Older devices only send the latter, which are not routed and have no delivery guarantees. Careful placement of the USB stick is important, so that it can see these messages.

To view the source code of this daemon, go to [github.com/karloygard/xcomfortd-go](https://github.com/karloygard/xcomfortd-go).

## How to use

You need to export the datapoints file with the CKOZ-00/13 USB stick and the associated MRF software. Consult the [MRF manual](http://www.eaton.com/ecm/groups/public/@pub/@eatonnl/@electrical/documents/content/pct_325435.pdf) (paragraph USB-RF-Communication Stick) for documentation on how to do this. The format must be TXT. Place that file in the configuration directory of Home Assistant.

## Configuration

Add-on configuration:

```yaml
mqtt_client_id: xcomfortd
datapoints_file: Datenpunkte.txt
device_number: 0
verbose: false
ha_discovery: true
ha_discovery_prefix: homeassistant
```

### Option: `mqtt_client_id` (required)

ID of the MQTT client the daemon connects with. 

### Option: `datapoints_file` (required)

Name of the datapoints file in the Home Assistant configuration directory.

### Option: `device_number` (required)

USB device number, if more than one is available.

### Option: `ha_discovery` (required)

Make the daemon send MQTT device discovery messages to Home Assistant.

### Option: `ha_discovery_prefix` (required)

The Home Assistant discovery prefix.

### Option: `verbose` (required)

Enable verbose logging.