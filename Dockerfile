FROM debian:sid-slim
LABEL maintainer "Jessie Frazelle <jess@linux.com>"

ENV	PKGS=audacity \
	DEBIAN_FRONTEND=noninteractive

RUN	apt-get update -yq && \
	apt-get install -yq --no-install-recommends ${PKGS} && \
	apt-get autoremove -yq && apt-get autoclean && \
	rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "audacity" ]
