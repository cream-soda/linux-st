#!/bin/bash

num_d=$(echo "$(df | grep -Ev '(tmpfs|udev)' | wc -l) - 1" | bc)

color (){
    if [[ $(echo "$1 < 30" | bc) -eq 1 ]]; then
         OUT="<span style='color: red;'>$1</span>"
    elif [[ $(echo "$1 < 50" | bc) -eq 1 ]]; then
         OUT="<span style='color: yellow;'>$1</span>"
    else
         OUT="<span style='color: green;'>$1</span>"
    fi
    echo $OUT
}


echo "<p>"
echo "</p>"
echo '<table align="left" border="1">'
echo "<tr>"
echo '<td colspan="3">Disks</td>'
echo "</tr>"

echo "<tr>"
echo "<td>System</td>"
echo "<td>Free space</td>"
echo "<td>Free inodes</td>"
echo "</tr>"

for i in $(seq $num_d)
do
echo "<tr>"
echo "<td>"
  cat /home/soda/stat/mem.stat | tail -$i | head -n1 | awk '{print $1}'
echo "</td>"
echo "<td>"
  m1=$(cat /home/soda/stat/mem.stat | tail -$i | head -n1 | awk '{print $2}')
  m2=$(echo ${m1//,/.})
  m3=$(echo $m2 | cut -c -$(echo "$(expr length $m2) - 1" | bc))
  m3=$(echo "100 - $m3" | bc )
  color $m3
echo "</td>"
echo "<td>"
  m1=$(cat /home/soda/stat/in_mem.stat | tail -$i | head -n1 | awk '{print $2}')
  m2=$(echo ${m1//,/.})
  m3=$(echo $m2 | cut -c -$(echo "$(expr length $m2) - 1" | bc))
  m3=$(echo "100 - $m3" | bc )
  color $m3
echo "</td>"

echo "</tr>"
done

echo "</table>"

