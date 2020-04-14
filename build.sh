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
curl -o python3.8 -L https://github.com/niess/python-appimage/releases/download/python3.8/python3.8.2-cp38-cp38-manylinux2010_x86_64.AppImage
chmod +x python3.8
ln -s python3.8 python
ln -s python3.8 python3

cp ../../pip .
ln -s pip pip3

