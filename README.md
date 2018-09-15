`audacity` in `docker-compose` setup
====================================
*Running the latest audacity in docker*

```
docker build -t neofob/audacity:latest .
docker run --rm --name audacity \
        -u 1000:1000 \
        -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
        -v "$HOME:$HOME" -w "$HOME" -e DISPLAY="unix$DISPLAY" \
        -e HOME \
        $(find /dev/snd/ -type c | sed 's/^/--device /') \
        neofob/audacity:latest
```

Run with `docker-compose` for less typing.
```
# Enable X access from anyhost, which will be from docker in our case?
xhost +
docker-compose up -d
```
Alternatively, we can run the `audacity` container in `network_mode:host`

**Note:** The `1st` user `id` and its group `id` in `Ubuntu/Debian` is `1000`.
You can nerd out to replace `-u 1000:1000` with `-u $(id -g):$(id -u)`.

References
==========
* [`psychemedia's gist`][0]
* [`knickers docker`][1]
* [`Jessie Frazelle dockerfile`][2]

[0]: https://gist.github.com/psychemedia/5c3b4f5042dbecb46a92a54c48e9ab61
[1]: https://hub.docker.com/r/knickers/audacity/
[2]: https://github.com/jessfraz/dockerfiles/tree/master/audacity
