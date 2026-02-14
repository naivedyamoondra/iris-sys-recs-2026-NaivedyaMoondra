# Bonus Task 1: CI/CD Pipeline using GitHub Actions

## Objective
Automate the process of building and publishing the Docker image to Docker Hub using GitHub Actions.

## Overview
A GitHub Actions workflow was implemented to automatically:
* Build the Docker image for the application
* Authenticate securely with Docker Hub
* Push the built image to Docker Hub
* Trigger on pushes to all branches

This ensures automated container image delivery and continuous integration.

## Workflow Location
The workflow file is located at:
`.github/workflows/docker-build.yml`

## Workflow Configuration
The pipeline performs the following steps:
1. Checks out the repository source code.
2. Logs in to Docker Hub using repository secrets.
3. Builds the Docker image using the project's Dockerfile.
4. Pushes the image to Docker Hub with the `latest` tag.

## GitHub Secrets Configuration
The following secrets were configured in the repository settings:
* **DOCKER_USERNAME** – Docker Hub username
* **DOCKER_PASSWORD** – Docker Hub access token

These credentials are securely stored in GitHub and are not exposed in the repository.

## Trigger Configuration
The workflow is configured to run automatically on push events to all branches using:

