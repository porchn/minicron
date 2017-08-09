FROM phusion/baseimage:0.9.16
MAINTAINER James White <dev.jameswhite+minicron@gmail.com>

RUN rm -f /etc/service/sshd/down
# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Install minicron install dependencies
RUN apt-get update && apt-get install -y curl unzip

# Install minicron
ADD install.sh /
RUN chmod +x /install.sh
RUN /install.sh
