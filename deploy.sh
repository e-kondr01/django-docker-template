#!/bin/bash
git pull
docker-compose -f production.yml up --detach --build --force-recreate