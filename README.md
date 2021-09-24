# Container Workspace Environment for all stuff AI related

This container contains everything necessary for doing Machine Learning with Python (it also includes all necessary packages like tensorflow, numpy, etc.), Jupyter Notebooks, etc.

## Build

Just run the build script:

```
./build
```

## Running

```
docker run -p 8888:8888 mlspace
```

To mount the current working directory onto the `~/.loc` directory of the container use:

```
docker run -v $PWD:/home/undefined/loc -p 8888:8888 mlspace
```

----

[Image on Docker Hub](https://hub.docker.com/r/undefinednone/mlspace)
