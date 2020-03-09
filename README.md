This is not managed anymore...

# About

This image was copied from https://github.com/domibarton/docker-couchpotato all credits goes to the author(s), the reason for copying it is because i allways want to have control over the images running.

This is a Docker image for [CouchPotato](https://couchpota.to/) - the awesome movie PVR for usenet and torrents.

The Docker image currently supports:

* support for OpenSSL / HTTPS encryption

# Run

### Run via Docker CLI client

To run the CouchPotato container you can execute:

```bash
docker run --name couchpotato -v <download path>:/media/downloads -v <media path>:/media/movies -v <config path>:/config -p 5050:5050 orbnedron/couchpotato
```

Open a browser and point it to [http://my-docker-host:5050](http://my-docker-host:5050)

### Run via Docker Compose

You can also run the CouchPotato container by using [Docker Compose](https://www.docker.com/docker-compose).

If you've cloned the [git repository](https://github.com/orbnedron/couchpotato-docker) you can build and run the Docker container locally (without the Docker Hub):

```bash
docker-compose up -d
```

If you want to use the Docker Hub image within your existing Docker Compose file you can use the following YAML snippet:

```yaml
couchpotato:
    image: "orbnedron/couchpotato"
    container_name: "couchpotato"
    volumes:
        - "<download path>:/media/downloads"
        - "<media path 1>:/media/movies"
        - "<media path 2>:/media/movies2"
        - "<media path 3>:/media/movies3"
        - "<config path>:/config"
    ports:
        - "5050:5050"
    restart: always
```

## Configuration

### Volumes

Please mount the following volumes inside your CouchPotato container:

* `/config`: Holds all the CouchPotato data files (e.g. config, postProcessing)
* `/media/movies`: Directory for movies, up to 3 folders
* `/media/downloads`: Holds all the downloaded data (e.g. dropbox folders)

### Configuration file

By default the CouchPotato configuration is located on `/config/config.ini`.
If you want to change this you've to set the `CONFIG` environment variable, for example:

```
CONFIG=/datadir/couchpotato.ini
```


