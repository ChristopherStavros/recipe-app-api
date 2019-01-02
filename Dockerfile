#IMAGE NAME - Add a base image and then just add the customize bits for you particular project
FROM python:3.7-alpine

#OPTIONAL LABELS
LABEL filename="Dockerfile"
LABEL baseImage="python:3.7-alpine"
LABEL author="ChristopherStavros"

#Tell Python to run in unbuffered mode -- recommended when runnning Python in Docker images
ENV PYTHONUNBUFFERED 1 

#Copy ./requirements.txt (adjecent to Docker file) and copy it to /requirements.txt on the Docker image
COPY ./requirements.txt /requirements.txt

#Install requirements on the Docker image
RUN pip install -r /requirements.txt

#create /app on DOcker image, set it as working directory, and copy ./app (adjecent to Docker file) to /app on Docker image
RUN mkdir /app
WORKDIR /app
COPY ./app /app

#Create user and swtich to user (-D means that it can it only be used to run an application processes - security best practice)
RUN adduser -D user
USER user

