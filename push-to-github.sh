#!/bin/bash
cd `dirname $0`
rm `find . -name \*~ -type f | grep -v ./.git` 
t=/tmp/push2github$$.txt
find . -type f |grep -v ./.git |grep -v ./dependencies > $t
ls ./dependencies/*{.tar.gz,.sh} >> $t 
git remote add origin git@github.com:NumCracker/core.git
git add `cat $t`
rm $t
git commit -m 'some stuff'
git push -u origin master
