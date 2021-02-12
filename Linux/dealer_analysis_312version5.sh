#/bin/bash

grep -hi '11:00:00 PM' 0312* | awk '{print $1,$2,$5,$6}' >> Dealers_working_during_losses.txt
