#!/bin/bash

openssl s_server -port 4449 -key key.pem -cert cert.pem -cipher ECDHE-RSA-AES128-GCM-SHA256 -msg -debug -named_curve prime256v1 #-ciphersuites ECDHE-RSA-AES128-GCM-SHA256

#openssl ecparam -list_curves
#openssl ciphers
