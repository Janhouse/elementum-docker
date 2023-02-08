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

![image](https://user-images.githubusercontent.com/1036439/217650055-615077a4-b396-4822-ae93-51c1ef4dad7e.png)


In Elementum settings Advanced tab check "Do not start binary" and enter "Remote host" ip address.

![image](https://user-images.githubusercontent.com/1036439/217649957-6f67d3ce-e3cd-4e6e-8a8b-b633afdaae3d.png)

Restart Kodi and check the output of docker container

```
docker compose logs -f
```
