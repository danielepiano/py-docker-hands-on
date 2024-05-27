# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the workdir
WORKDIR ascii-image-converter

# Var to host source image filename
ARG SOURCE
ENV SOURCE=$SOURCE

# Copy the requirements
COPY requirements.txt ./
# Install the required packages (pip)
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the Python script
COPY ascii_image_converter.py $SOURCE ./

# Define the command to run the script
ENTRYPOINT python3 ascii_image_converter.py --file $SOURCE

# docker build -t danielepiano/ascii-image-converter --build-arg SOURCE=test2.jpg .
# docker run --rm -v $(pwd):/usr/src/ascii-image-converter danielepiano/ascii-image-converter