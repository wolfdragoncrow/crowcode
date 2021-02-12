#!/bin/bash
 
grep -hi "$1" "$2"* | awk '{print $1,$2,$5,$6}'
