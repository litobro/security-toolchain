FROM parrotsec/security

RUN apt update && apt upgrade -y

# I use a separate layer so I can marginally improve build times
RUN mkdir work && \
    apt install -y openvpn seclists netcat vim \
    exploitdb telnet feroxbuster hydra

RUN useradd -ms /bin/bash tdang
RUN adduser tdang sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER tdang
WORKDIR /home/tdang

RUN mkdir connection
