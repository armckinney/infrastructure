FROM ghcr.io/armckinney/terraform-azure:2.73.0

# set workspace directory
ARG WORKSPACE=/workspaces/infrastructure
ENV WORKSPACE=${WORKSPACE}

# avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir /tmp/container \
    && cd /tmp/container \
    # package registries
    && echo 'deb [trusted=yes] https://repo.goreleaser.com/apt/ /' | tee /etc/apt/sources.list.d/goreleaser.list \
    # supporting installs
    && apt update \
    # primary installs
    && apt-get install --no-install-recommends -y \
        goreleaser \
        make \
    # install verge
    && curl -sSL https://raw.githubusercontent.com/armckinney/verge/main/install.sh | bash \
    # cleanup
    && apt autoremove -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/container

WORKDIR ${WORKSPACE}

# switch back to dialog for any ad-hoc use of apt
ENV DEBIAN_FRONTEND=dialog
