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
```

Packages location comply with [hermetic principle](https://github.com/xxh/xxh/wiki#the-ideas-behind-xxh) and the same as used in [xxh-shell-xonsh](https://github.com/xxh/xxh-shell-xonsh):

| xxh command | pip packages home | user home |
| ------- | ---------- | --------- |
| `xxh myhost +s bash-zero` | `/home/user/.xxh/.local` | `/home/user/.xxh` |
| `xxh myhost +s bash-zero +hhh '~'` | `/home/user/.xxh/.local` | `/home/user` | 
| `xxh myhost +s bash-zero +hhh '~' +hhx '~'` | `/home/user/.local` | `/home/user` |

## Examples 
### Usage xxh python with xxh sudo to run http server with API
```bash
xxh +RI xxh-plugin-prerun-sudo xxh-plugin-prerun-python
xxh myhost +s zsh +if

myhost> pip install fastapi uvicorn && mkdir api && cd api
myhost> echo -e 'from fastapi import FastAPI; app = FastAPI()\n@app.get("/")\ndef read_root():\n return {"xxh": "https://github.com/xxh/xxh"}' > main.py 
myhost> xxh-sudo uvicorn main:app --reload --host 0.0.0.0 --port 80                                                     
INFO: Uvicorn running on http://0.0.0.0:80 (Press CTRL+C to quit)
```
```
$ curl http://myhost/                                                                                       
{"xxh":"https://github.com/xxh/xxh"}
```
