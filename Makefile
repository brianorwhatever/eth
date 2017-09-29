IMAGENAME=brian-ethereum-network

all:

build:
	docker build -t $(IMAGENAME) .

run:
	docker run -it -v ~/Projects/eth/data:/code/data $(IMAGENAME) /bin/bash