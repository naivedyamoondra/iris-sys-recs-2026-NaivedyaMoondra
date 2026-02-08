# Task 1: Pack the Rails application in a Docker container image.

### Process followed:
* Cloned the repository into my local machine and reviewed the structure of the project and its dependencies.
* Created a Dockerfile by using an official Ruby image from Docker Hub which matches the project’s Ruby version.
* Installed required system dependencies and Ruby gems inside the container.
* Resolved dependency conflicts by removing incompatible manual version pinning of Rails internal gems, allowing Rails to manage them correctly.
* Configured the container such that it starts the Rails server.
* Built the Docker image successfully and verified that the application starts inside the container.

### Verification
* Docker image builds successfully, using the `docker build` command.
* Rails server starts correctly, without any errors inside the container.

### Outcome:
The Rails application was successfully packed and containerized using Docker, completing this task.
