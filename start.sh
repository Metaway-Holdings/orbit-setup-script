#!/bin/bash
sudo docker compose -f docker-compose.node.yaml  up -d
sudo docker-compose logs -f nitro
