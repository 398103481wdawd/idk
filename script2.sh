echo "FROM debian:12

# Update package lists
RUN apt-get update

# Install systemd and systemd-sysv, and set root password
RUN apt-get install -y systemd systemd-sysv

# Set the root password
RUN useradd efe && usermod -aG sudo efe && echo "efe:efe" | chpasswd 

# Set environment variable to indicate running in Docker
ENV container=docker

# Define the command to run when the container starts
CMD [\"/sbin/init\"]

# Expose SSH and your application port
EXPOSE 22 8006

# Define volumes (these need to be mounted at runtime with docker run -v)
VOLUME /sys/fs/cgroup
VOLUME /proc
VOLUME /dev
VOLUME /run/systemd" > Dockerfile
