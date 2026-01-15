# WIP!

I created this for my minecraft server network, i still need to change some files to change it to hytale

# Documentation WIP

## Hytale Server Network Docker

This repo provides a docker container that can run different hytale servers.

## Services

- Hytale Server
- Mysql Database
- PHPMyAdmin

## Folders

### data

This folder contains sub folders for every hytale server and it will be mounted to the hytale server path

### configs

This folder contains sub folders for every hytale server to map differen config files

### jars

This folder can contain differen jar files like the HytaleServer.jar, it will be copied to every hytale server folder at start

### mods

This folder contains sub folders for every hytale server, the content will be copied to the mod folder in the hytale server folder.
The mods in the mods/common folder will be copied to every server

## Contribution

Feel free to create Pull-Requests