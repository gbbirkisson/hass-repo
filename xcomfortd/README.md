# Gummi's Home Assistant Addons: xComfortd

## About

This plugin allows you to control the Eaton xComfort CKOZ-00/14 Communication stick through MQTT. It is based on `karloygard` [xcomfortd](https://github.com/karloygard/xcomfortd). View the [README](https://github.com/karloygard/xcomfortd/blob/master/README.md) from that repository for more info.

## Setup lights

```yaml
# Example configuration.yaml entry
light:
  - platform: mqtt
    name: "My light"
    state_topic: "xcomfort/[datapoint number]/get/switch"
    command_topic: "xcomfort/[datapoint number]/set/switch"
    payload_on: "true"
    payload_off: "false"
    brightness_state_topic: "xcomfort/[datapoint number]/get/dimmer"
    brightness_command_topic: "xcomfort/[datapoint number]/set/dimmer"
    brightness_scale: 100

automation:
- alias: My Light State
  description: 'Poll state of my light every 15 minutes'
  trigger:
  - minutes: '30'
    platform: time_pattern
  condition: []
  action:
    service: mqtt.publish
    data_template:
        topic: 'xcomfort/[datapoint number]/set/requeststatus'
        payload: ""
```