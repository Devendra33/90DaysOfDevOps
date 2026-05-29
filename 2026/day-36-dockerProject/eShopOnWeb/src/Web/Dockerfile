# RUN COMMAND - docker run --name eshopweb --rm -it -p 5106:5106 web

# This Dockerfile is called in docker compose which is present in root folder of eshoponweb

# Image using for building the and publish the .NET package will can be executed in runtime.
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

# Creating a working directory
WORKDIR /app

# Copying all the .sln file from the root folder(path: eshoponweb/) as the context is root defined in the docker compose context: .
# First only copy the .sln file to improve layer cache
COPY *.sln .

# Now copy all from root folder path: eshoponweb/ to /app
COPY . .

# Now switching directory to src/web where program.cs file is present (not we did not create new path here this files came from COPY . .)
WORKDIR /app/src/Web 

# Install all the dependcies for App to run
RUN dotnet restore

# Publish the app code and its dependendies in to a package.
# place that package in out folder. folder contains the web.dll file and other files using that we can run the application. 
RUN dotnet publish -c Release -o out

# Now Creating a separated container which should only contain the new package we created in above container
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime

# Creating the Working directory
WORKDIR /app

# Copying the out folder from build container to new container runtime in /app folder.

COPY --from=build /app/src/Web/out ./

# Optional: Set this here if not setting it from docker-compose.yml
# ENV ASPNETCORE_ENVIRONMENT Development

# Executing the Application when Container is Created.
ENTRYPOINT ["dotnet", "Web.dll"]
