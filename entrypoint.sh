#!/bin/bash
cp /dev/null config/nethack4.conf
echo "dbhost=${DBHOST}" >> config/nethack4.conf
echo "dbport=${DBPORT}" >> config/nethack4.conf
echo "dbuser=${DBUSER}" >> config/nethack4.conf
echo "dbpass=${DBPASS}" >> config/nethack4.conf
echo "dbname=${DBNAME}" >> config/nethack4.conf
exec inetd -id