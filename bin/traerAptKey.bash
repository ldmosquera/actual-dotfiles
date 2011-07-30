#!/bin/bash

key=$1

gpg --keyserver pgpkeys.mit.edu --recv-key  $key  &&
gpg -a --export $key | sudo apt-key add -
