#!/bin/bash

from='/usr/lib/x86_64-linux-gnu/liboocairo.so.0.0.0'
to='/usr/local/lib/lua/5.1/oocairo.so'

echo sudo mkdir -p `dirname $to` '&&'
echo sudo ln -s $from $to

