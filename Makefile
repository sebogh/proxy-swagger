VERSION := $(shell cat version)

build:
	rm -Rf ./swagger
	git clone --depth 1 --branch master https://github.com/swagger-api/swagger-ui.git  
	cp -r swagger-ui/dist ./swagger
	rm -Rf swagger-ui
	docker build \
	-t sebodockerhub/proxy-swagger:latest \
	-t sebodockerhub/proxy-swagger:${VERSION} \
	.

publish:
	docker push sebodockerhub/proxy-swagger:latest
	docker push sebodockerhub/proxy-swagger:${VERSION}

