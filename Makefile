BASE:=alpine
TAG:=test

build:
	docker build -t ${TAG} --build-arg BUILD_FROM=$BASE -f ${PLUGIN}/Dockerfile .