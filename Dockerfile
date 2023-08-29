# Use the Ubuntu latest image as the base
FROM ubuntu:latest

# Set environment variable VERSION
ENV VERSION=1.2.0

# Update package list and install required packages
RUN apt-get update && apt-get install -y python3 zip unzip vim

#RUN pip install s

# Copy zip_job.py into the image's /tmp folder
COPY . /tmp

CMD python3 /tmp/zip_job.py

# Run a command upon container creation
CMD python3  /tmp/print_info.py
