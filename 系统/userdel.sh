#! /bin/bash

guest_users=$(cat /etc/passwd | grep guest | cut -d : -f 1)

for guest in $guest_users; do
	userdel $guest
done
