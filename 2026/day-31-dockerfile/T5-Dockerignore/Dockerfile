# Base Image
FROM ubuntu:latest

# Working Directory
WORKDIR /app

# Ingredients
COPY . .

# Mix
RUN pwd
RUN ls -a

# Usage: just create the build and in the output we can see testfile.md should not be present.
# docker build --progress=plain --no-cache -t ignore:v1 .

