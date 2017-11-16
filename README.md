## Supported tags and respective `Dockerfile` links

* [`latest` _(Dockerfile)_](https://github.com/nathcoad/nginx-rtmp-docker/blob/master/Dockerfile)

# nginx-rtmp

[**Docker**](https://www.docker.com/) image with [**Nginx**](http://nginx.org/en/) using the [**nginx-rtmp-module**](https://github.com/arut/nginx-rtmp-module) module for live multimedia (video) streaming and php for authentication.

## Description

This [**Docker**](https://www.docker.com/) image can be used to create an RTMP server for multimedia / video streaming using [**Nginx**](http://nginx.org/en/) and [**nginx-rtmp-module**](https://github.com/arut/nginx-rtmp-module), built from the current latest sources (Nginx 1.13.0 and nginx-rtmp-module 1.2.0).

Forked from <https://hub.docker.com/r/tiangolo/nginx-rtmp/>

**GitHub repo**: <https://github.com/nathcoad/nginx-rtmp-docker>

**Docker Hub image**: <https://hub.docker.com/r/encode/nginx-rtmp-docker/>

## Details


## How to use

* For the simplest case, edit compose.yml to set a stream password, then run a container with this image:

```bash
docker-compose -f compose.yml up
```

## How to test with OBS Studio and VLC


* Run a container with the command above
* Modify OBS config for authentication

* Open [OBS Studio](https://obsproject.com/)
* Click the "Settings" button
* Go to the "Stream" section
* In "Stream Type" select "Custom Streaming Server"
* In the "URL" enter the `rtmp://<ip_of_host>/live` replacing `<ip_of_host>` with the IP of the host in which the container is running. For example: `rtmp://192.168.0.30/live`
* In the "Stream key" use a name that will be used later in the client URL to display that specific stream. For example: `test`
* Append `key=<password>` to the "Stream key", where `<password>` matches what you defined in compose.yml. The full string should look like `Test?key=p@ssw0rd`
* Click the "OK" button
* In the section "Sources" click de "Add" button (`+`) and select a source (for example "Display Capture") and configure it as you need
* Click the "Start Streaming" button


* Open a [VLC](http://www.videolan.org/vlc/index.html) player (it also works in Raspberry Pi using `omxplayer`)
* Click in the "Media" menu
* Click in "Open Network Stream"
* Enter the URL from above as `rtmp://<ip_of_host>/live/<key>` replacing `<ip_of_host>` with the IP of the host in which the container is running and `<key>` with the key you created in OBS Studio. For example: `rtmp://192.168.0.30/live/test`
* Click "Play"
* Now VLC should start playing whatever you are transmitting from OBS Studio

## License

This project is licensed under the terms of the MIT License.
