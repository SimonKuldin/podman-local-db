# podman-local-db

A way to get podman compose to startup a local SQL server instance, and restore a local db backup into the
new container for user

## Pre-requisites

Once checking this out, ensure there is a backups sub-folder that contains a SQL server backup file
eg. Folder structure:
```
folder
  -> backups (containing sql backup file)
```

Also make sure you have docker, podman, and podman compose installed (ideally with podman desktop)

## Run image
From folder that contains the dockerfile:
```podman compose -f docker-compose.yml up -d```
