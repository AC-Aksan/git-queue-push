#!/bin/bash

#!/bin/bash

# Get Origin URL and validate
TARGETRAW=$(git remote get-url origin)
if [ -z "$TARGETRAW" ]
then
    echo "error: remote not found"
    exit 1
fi
# echo $TARGETRAW
MARK1=$(expr index "$TARGETRAW" '@')
if [ $MARK1 -eq 0 ]
then
    echo "error: ssh remote not found, update origin"
    exit 1
fi
# echo $MARK1
MARK2=$(expr index "$TARGETRAW" ':')
# echo $MARK2
TARGET=${TARGETRAW:$MARK1:$MARK2-$MARK1-1}

# echo $TARGET

nohup ./git-queue-push-sleeper.sh "$TARGET"  >> queue-push.log 2>> queue-push.log &