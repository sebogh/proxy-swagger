FROM nginx:stable-alpine-slim@sha256:d9322bba63c6cfc63dc9e86522fd4f95fd4d9020a02b5bced282bbf38b8c3960

ENV API_URL=http://localhost:8080
ENV SWAGGER_PORT=3000

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

# Copy version file.
COPY version /

# Set entrypoint and command.
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
