#!/bin/bash

if ! $(ps -e | grep -q ibus-daemon)
then
	ibus-daemon --daemonize --replace
fi

current_engine=$(ibus engine)

if [ "$current_engine" == "Bamboo" ]
then
	ibus engine BambooUs
else
	ibus engine Bamboo
fi

