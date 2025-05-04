# ansible-myrna-camera

## Defining a camera

Example:

```yaml
    - name: table-south
      pci_device: /dev/v4l/by-path/pci-0000:00:14.0-usbv2-0:5:1.0-video-index0
      v4lctl:
        - focus_automatic_continuous=0
        - focus_absolute=145
        - zoom_absolute=100
```

* `name` should match the name of the camera in the myrna service (required).
* `pci_device` is the `by-path` or `by-id` path to the camera's device file (required).
* `v4lctl` is an optional list of `v4l2-ctl --set-ctl` arguments to apply to the device before starting ffmpeg, usually to set zoom, focus and exposure.