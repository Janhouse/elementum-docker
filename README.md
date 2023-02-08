# Remote Elementum service for Android TV in Docker

To offload processing from Android TV, run Elementum in a Docker container on a separate machine.

## Usage

Copy .env file and make adjustments to it.
```
cp sample.env .env
```

Build and start the container

``` 
docker compose build
docker compose up -d
```

In Kodi services settings, enable "Allow remote control from applications on other systems"

In Elementum settings Advanced tab check "Do not start binary" and enter "Remote host" ip address.
