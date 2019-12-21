#!/bin/sh

while [ ! -f "/bitcoin_monitor/up" ]; do echo "bitcoin not ready" ; sleep 10 ; done

<% if ( torifyables.indexOf('tor_lnnode') !== -1 ) { %>
while [ -z "${TORIP}" ]; do echo "tor not ready" ; TORIP=$(getent hosts tor | awk '{ print $1 }') ; sleep 10 ; done

echo "TOR ready at IP ${TORIP}"

lightningd --proxy=$TORIP:9050
<% } else { %>

lightningd

<% } %>