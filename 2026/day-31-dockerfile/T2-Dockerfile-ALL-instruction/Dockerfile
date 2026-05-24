### Task 2: Dockerfile Instructions
# Create a new Dockerfile that uses **all** of these instructions:
# - `FROM` — base image (Taking ubuntu)
# - `RUN` — execute commands during build (installing nginx)
# - `WORKDIR` — set working directory
# - `COPY` — copy files from host to image (Copy a dummy folder/files to workdir) and also runs ls -a and pwd command.
# - `EXPOSE` — document the port (Just a annotation NOT actually opens the port.)
# - `CMD` — default command (run a demo command)


# Take patelaa
FROM ubuntu

# Setting the Current working directory

WORKDIR /app

# (Ingredeints)Copy all files from Local current working dir (first dot) to /app (second dot).
COPY . .

# (Mixing) Installing 

RUN apt-get update
RUN apt-get install nginx -y

# To see pwd and ls -a logs during the image build use 2 flags while building the image --no-cache and --progress=plain
# docker build --progress=plain --no-cache -t custom-nginx:v1 . 
RUN pwd 
RUN ls -a

# EXPOSE Annotation - as nginx runs on port 80 So just referening here it Actually do nothing.

EXPOSE 80

# GAS ON
# Start up command, Note only 1 CMD/ Entrypoint command is allowed per dockerfile

CMD ["nginx", "-g", "daemon off;"]
