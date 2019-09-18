docker network create web
sudo su
mkdir -p /opt/traefik
cd /opt/traefik
wget https://raw.githubusercontent.com/asapcatftw/traefik-setup/master/docker-compose.yml
wget https://raw.githubusercontent.com/asapcatftw/traefik-setup/master/traefik.toml
touch /opt/traefik/acme.json
chmod 600 /opt/traefik/acme.json
echo "Add your domain and email under [docker] and [acme], in traefik.toml"
