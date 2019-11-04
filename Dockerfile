FROM ethereum/client-go:v1.8.27
LABEL maintainer="ddddiegolima@gmail.com"

#
## Variáveis de ambiente
#

# O ip externo sob o qual o cliente será acessível para outros clientes
# ESSE É OBRIGATÓRIO!
ENV extip 127.0.0.1
# O "nome" do nó
ENV identity no_ethereum
# O diretório base do cliente
ENV datadir /root/workshop_blockchain_navi/rede
# O id da rede que vamos construir
ENV networkid 621
# A forma de sincronização com os outros nós da rede
ENV syncmode full
# O ip sob o qual o cliente será acessível para chamadas remotas (HTTP ou Websocket)
ENV rpcaddr 0.0.0.0

# Instalando dependências
RUN apk add git

# Montando a rede interna
RUN cd ~ && \
    git clone https://github.com/diego-lima/workshop_blockchain_navi && \
    cd workshop_blockchain_navi/rede && \
    geth --datadir . init genesis.json

ENTRYPOINT geth --datadir $datadir \
    --networkid=$networkid --nat extip:$extip --syncmode $syncmode \
    --rpc --rpcaddr $rpcaddr --rpccorsdomain "*" \
    --wsaddr $rpcaddr --wsorigins "*" \
    --identity $identity