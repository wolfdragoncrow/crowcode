#/bin/bash

grep -hi '08:00:00 PM' 0310* | awk '{print $1,$2,$5,$6}' >> Dealers_working_during_losses.txt
