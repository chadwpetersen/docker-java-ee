#!/usr/bin/env bash

# Run a maven clean
mvn -f app/pom.xml clean

# Prepare by downloading dependancies
mvn -f app/pom.xml dependency:resolve
mvn -f app/pom.xml verify

# Complie and package into war
mvn -f app/pom.xml package

# Run docker compose and build new images
docker-compose up --build -d
