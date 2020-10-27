#!/bin/bash 
# shellcheck disable=SC2046
test $(curl localhost:8080/sum?a=1\&b=2) = 3
