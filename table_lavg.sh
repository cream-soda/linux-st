#!/bin/bash

lavg1=$(cat /home/soda/stat/lavg1.stat | tail -1)
lavg5=$(cat /home/soda/stat/lavg5.stat | tail -1)
lavg15=$(cat /home/soda/stat/lavg15.stat | tail -1)
n_cpu=$(lscpu | grep CPU\(s\) | head -n1 | awk '{print $2}')
n_cpu_2=$(echo "$n_cpu * 2" | bc)

color (){
    if [[ $(echo "$1 > $n_cpu_2" | bc) -eq 1 ]]; then
         OUT="<span style='color: red;'>$1</span>"
    elif [[ $(echo "$1 > $n_cpu" | bc) -eq 1 ]]; then 
         OUT="<span style='color: yellow;'>$1</span>"
    else
         OUT="<span style='color: green;'>$1</span>"
    fi
    echo $OUT
}
echo "<p>Number of CPUs: "
echo $n_cpu
echo "</p>"
echo "<p>"
echo "</p>"
echo '<table align="left" border="1">'
echo "<tr>"
echo '<td colspan="3">Load Average</td>'
echo "</tr>"
echo "<tr>"
echo "<td>1 min</td>"
echo "<td>5 min</td>"
echo "<td>15 min</td>"
echo "</tr>"
echo "<tr>"
echo "<td>"
color $lavg1
echo "</td>"
echo "<td>"
color $lavg5
echo "</td>"
echo "<td>"
color $lavg15
echo "</td>"

echo "</tr>"
echo "</table>"

