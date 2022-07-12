#!/bin/sh
javac Hello.java
native-image --static --libc=musl Hello
cp hello hello.static
docker build . -f Dockerfile.static -t hello:static
upx --lzma --best hello
mv hello hello.upx
docker build . -f Dockerfile.upx -t hello:upx

echo "Generated Executables"
ls -lh hello.static hello.upx

echo "Generated Docker Container Images"
docker images hello


