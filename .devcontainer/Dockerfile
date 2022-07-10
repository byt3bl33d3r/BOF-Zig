FROM mcr.microsoft.com/vscode/devcontainers/base:debian

RUN apt-get update && apt install -y xz-utils build-essential binutils

RUN wget https://ziglang.org/builds/zig-linux-x86_64-0.10.0-dev.2950+b88151e0e.tar.xz -O ~/zig-linux.tar.xz \
    && mkdir ~/zig-linux \
    && tar -xf ~/zig-linux.tar.xz -C ~/zig-linux --strip-components 1

ENV PATH $PATH:/root/zig-linux