# Use the official Amazon Linux 2 image as the base
FROM amazonlinux:2

# Install Postfix, mailx, and other dependencies
RUN yum update -y && \
    yum install -y postfix mailx && \
    yum clean all

# Expose SMTP ports (25 for sending, 587 for submission, 465 for SSL)
EXPOSE 25 587 465

# Copy custom Postfix configuration files
COPY ./postfix/main.cf /etc/postfix/main.cf

# Set Postfix as the default mail server
CMD ["postfix", "start-fg"]
