### Task 1: The Problem with Large Images
1. Write a simple Go, Java, or Node.js app (even a "Hello World" is fine).
2. Create a Dockerfile that builds and runs it in a **single stage**.
3. Build the image and check its **size**.

Note down the size — you'll compare it later.

- Base image used: `python:3.11`
- Single-stage image size: ~1.6 GB

### Task 2: Multi-Stage Build
1. Rewrite the Dockerfile using a **multi-stage build**:
   - Stage 1: Build the app (install dependencies, compile).
   - Stage 2: Copy only the built artifact into a minimal base image (`alpine`, `distroless`, or `scratch`).
2. Build the image and check its size again.
3. Compare the two sizes.

- Distroless image size: 97.9 MB

![multi-stage image size comparison](image.png)

#### Why is the multi-stage image so much smaller?
Because it does not include unnecessary build tools, shells, and distribution files. It only contains the runtime and the artifacts needed to run the app, which makes the image smaller and more secure.

### Task 3: Push to Docker Hub
1. Create a free account on [Docker Hub](https://hub.docker.com) if you don't already have one.
2. Log in from your terminal:

```bash
docker login
```

3. Tag your image properly:

```bash
docker tag myappdistro:latest devendragohare16/myappdistro:latest
```

4. Push the image:

```bash
docker push devendragohare16/myappdistro:latest
```

![Docker Hub push screenshot](image-1.png)

5. Verify the push by pulling the image on a different machine or after removing it locally.

### Task 4: Docker Hub Repository
1. Go to Docker Hub and check your pushed image.
2. Add a **description** to the repository.
3. Explore the **Tags** tab and understand how versioning works.
4. Pull a specific tag vs `latest` and note the difference.

![Docker Hub tags screenshot](image-2.png)

### Task 5: Image Best Practices
Apply these best practices when building Docker images:
1. Use a **minimal base image** (Alpine or distroless instead of Ubuntu).
2. **Don't run as root** — add a non-root `USER` in your Dockerfile.
3. Combine `RUN` commands to **reduce layers**.
4. Use **specific tags** for base images instead of `latest`.

#### Example deployer stage for Distroless
```dockerfile
FROM gcr.io/distroless/python3-debian12 AS deployer

WORKDIR /distro_app

# Copy only the installed packages from the builder
COPY --from=builder /app/library /distro_app/library

# Copy only your source files
COPY --from=builder /app /distro_app

# Set the Python path so it can find the libraries
ENV PYTHONPATH=/distro_app/library

# Security best practice: switch to a non-root user
USER nonroot

EXPOSE 5000
CMD ["app.py"]
```

Distroless images include a built-in non-root user named `nonroot` (UID 65532).

#### Why the order matters
- `COPY --from=builder` needs root privileges to write files into `/distro_app`.
- After the files are copied, `USER nonroot` drops privileges before the container runs.

#### Writable directories
If your app needs write access to a directory, change ownership before switching users:

```dockerfile
COPY --chown=65532:65532 ./logs /distro_app/logs
USER nonroot
```
