FROM ubuntu:18.04
LABEL maintainer="ddddiegolima@gmail.com"


# Instalando dependências com o apt-get
RUN apt-get update && \
    apt-get install -y python3 git curl nano build-essential && \
    apt-get clean

# Instalando o Go
RUN cd /opt && \
    curl -O https://dl.google.com/go/go1.13.3.linux-amd64.tar.gz && \
    tar -xvf go1.13.3.linux-amd64.tar.gz && \
    rm *.gz && \
    cd ~ && \
    mkdir work && \
    echo "# CONFIGS DO GO" >> .bashrc && \
    echo "export GOPATH=$HOME/work" >> .bashrc && \
    echo "export PATH=$PATH:/opt/go/bin:$GOPATH/bin" >> .bashrc

# Instalando o geth
RUN cd /opt && \
    git clone https://github.com/ethereum/go-ethereum && \
    cd go-ethereum && \
    git checkout tags/v1.8.27 && \
    make geth && \
    echo "# EXECUTAVEL GETH" >> .bashrc && \
    echo 'export PATH=$PATH:/opt/go-ethereum/build/bin' >> .bashrc

# Rodando o cliente
ENTRYPOINT ["geth"]

# Instalando o solc
# RUN cd /opt && \
#     git clone https://github.com/ethereum/solidity && \
#     cd solidity && \
#     git checkout tags/v0.4.22 && \
#     # a linha abaixo remove os sudo's do arquivo pra poder rodar no container
#     sed 's/sudo //g' scripts/install_deps.sh | bash  && \
#     mkdir build && \
#     cd build && \
#     cmake .. && make && \
#     echo "# EXECUTAVEL SOLC" >> .bashrc && \
#     echo 'export PATH=$PATH:/opt/solidity/build/solc' >> .bashrc

# Instalando o Solceasy
# RUN cd /opt && \
#     git clone https://github.com/diego-lima/solceasy
