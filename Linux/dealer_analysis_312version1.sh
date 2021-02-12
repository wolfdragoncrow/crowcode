#/bin/bash

grep -hi '05:00:00 AM' 0312* | awk '{print $1,$2,$5,$6}' >> Dealers_working_during_losses.txt
