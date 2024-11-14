# Use Amazon Linux as the base image
FROM amazonlinux:latest

# Install Postfix
RUN yum update -y && \
    yum install -y postfix mailx && \
    yum clean all

# Expose the necessary port for Postfix (SMTP)
EXPOSE 25

# Start Postfix when the container runs
CMD ["postfix", "start-fg"]
