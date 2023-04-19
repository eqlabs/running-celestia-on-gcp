echo "Installing celestia-node..."

version=v0.8.2 
cd $HOME 
rm -rf celestia-node 
git clone https://github.com/celestiaorg/celestia-node.git 
cd celestia-node/ 
git checkout tags/$version
make build 
make install 
make cel-key 

echo "celestia-node version $version installed successfully!"
