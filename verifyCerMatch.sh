#!/bin/bash

configFile=${1}

# setup the environment
function prop {
    grep -w "${1}" $configFile|cut -d'=' -f2
}

(openssl x509 -noout -modulus -in "$(prop 'fileName').pem" | openssl md5 ; \
    openssl rsa -noout -modulus -in "$(prop 'fileName').key" -passin "pass:$(prop 'keyPassword')" | openssl md5) | uniq