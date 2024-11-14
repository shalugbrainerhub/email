# Use an official Ubuntu base image
FROM ubuntu:20.04

# Install Postfix and required utilities
RUN sudo apt-get update && sudo apt-get install -y \
    postfix \
    mailutils \
    && apt-get clean

# Set up Postfix configuration
COPY main.cf /etc/postfix/main.cf

# Expose port 25 for SMTP
EXPOSE 25

# Start Postfix when the container starts
CMD ["postfix", "start-fg"]
