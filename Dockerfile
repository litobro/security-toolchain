FROM parrotsec/security

RUN apt update && apt upgrade -y

# I use a separate layer so I can marginally improve build times
RUN apt-get install -y openvpn seclists netcat vim \
    	exploitdb telnet feroxbuster hydra screen \
	python3-pip dnsrecon enum4linux gobuster \
	impacket-scripts nbtscan nikto nmap onesixtyone \
	oscanner redis-tools smbclient smbmap \
	sslscan tnscmd10g whatweb wkhtmltopdf ftp \
	squid

# AutoRecon Install
RUN git clone https://github.com/Tib3rius/AutoRecon /opt/AutoRecon && \
	/usr/bin/pip3 install -r /opt/AutoRecon/requirements.txt && \
	chmod +x /opt/AutoRecon/autorecon.py

RUN useradd -ms /bin/bash tdang
RUN adduser tdang sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER tdang
WORKDIR /home/tdang

RUN echo "shell /bin/bash" >> /home/tdang/.screenrc
