# Usage: To build the Image
# docker build -t <tag> . 
# only work when you are present currently working directly where Dockerfile is located thats why we passed ( . ). 
# else folder path shoud be passed
# If the name of Docker is different then the command should be docker build -f <dockerFileName> -t <tag> . 

# Base Image (pateela) 
FROM ubuntu

# Creating the current working directory
WORKDIR /app

# Take the Ingredients
# Generally COPY Command is used here

# Mixing
# Generally RUN Command is used here
RUN apt-get update
RUN apt-get install curl -y    

# GAS ON
# Start up command, Note only 1 CMD/ Entrypoint command is allowed per dockerfile
CMD ["echo", "Hello from my custom image!"]

# Generally CMD/ ENTRYPOINT Command is used here
