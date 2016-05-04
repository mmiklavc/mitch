#!/bin/bash

pushd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" > /dev/null

if [ -n "$1" ]
then
    oozie job -oozie http://sid-jpmc-1-4.openstacklocal:11000/oozie -info $1
else
    oozie jobs -oozie http://sid-jpmc-1-4.openstacklocal:11000/oozie -jobtype coordinator
fi

# primary http://sid-jpmc-2-4.openstacklocal:11000/oozie

popd > /dev/null

