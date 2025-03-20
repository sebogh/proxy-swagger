VERSION := $(shell cat version)
SWAGGER_VERSION := v5.20.1

.PHONY: build
build: swagger
	docker build \
	-t sebodockerhub/proxy-swagger:latest \
	-t sebodockerhub/proxy-swagger:${VERSION} \
	.

.PHONY: publish
publish:
	docker push sebodockerhub/proxy-swagger:latest
	docker push sebodockerhub/proxy-swagger:${VERSION}

swagger:
	git clone --depth 1 --branch ${SWAGGER_VERSION} https://github.com/swagger-api/swagger-ui.git
	cp -r swagger-ui/dist ./swagger
	rm -Rf swagger-ui
