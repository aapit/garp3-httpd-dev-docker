FROM grrrnl/garp3-httpd:3.9
MAINTAINER David Spreekmeester <david@grrr.nl>

RUN \
    # Install Fish shell for Debian 8.x
    apt-key adv --keyserver keyserver.ubuntu.com --recv-key D880C8E4 && \
    echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_8.0/ ./' \
        > /etc/apt/sources.list.d/fish-shell.list && \
    apt -y update && \
    apt -y install fish && \

    # Basics
    apt -y install git vim && \

    # LibSSH2 and SSH client, for content syncing
    apt -y install libssh2-1 libssh2-1-dev openssh-client && \
    yes | pecl install ssh2 && \
    docker-php-ext-enable ssh2 && \

    # Install general MySQL client for easy access to db container
    apt -y install mysql-client && \

    # Install Node 6.x & NPM
    wget -qO- https://deb.nodesource.com/setup_6.x | bash - && \
    apt -y install nodejs && \

    # Install ruby gems
    apt -y install ruby rubygems-integration && \
    gem install scss-lint && \
    gem install semver && \

    npm i -g gulp && \
    npm i -g bower && \
    npm i -g jshint && \

    # Deploy tools
    gem install capistrano && \

    # Install python package manager
    apt -y install python python-pip && \

    # Install aws cli tool
    pip install awscli
EXPOSE 80
