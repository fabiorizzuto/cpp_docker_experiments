# Get the GCC preinstalled image from Docker Hub
FROM ubuntu

RUN apt-get update && apt-get install -y gcc

# Copy the current folder which contains C++ source code to the Docker image under /usr/src
COPY . /usr/src/TestCMake

# Specify the working directory
WORKDIR /usr/src/TestCMake

# Use GCC to compile the Test.cpp source file
CMD cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=Debug ..
CMD make


# Run the program output from the previous step
CMD ["./build/testcmake"]