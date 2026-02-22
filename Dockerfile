FROM nginx:stable-alpine-slim@sha256:a00b591ab482fcfcc4a971a5efd04ebdbb6f9fe8ffe95dec9009019b8c0582e8

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

# Set entrypoint and command.
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
