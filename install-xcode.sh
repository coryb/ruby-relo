#!/bin/bash

set -x

# See http://apple.stackexchange.com/questions/107307/how-can-i-install-the-command-line-tools-completely-from-the-command-line

# Only run if the tools are not installed yet
# To check that try to print the SDK path
xcode-select -p
#&> /dev/null
#if [ $? -ne 0 ]; then
    touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
    osver=$(sw_vers -productVersion | awk -F'.' '{print $1"."$2}')
    PROD=$(softwareupdate -l |
                  grep "\*.*Command Line" |
                  grep $osver |
                  tail -n 1 | awk -F"*" '{print $2}' |
                  sed -e 's/^ *//' |
                  tr -d '\n')
    softwareupdate -i "$PROD" --verbose;
#fi
