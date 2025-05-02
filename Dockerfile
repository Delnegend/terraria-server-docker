FROM debian:12-slim AS base

LABEL maintainer="Delnegend <kien@delnegend.com>"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget \
    tmux \
    unzip \
    lib32gcc-s1 \
    lib32stdc++6 \
    ca-certificates \
    sudo && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/zsh terraria && \
    usermod -aG sudo terraria && \
    echo "terraria ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

WORKDIR /home/terraria

RUN wget https://terraria.org/api/download/pc-dedicated-server/terraria-server-1449.zip && \
    unzip terraria-server-1449.zip && \
    mv 1449/Linux server && \
    rm -rf 1449 terraria-server-1449.zip && \
    cd server && \
    chmod +x TerrariaServer.bin.x86_64 && \
    cd /home/terraria && \
    sudo chown -R terraria:terraria server
    
USER terraria

EXPOSE 7777/udp
EXPOSE 8080/tcp

ENTRYPOINT ["/home/terraria/server/TerrariaServer.bin.x86_64", "-config", "/home/terraria/server/serverconfig.txt"]