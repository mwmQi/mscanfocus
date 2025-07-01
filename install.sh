#!/bin/bash

PREFIX="/data/data/com.termux/files/usr"

mkdir -p $PREFIX/bin
cp bin/mscanfocus $PREFIX/bin
chmod +x $PREFIX/bin/mscanfocus

pip install -r requirements.txt

echo "mscanfocus has been installed. You can now run it by typing 'mscanfocus' in your terminal."
