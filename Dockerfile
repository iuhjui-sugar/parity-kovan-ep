FROM  amd64/ubuntu:16.04
# 更新系统
RUN  apt-get update
RUN  apt-get install -y wget libssl-dev 
#  安装节点
RUN      wget  https://parity-downloads-mirror.parity.io/stable-release/x86_64-unknown-linux-gnu/parity_1.9.7_ubuntu_amd64.deb
RUN      dpkg -i parity*.deb && rm parity*.deb
COPY   config.toml  /srv/config.toml
# 启动节点
VOLUME   /data
EXPOSE     8545
CMD ["parity", "-c", "/srv/config.toml"]
