#!/bin/sh

javac Hello.java
native-image --static --libc=musl -o hello.static Hello
docker build . -f Dockerfile.static -t hello:static
rm -f hello.upx
upx --lzma --best -o hello.upx hello.static
docker build . -f Dockerfile.upx -t hello:upx

echo "Generated Executables"
ls -lh hello.static hello.upx

echo "Generated Docker Container Images"
docker images hello


