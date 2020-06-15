#!/bin/bash

PID=$(ps -ef |grep "\borg.jboss.as.standalone\b" |awk '{print $2}')

if [ -z "$PID" ]; then
  echo "KC is not running"
else
  echo "KC running with PID = $PID"
fi

