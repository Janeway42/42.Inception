#!/bin/bash

sudo docker run --name mynginx -p 3000:443 -d nginx
# sudo docker run --name mynginx -p 443:3000 -d nginx
