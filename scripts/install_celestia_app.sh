echo "Installing celestia-appd..."

cd $HOME 
rm -rf celestia-app 
git clone https://github.com/celestiaorg/celestia-app.git 
cd celestia-app/ 
APP_VERSION=v0.12.2 
git checkout tags/$APP_VERSION -b $APP_VERSION 
make install 

echo "celestia-appd install done. Version: $APP_VERSION"
