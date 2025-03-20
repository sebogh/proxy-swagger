FROM nginx@sha256:b05aceb5ec1844435cae920267ff9949887df5b88f70e11d8b2871651a596612

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
