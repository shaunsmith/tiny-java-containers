# Download musl
wget http://more.musl.cc/10/x86_64-linux-musl/x86_64-linux-musl-native.tgz
tar -xzf x86_64-linux-musl-native.tgz
export TOOLCHAIN_DIR=`pwd`/x86_64-linux-musl-native
export CC=${TOOLCHAIN_DIR}/bin/gcc

# Download, build, install zlib into TOOLCHAIN_DIR
wget https://zlib.net/zlib-1.2.12.tar.gz
tar -xzf zlib-1.2.12.tar.gz
cd zlib-1.2.12
./configure --prefix=${TOOLCHAIN_DIR} --static
make
make install

# Add TOOLCHAIN_DIR to PATH
export PATH=${TOOLCHAIN_DIR}/bin:${PATH}