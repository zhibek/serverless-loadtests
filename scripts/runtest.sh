#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

if [ -z "$1" ]; then
    echo "Please ensure a 'scenario' script is specified as an argument - runtest.sh <scenario>"
    exit 1
fi
SCENARIO_SCRIPT="/src/scenarios/$1/script.yml"
if [ ! -f $SCENARIO_SCRIPT ]; then
    echo "Scenario script not found at $SCENARIO_SCRIPT - please check and try again"
    exit 1
fi
echo "Using the following scenario script - $SCENARIO_SCRIPT"

slsart invoke --path $SCENARIO_SCRIPT
