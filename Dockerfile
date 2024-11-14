# Use the official Amazon Linux 3 image as base
FROM amazonlinux:2

# Install Postfix and required dependencies
RUN yum install -y postfix mailx

# Expose SMTP ports (25 for sending, 587 for submission, 465 for SSL)
EXPOSE 25 587 465

# Copy custom Postfix configuration files
COPY ./postfix/main.cf /etc/postfix/main.cf

# Set Postfix as the default mail server
CMD ["postfix", "start-fg"]
