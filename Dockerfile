# Use the jenkins/agent  image as the base
FROM jenkins/agent

# Set environment variable VERSION
ENV VERSION=1.2.0

# switch to user root
USER root

# Update package list and install required packages
RUN apt update && apt install -y \
    python3 \
    zip \
    unzip \
    vim

# Copy zip_job.py into the image's /tmp folder
COPY ./app /tmp

# Run commands upon container creation
CMD python3 /tmp/print_info.py
