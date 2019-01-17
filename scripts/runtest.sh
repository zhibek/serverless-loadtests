#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

if [ -z "$1" ]; then
    echo "Please ensure a 'scenario' group is specified as an argument - runtest.sh <scenario>"
    exit 1
fi
SCENARIO_GROUP="$1"

if [ -z "$2" ]; then
    SCENARIO_SCRIPT="script"
else
    SCENARIO_SCRIPT="$2"
fi

SCENARIO_PATH="/src/scenarios/$SCENARIO_GROUP/$SCENARIO_SCRIPT.yml"
if [ ! -f $SCENARIO_PATH ]; then
    echo "Scenario path not found at $SCENARIO_PATH - please check and try again"
    exit 1
fi
echo "Using the following scenario path - $SCENARIO_PATH"

slsart invoke --path $SCENARIO_PATH
