# proxy-swagger

## Motivation

Swagger UI without CORS issues.

## Solution

Create a Docker image (derived from Nginx), which serves the Swagger UI and
proxies requests (e.g. for "Try Out") to the target service.

## Getting Started

````sh
make build
````

to create a `proxy-swagger` Docker image.

Then run like:

````sh
docker run --rm --network=host \
-v ${PWD}/openapi.yaml:/usr/share/nginx/html/openapi.yaml:ro \
--name proxy-swagger sebodockerhub/proxy-swagger
````

and surf to <http://localhost:3000>.

adapting `${PWD}/openapi.yaml` as needed.

## dockerhub

<https://hub.docker.com/repository/docker/sebodockerhub/proxy-swagger/general>

## ENV

### API_URL

One may override the URL of the API by setting the `API_URL` environment
variable (default `http://localhost:8080`). For example, using port `9090`
(instead of `8080`):

````sh
docker run --rm --network=host \
-v ${PWD}/openapi.yaml:/usr/share/nginx/html/openapi.yaml:ro \
-e "API_URL=http://localhost:9090" \
--name proxy-swagger sebodockerhub/proxy-swagger
````

Or targeting a remote service (https://httpbin.org):

````sh
docker run --rm --network=host \
-v ${PWD}/openapi.yaml:/usr/share/nginx/html/openapi.yaml:ro \
-e "API_URL=https://httpbin.org" \
--name proxy-swagger sebodockerhub/proxy-swagger
````

### SWAGGER_PORT

One may override the proxy- / Swagger-port by setting the `SWAGGER_PORT`
environment variable (default `3000`). For example, using port `4711`:

````sh
docker run --rm --network=host \
-v ${PWD}/openapi.yaml:/usr/share/nginx/html/openapi.yaml:ro \
-e "SWAGGER_PORT=4711" \
--name proxy-swagger sebodockerhub/proxy-swagger
````

