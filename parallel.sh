#!/bin/bash

function function1() {
    # Function 1 code here
    sleep 2
    echo "Function 1 completed"
}

function function2() {
    # Function 2 code here
    sleep 3
    echo "Function 2 completed"
}

function function3() {
    # Function 3 code here
    sleep 1
    echo "Function 3 completed"
}

# Run functions in parallel
function1 &
function2 &
function3 &

# Wait for all background processes to finish
wait

echo "All functions have completed"
