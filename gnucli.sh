#!/bin/bash

gnutls-cli localhost -d 9 -p 4433 --no-ca-verification --insecure
