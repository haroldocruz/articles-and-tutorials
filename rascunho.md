
---

https://github.com/ruudud/devdns

---

C:\Windows\System32\drivers\etc\hosts

127.0.0.1 host.docker.internal


    external_links:
      - mongo
    extra_hosts:
      - "host.docker.internal:host-gateway"

---

extra_hosts:
      - "host.docker.internal:172.17.0.1"

This is neither a requirement, nor is it wrong to use extra_hosts to let the container inject this name resolution into the containers /etc/host. Or you just use the host’s hostname or ip.

If this is not working, replace 172.17.0.1 (ip of docker0) with 172.18.0.1 (ip of docker_gwbridge).

---

Hello,
another simple and useful solution to resolve this problem with Compose is to use “network aliases” : Networking in Compose | Docker Documentation 212

version: "3.7"

services:
  api:
    links:
      - nginx:api.localhost
  nginx:
With that aliases, “nginx” container will be reachable from “api” container on http://api.localhost 13.
No need to update “/etc/hosts” inside “api” container.

---

docker-compose
extra_hosts --network host.docker.internal 172.17.0.1
EXTRA_HOSTS

portainer
estudar sobre asdf

---

Thanks all of you for your replies. I solved this problem by using flag --add-host=host.docker.internal:host-gateway and also changed hostname in WORDPRESS_DB_HOST variable.

sudo docker run --name wordpress --add-host=host.docker.internal:host-gateway -p 127.0.0.1:9001:9000 \
 -v /var/www/html:/var/www/html \
 -v /var/wordpress/uploads:/var/www/html/wp-content/uploads \
 -e WORDPRESS_DB_HOST=host.docker.internal:3306 \
 -e WORDPRESS_DB_USER=wp-user \
 -e WORDPRESS_DB_PASSWORD=VeryStr0ngP@ss \
 -e WORDPRESS_DB_NAME=wordpress \
 wordpress:php8.1-fpm

Also I maked changes to the file /etc/mysql/mariadb.conf.d/50-server.cnf and changed the string from bind-address = 127.0.0.1 to bind-address = *. After this I executed sudo systemctl restart mysql command and my container worked fine.

---
