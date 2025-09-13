#!/usr/bin/python

import socket

ip = input("Enter the IP: ")

for port in range(1,65535):
	mysocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	mysocket.settimeout(1)
	response = mysocket.connect_ex((ip,port))

	if (response == 0):
		print("%d - Port Open" %port)
		mysocket.close()

