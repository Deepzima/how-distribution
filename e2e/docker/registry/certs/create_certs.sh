#!/bin/bash

# Make directory
mkdir -p certs

# Gen priv key
openssl genrsa -out certs/privkey.pem 2048

# Gen self-sign cert
openssl req -new -x509 -key certs/privkey.pem -out certs/fullchain.pem -days 365 \
    -subj "/C=US/ST=California/L=San Francisco/O=MyCompany/OU=IT/CN=localhost"
