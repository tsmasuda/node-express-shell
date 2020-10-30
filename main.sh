#!/bin/bash

function handle_return_code() {
    if [ $1 -ne 0 ]; then
        echo "ERROR in [$2]"
        exit $1
    fi
    return $1
}

java -version
handle_return_code $? "java -version"

ant -version
handle_return_code $? "ant -version"

exit 8
