#!/bin/bash

# Exit Codes:
# 0 ... Ok

cd `dirname $0` 

source entrypoint.env

# if db directory does not exists it is the initial/first installation
if [ ! -d $PDIR/$PROJ/db ] # if db does not exists, create it
then
  # create directories
  for dir in bin colorDB config data db dplist help images log msg panels pictures scripts source
  do
    mkdir -p $PDIR/$PROJ/$dir
  done

  # config settings
  envsubst < /files/config > $PDIR/$PROJ/config/config
  envsubst < /files/progs > $PDIR/$PROJ/config/progs

  # langs
  for lang in `echo $LANGS`; do
    echo "langs = \"$lang\"" >> $PDIR/$PROJ/config/config
  done

  # example dplist
  cp /files/*.dpl $PDIR/$PROJ/dplist
  ls $PDIR/$PROJ/dplist/*.dpl > $PDIR/$PROJ/dplist/dplist.lst

  # certificates for proxy
  cp $WINCCOA_HOME/config/*.pem $PDIR/$PROJ/config

  # register project
  WCCILpmon -autoreg -config $PDIR/$PROJ/config/config -status

  # create database
  WCCOAtoolCreateDb -config $PDIR/$PROJ/config/config -system 1 $PROJ -yes -importAscii dplist/dplist.lst
fi 


# start mqtt server 
if [ $URL == "tcp://localhost" ]
then 
  mosquitto &
fi

# start wincc oa project
WCCILpmon -config $PDIR/$PROJ/config/config
