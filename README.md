This plugin contains portable [Python 3.8 AppImage](https://github.com/niess/python-appimage/releases) which can be used on host without python.

## Install
From xxh repo:
```
xxh +I xxh-plugin-prerun-python
```
From any repo:
```
xxh +I xxh-plugin-prerun-python+git+https://github.com/xxh/xxh-plugin-prerun-python
```    
Connect:
```
xxh myhost +if
```
## Usage
```
myhost> which python
/home/ubuntu/.xxh/.xxh/plugins/xxh-plugin-prerun-python/build/python/python

myhost> python
Python 3.8.2 
>>>
```
### [PyPi](https://pypi.org/) 
```
myhost> pip install pandas
myhost> python 
>>> import pandas
myhost> echo $PIP_TARGET
/home/ubuntu/.xxh/.pip
```
