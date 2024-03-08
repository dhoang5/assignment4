# Use the Fedora base image
FROM fedora:latest

# Run system upgrade
RUN dnf -y upgrade

# Install required applications
RUN dnf -y install tuxpaint vim httpd

# Add myinfo.html to the /var/www/html/ location
COPY myinfo.html /var/www/html/

# Create a directory for httpd to store logs
RUN mkdir /var/log/httpd

# Expose port 80/tcp
EXPOSE 80

# Enable httpd service
ENTRYPOINT /usr/sbin/httpd -DFOREGROUND
