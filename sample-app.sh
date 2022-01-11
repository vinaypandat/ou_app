#!/bin/bash
cd sample_app
docker build -t sampleapp .
docker run -t -d -p 8080:8080 --name sampleRunning sampleapp
docker ps -a
