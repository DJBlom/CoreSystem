# Image that will be used
FROM fedora:36

# Shell that will be used
SHELL ["/bin/bash", "-c"]

ENV USER odin

# Setting up the user environment
RUN groupadd --gid=1002 ${USER} && \ 
    useradd --uid=1001 --gid=${USER} --create-home ${USER} && \
    echo "odin ALL=NOPASSWD : ALL" >> /etc/sudoers && \
    sudo -u ${USER} mkdir /home/${USER}/project && \
    sudo -u ${USER} mkdir /home/${USER}/bin && \
    sudo -u ${USER} mkdir -p /home/${USER}/.local/bin

WORKDIR /home/${USER}/project
COPY . .


# Installing all development dependencies
RUN dnf -y install docker-compose \
    python3 libxcrypt-compat \
    curl gcc gcc-c++ \
    make cmake autoconf \
    automake git libtool \
    dh-autoreconf lcov \
    arm-none-eabi-gcc-cs \
    arm-none-eabi-gcc-cs-c++ \
    cppcheck 


# Getting CppUTest from github
WORKDIR /home/${USER}
RUN git clone https://github.com/cpputest/cpputest.git

# Setting up CppUTest 
WORKDIR /home/${USER}/cpputest
RUN autoreconf --install
RUN ./configure
RUN make tdd
ENV CPPUTEST_HOME=/home/${USER}/cpputest

# Providing system information like adding things to the path and setting up the language to be used
ENV PATH=/home/${USER}/bin:$PATH \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=C.UTF-8


# Finnishing off by setting the user and changing into the project directory
ENV HOME /home/${USER}
USER ${USER}
WORKDIR /home/${USER}/project
