#!/bin/bash
cd dependencies/nginx
./configure --add-module=../../src --add-module=../ndk \
  && make \
  && echo Success


