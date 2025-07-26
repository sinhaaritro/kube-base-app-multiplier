# Use a specific, fully-qualified Deno base image to avoid registry errors
FROM docker.io/denoland/deno:1.37.1

# Set the working directory inside the container
WORKDIR /app

# Copy all local files (main.ts, index.html) into the container's working directory
COPY . .

# Optimization: Cache the Deno dependencies during the build process
RUN deno cache main.ts

# Expose the port the Deno app listens on
EXPOSE 8000

# The command to run the application, with necessary permissions
CMD ["deno", "run", "--allow-net", "--allow-read", "--allow-env", "main.ts"]