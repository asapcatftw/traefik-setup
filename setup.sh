docker network create web
sudo su
mkdir -p /opt/traefik
touch /opt/traefik/docker-compose.yml
touch /opt/traefik/acme.json && chmod 600 /opt/traefik/acme.json
touch /opt/traefik/traefik.toml
wget https://github.com/asapcatftw/traefik-setup/blob/master/docker-compose.yml
wget https://github.com/asapcatftw/traefik-setup/blob/master/traefik.toml
echo "Add your domain and email under [docker] and [acme], in traefik.toml"
