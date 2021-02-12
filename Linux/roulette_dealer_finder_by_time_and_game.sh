#!/bin/bash

# This is a comment. 
grep -hi "$1" "$2"* "$3" | awk '{print $1,$2,$5,$6}'
