node-name=$1

echo "Setting up P2P network..."

cd $HOME
rm -rf networks
git clone https://github.com/celestiaorg/networks.git

celestia-appd init $1 --chain-id blockspacerace-0
cp $HOME/networks/blockspacerace/genesis.json $HOME/.celestia-app/config
PERSISTENT_PEERS=$(curl -sL https://raw.githubusercontent.com/celestiaorg/networks/master/blockspacerace/peers.txt | tr -d '\n')
echo $PERSISTENT_PEERS
sed -i.bak -e "s/^persistent_peers *=.*/persistent_peers = \"$PERSISTENT_PEERS\"/" $HOME/.celestia-app/config/config.toml

echo "P2P networks done"
