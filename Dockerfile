# not pinning to a specific hash should be fine for our use case
# https://ubuntu.com/security/docker-images
# FROM public.ecr.aws/lts/ubuntu:20.04_stable
# https://hub.docker.com/_/ubuntu/ official image should do the job
FROM ubuntu:20.04

LABEL description="Container for automation purposes"
LABEL version="0.0.1"
LABEL authors="lnxu@k4cg"

ARG DEBIAN_FRONTEND="noninteractive"

# upgrade ALL the packages!! we just want the latest versions and don't care for specific version (at least for now)
# hadolint warning (https://github.com/hadolint/hadolint/wiki/DL3008) suppressed
RUN apt-get update \
  && apt-get install --no-install-recommends -y python3 python3-pip software-properties-common \
  && add-apt-repository --yes --update ppa:ansible/ansible \
  && apt-get install --no-install-recommends -y ansible \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && adduser --system --group automation \
  && install --group automation --owner automation -d /automation

WORKDIR /automation

USER automation

# TODO: install ansible collections, etc.
# COPY requirements.txt /ansible

CMD ["/bin/bash"]
