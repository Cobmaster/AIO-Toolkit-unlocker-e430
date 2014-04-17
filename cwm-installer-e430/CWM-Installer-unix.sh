#!/bin/bash

sleep 3s

if [[ "$OSTYPE" == "linux-gnu" ]]; then
        cd Files && sudo chmod +x linux.sh && ./linux.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
        cd Files && sudo chmod +x mac.sh && ./mac.sh
else
        echo "unknown OS" && exit
fi
