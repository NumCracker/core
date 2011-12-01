#!/bin/bash

for i in *gz
do 
    d=`echo $i|sed s/.tar.gz//`;
    rm -rf $d
    tar xfz $i
    cd $d
      if [ -e ./configure ] ; then
	 (./configure && make && make test ) || exit -1
      else
         mkdir build
	 cd build
	 (cmake .. && make && make test) || exit -1
	 cd ..
      fi
    cd ..
done 
echo Success
exit 0