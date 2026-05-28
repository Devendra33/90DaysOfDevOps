Mark yourself honestly — **can do**, **shaky**, or **haven't done**:

- [can do] Run a container from Docker Hub (interactive + detached)
- [can do] List, stop, remove containers and images
- [can do] Explain image layers and how caching works
- [can do] Write a Dockerfile from scratch with FROM, RUN, COPY, WORKDIR, CMD
- [can do] Explain CMD vs ENTRYPOINT
- [can do] Build and tag a custom image
- [can do] Create and use named volumes
- [can do] Use bind mounts
- [can do] Create custom networks and connect containers
- [can do] Write a docker-compose.yml for a multi-container app
- [can do] Use environment variables and .env files in Compose
- [can do] Write a multi-stage Dockerfile
- [can do] Push an image to Docker Hub
- [can do] Use healthchecks and depends_on

## Quick-Fire Questions
Answer from memory, then verify:

### 1. What is the difference between an image and a container?
- **Image**: A static package containing application code, runtime, libraries, and dependencies.
- **Container**: A running instance of an image. It provides isolation and executes the image contents.

### 2. What happens to data inside a container when you remove it?
All data stored inside the container is lost unless it is persisted using a volume.

### 3. How do two containers on the same custom network communicate?
Containers on the same custom network can use each other's container names as hostnames, so they do not need to rely on changing IP addresses.

### 4. What does `docker compose down -v` do differently from `docker compose down`?
- `docker compose down` stops and removes containers and networks, but preserves named volumes.
- `docker compose down -v` also removes named volumes, deleting persisted data.

### 5. Why are multi-stage builds useful?
Multi-stage builds reduce final image size and improve security by copying only the artifacts needed to run the application.

### 6. What is the difference between `COPY` and `ADD`?
- `COPY` copies local files and folders from the build context into the image.
- `ADD` can also download remote URLs and auto-extract local `.tar` archives, so it has extra behavior.

Use `COPY` unless you specifically need `ADD`.

### 7. What does `-p 8080:80` mean?
It maps port `8080` on the host to port `80` inside the container. Host traffic to `localhost:8080` is forwarded to the container's port `80`.

### 8. How do you check how much disk space Docker is using?
Run:

```bash
docker system df
```

Example output:

```text
TYPE            TOTAL     ACTIVE    SIZE      RECLAIMABLE
Images          1         1         276.1MB   0B (0%)
Containers      1         1         4.096kB   0B (0%)
Local Volumes   9         0         1.329GB   1.329GB (100%)
Build Cache     63        0         315.1MB   210.7MB
```

To clean unused resources, use:

```bash
docker system prune
```

| Feature | `COPY` | `ADD` |
| :--- | :---: | :---: |
| Copy local files/folders | Yes | Yes |
| Download from remote URLs | No | Yes |
| Auto-extract local `.tar` archives | No | Yes |
| Official recommendation | Preferred | Use only when necessary |