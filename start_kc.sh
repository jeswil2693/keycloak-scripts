#!/bin/bash

source ~/.bash_profile

#Check if KC is already running
OLD_PID=$(ps -ef |grep "\borg.jboss.as.standalone\b" |awk '{print $2}')
if [ -z "$OLD_PID" ]; then

  cd $KC10_HOME/scripts

  #Cleanup old logs
  rm -rf kc_run_log.log

  #Starting ES and redirecting logs
  nohup $KC10_HOME/bin/standalone.sh > kc_run_log.log 2>&1 &

  echo "Starting KC locally"

  while [ -z "$PID" ]
  do
    PID=$(ps -ef |grep "\borg.jboss.as.standalone\b" |awk '{print $2}')
  done

  echo "Started KC with PID = $PID"
else
  echo "KC is already running on PID = $OLD_PID"
fi
