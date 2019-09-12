# Traefik-setup
Traefik with Docker and Let's Encrypt | setup


## Getting Started
What will you need to get started with Traefik
* [Docker](https://www.docker.com/) - Docker to manage/create containers 
* [Docker-compose](https://docs.docker.com/compose/) - Docker-compose to manage multi container applications
* Public IP
* 1 domain or subdomain

### Download & setup files
Run this on your system to setup traefik
```
wget https://raw.githubusercontent.com/asapcatftw/traefik-setup/master/setup.sh;  sh setup.sh
```
### DNS | Create wildcard subdoamin
Need for auto Let's Encrypt
```
A record -  *.example.com   ->  Public.IP

--OR-- 

A record -  *.subdoamin.example.com   ->  Public.IP
```

### Make Changes
Add your domain and email in traefik.toml under `[docker]` and `[acme]` section
```
vi /opt/traefik/traefik.toml
```

### Run docker-compose
```
cd /opt/traefik
docker-compose up -d
```


## Testing with Portainer
create a docker-compose YAML for portainer.
```
mkdir -p /opt/portainer
vi /opt/portainer/docker-compose.yml
```

Now add this to your compose file.
```
version: "2"

services:
  portainer:
    image: portainer/portainer
    container_name: portainer
    restart: unless-stopped
    networks:
      - web
    environment:
      - VIRTUAL_HOST=subdomain.example.com
    labels:
      - "traefik.enable=true"
      - "traefik.frontend.rule=Host:subdomain.example.com"
      - "traefik.port=9000"
      - "traefik.docker.network=web"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - portainer_data:/data

networks:
  web:
    external: true

volumes:
  portainer_data:
```

Change `subdomain.example.com` to your domain and run compose
```
cd /opt/portainer
docker-compose up -d
```
