# ssh2host
ssh2host is tiny tool which can be deployed to Docker Swarm and which provides SSH access to all of them.

NOTE! ssh2host does not contain any kind of authentication so make sure that you secure access to it on your container orchestration tool.

![alt text](https://raw.githubusercontent.com/olljanat/ssh2host/master/ssh2host_on_portainer.png "ssh2host on Portainer")

# Deploy
- Enable SSH access with privake key authentication.
- Use same private key on all swarm nodes.
- Update USERNAME variable on stack.
- Create Docker secret from private key:
```bash
docker secret create host-ssh-key /path/to/ssh-key
```
- Deploy Docker stack
```bash
docker stack deploy -c ssh2host.yml ssh2host
```

# Usage
Start "bash" inside of container with command:
```bash
docker exec -it <containerid> bash
```
or use some web base container management tool.

# Build
```bash
docker build . -t ollijanatuinen/ssh2host
```

