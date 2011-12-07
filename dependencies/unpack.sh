#!/bin/bash
rm -rf success.flag ndk avro nginx tzdata tzcode sqlite
p=`pwd`
for i in *gz *zip
do 
   case $i in 
      tzcode*) mkdir tzcode;cd tzcode; tar xfz ../$i;;
      tzdata*) mkdir tzdata;cd tzdata; tar xfz ../$i;;
      *.zip) unzip $i;;
      *) tar xfz $i;;
   esac
   cd $p
done
for i in `find . -type d -maxdepth 1 -mindepth 1`
do
    case $i in 
	./avro*) mv $i avro;cd avro;mkdir build;cd build;(cmake .. && make && make test) || exit -1;;
	./sqlite*) mv $i sqlite; cd sqlite; (./configure && make ) || exit -1;;
	./simpl-ngx_devel_kit*) mv $i ndk;;
	./nginx*) mv $i nginx; cd nginx; (./configure && make ) || exit -1;;
    esac
    cd $p
done
echo Success
touch success.flag
exit 0