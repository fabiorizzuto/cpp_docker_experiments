# Command to build image
#  docker build --rm -f "Dockerfile" -t testcmake:latest .
# Command to run container in interactive mode
#  docker run --rm -it testcmake:latest

# Get the GCC preinstalled image from Docker Hub
FROM ubuntu

RUN apt-get update && apt-get install -y gcc \
  cmake \
  build-essential \
  g++

# Copy the current folder which contains C++ source code to the Docker image under /usr/src
COPY . /usr/src/TestCMake

# Specify the working directory
WORKDIR /usr/src/TestCMake/build

# Use GCC to compile the Test.cpp source file
RUN rm -r * && \
  cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=Debug .. && \
  make -j 8

# Run the program output from the previous step
CMD ["./testcmake"]
