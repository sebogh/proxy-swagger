FROM nginx:stable-alpine@sha256:d2c11a1e63f200585d8225996fd666436277a54e8c0ba728fa9afff28f075bd7

ENV API_URL=http://localhost:8080

# Remove default Nginx configuration.
RUN rm /etc/nginx/conf.d/default.conf

# Copy Swagger UI static files.
COPY swagger/ /usr/share/nginx/html/

# Overwrite the Swagger initializer.
COPY swagger-initializer.js /usr/share/nginx/html/

# Copy Nginx config template. 
COPY nginx-default.conf.template /etc/nginx/conf.d/default.conf.template

# Copy Custom entry point.
COPY docker-entrypoint.sh /

# Set entrypoint and command.
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
