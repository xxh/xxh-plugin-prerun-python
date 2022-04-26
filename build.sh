#!/usr/bin/env bash

CDIR="$(cd "$(dirname "$0")" && pwd)"
build_dir=$CDIR/build

while getopts A:K:q option
do
  case "${option}"
  in
    q) QUIET=1;;
    A) ARCH=${OPTARG};;
    K) KERNEL=${OPTARG};;
  esac
done

rm -rf $build_dir
mkdir -p $build_dir

for f in *prerun.sh
do
    cp $CDIR/$f $build_dir/
done

cd $build_dir
mkdir -p python
cd python
release_url="https://api.github.com/repos/niess/python-appimage/releases/tags/python3.8"
download_url=`curl -s "$release_url" | grep "browser_download_url" | grep -wo 'https.*manylinux2010_x86_64[^"]*' | head -n 1`
curl -s -o python3.8 -L "$download_url"
chmod +x python3.8
ln -s python3.8 python
ln -s python3.8 python3

cp ../../pip .
ln -s pip pip3

