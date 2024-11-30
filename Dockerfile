# Ubuntu Base Image
FROM ubuntu:22.04

# Update the package manager
RUN apt-get update

# Install apache
RUN apt-get install -y apache2

# Copy the index.html to /var/www/html/
COPY index.html /var/www/html/

#Port
EXPOSE 80
# Running Apache foreground
CMD ["apachectl", "-D", "FOREGROUND"]
