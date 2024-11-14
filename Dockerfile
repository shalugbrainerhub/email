# Use an official Ubuntu base image
FROM ubuntu:20.04

# Set the environment variables to avoid any interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    postfix \
    mailutils \
    && apt-get clean

# Expose the necessary port for Postfix (SMTP)
EXPOSE 25

# Start Postfix when the container runs
CMD ["postfix", "start-fg"]
