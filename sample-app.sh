#!/bin/bash

# Creating directories
mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

# Copying app files in directory
cp app.py tempdir
cp -r templates/* tempdir/templates
cp -r static/* tempdir/static

# Command to create docker file
echo "FROM python" > tempdir/Dockerfile
echo "RUN pip install flask" >> tempdir/Dockerfile
echo "COPY ./static /home/myapp/static/" >> tempdir/Dockerfile
echo "COPY ./templates /home/myapp/templates/" >> tempdir/Dockerfile
echo "COPY app.py /home/myapp/" >> tempdir/Dockerfile
echo "EXPOSE 5050" >> tempdir/Dockerfile
echo "CMD python3 /home/myapp/app.py" >> tempdir/Dockerfile

cd tempdir

docker build -t sampleapp .
docker run -t -d -p 5050:5050 --name sample_running sampleapp
docker ps -a
