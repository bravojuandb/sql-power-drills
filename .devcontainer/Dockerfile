# Use official Debian image as base
FROM mcr.microsoft.com/devcontainers/base:debian

# Install PostgreSQL
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
  && apt-get install -y postgresql postgresql-contrib

# Expose PostgreSQL default port (optional for remote access)
EXPOSE 5432
