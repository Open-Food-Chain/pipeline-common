#!/bin/sh

ipRegex="[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"

mailServerIP=$(ping $MAILSERVER_HOSTNAME -c 1 | grep PING | awk '{print $3}' | sed 's/.*(\(.*\)).*/\1/')

if ! echo $mailServerIP | grep -qE "$ipRegex" ; then
	echo "Unable to extract mail server IP from host provided ($MAILSERVER_HOSTNAME)" 1>&2
	exit 1
fi

echo "$mailServerIP  $MAILSERVER_DOMAIN" >> /etc/hosts

exit 0
