#!/bin/bash
cd `dirname $0`
rm `find . -name \*~ -type f | grep -v ./.git` 
git add `find . -type f |grep -v ./.git`
git commit -m 'some stuff'
git push -u origin master
