#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

# Creating a Base Image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
# Creating a Working Directory
WORKDIR /app

# Annotation - Exposing port 80/ 443 
EXPOSE 80
EXPOSE 443

# Creating a build Image
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
# Creating a Working Directory
WORKDIR /app

# all the files form eShopOnWeb to /app of pwd inside image
COPY . . 

# Switching the pwd to /app/src/PublicApi folder which we copied from COPY . . 
WORKDIR "/app/src/PublicApi"

# Install the packages and dependencies using dotnet restore command
RUN dotnet restore

# Building the application and stores its output to /app/build folder. we can also use dotnet publish but this best practice.
# dotnet build is a fast check that the project compiles before publishing. It allows a separate build layer, which can make caching and debugging easier.
# If build fails, the failure happens earlier and more clearly.
RUN dotnet build "./PublicApi.csproj" -c Release -o /app/build

# Start a new stage named publish/ the publish stage can reuse the restore/build context
# Use the final filesystem state of the build stage as the starting point
# Create a new stage that begins from the completed build stage.
# you avoid repeating COPY . . and dotnet restore
FROM build AS publish 

# Creating Executable package (PublicApi.dll) file and storing it /app/publish 
# Note the dll file name will be created as the root folder name .dll
RUN dotnet publish "./PublicApi.csproj" -c Release -o /app/publish

# This is Top image where final package will run
FROM base AS final

# Switching to working directory /app
WORKDIR /app

# Copy the package from /app/publish.dll to current final stage.
COPY --from=publish /app/publish .

# Running the Application.
ENTRYPOINT ["dotnet", "PublicApi.dll"]