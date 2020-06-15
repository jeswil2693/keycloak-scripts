#!/bin/bash

OLD_PID=$(ps -ef |grep "\borg.jboss.as.standalone\b" |awk '{print $2}')
if [[ ! -z "$OLD_PID" ]]; then
  #Kill KC if already running
  echo "Stopping KC with PID = $OLD_PID"
  kill $OLD_PID
  sleep 1s
  while [[ ! -z "$OLD_PID" ]]
  do
    OLD_PID=$(ps -ef |grep "\borg.jboss.as.standalone\b" |awk '{print $2}')
  done

  echo "Stopped KC successfully"
else
  echo "KC is not running"
fi

