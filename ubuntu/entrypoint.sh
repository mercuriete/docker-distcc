#!/bin/bash
if [ -z "$NETWORK" ]; then 
    net=10.0.0.1/16
else
    net=$NETWORK
fi

distccd --allow=$net --daemon --verbose --no-detach $append_params
