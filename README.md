# Ansible Playground

This project contains a docker-compose file using which a small 3 node Ubuntu container playground can be created. The topology is as follows:
* Master   : 192.168.90.1
* Worker1  : 192.168.90.2
* Worker2  : 192.168.90.3

> Credentials : root/root123

The root folder has 3 subfolders which are mouted as volumes onto the corresponding containers:
* master --> mounted onto master container --> /work
* worker1 --> mounted onto worker1 container --> /work
* worker2 --> mounted onto worker2 container --> /work

These folders can be used to save your work and changes while using the playground.

## Setting up the playground

### Prerequisites
The following libraries need to be installed.
* Docker
* Docker-Compose

### Creating the playground
Execute the below command from the root folder to start the playground
```
docker-compose up -d
```

### Stopping the playground
Execute the below command from the root folder to stop the playground
```
docker-compose down
```




