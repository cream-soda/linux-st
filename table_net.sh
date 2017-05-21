#!/bin/bash

net_name=$(cat /home/soda/stat/net.stat | tail -1 | awk '{print $1}')
speed=$(ethtool $net_name | grep Speed | awk '{print $2}' | cut -d"M" -f1)
speed_kb=$(echo "$speed * 1024" | bc -l)

#echo "<p>Speed: "
#echo $speed
#echo "</p>"
echo '<table align="left" border="1">'
echo "<tr>"
echo '<td colspan="7">Network load</td>'
echo "</tr>"

echo "<tr>"
echo "<td></td>"
echo "<td colspan="3">Receive</td>"
echo "<td colspan="3">Transmit</td>"
echo "</tr>"

echo "<tr>"
echo "<td>Net name</td>"
echo "<td>Kb/s</td>"
echo "<td>%</td>"
echo "<td>Packets/s</td>"
echo "<td>Kb/s</td>"
echo "<td>%</td>"
echo "<td>Packets/s</td>"
echo "</tr>"

echo "<tr>"
echo "<td>"
  echo $net_name
echo "</td>"
echo "<td>"
  if [[ $(echo "$(cat /home/soda/stat/net.stat | wc -l) > 6" | bc) -eq 1 ]]
    then
    m1=$(cat /home/soda/stat/net.stat | tail -1 | awk '{print $2}')
    m2=$(cat /home/soda/stat/net.stat | tail -7 | awk "(NR==1)" | awk '{print $2}')
    m3=$(echo "($m1 - $m2) * 8 / 1024 / 60 " | bc -l | cut -c -5)
    if [[ $(echo "$m3 < 1" | bc) -eq 1 ]];then
    echo "0"$m3
    else
    echo $m3
    fi
    else
    echo "0"
    fi
echo "</td>"
echo "<td>"
  if [[ $(echo "$(cat /home/soda/stat/net.stat | wc -l) > 6" | bc) -eq 1 ]]
    then
    m3=$(echo "$m3 / $speed_kb" | bc -l | cut -c -3)
    if [[ $(echo "$m3 < 1" | bc) -eq 1 ]];then
    echo "0"$m3
    else
    echo $m3
    fi
    else
    echo "0"
    fi
echo "</td>"
echo "<td>"
  if [[ $(echo "$(cat /home/soda/stat/net.stat | wc -l) > 6" | bc) -eq 1 ]]
    then
    m1=$(cat /home/soda/stat/net.stat | tail -1 | awk '{print $3}')
    m2=$(cat /home/soda/stat/net.stat | tail -7 | awk "(NR==1)" | awk '{print $3}')
    m3=$(echo "($m1 - $m2) / 60 " | bc -l | cut -c -5)
    if [[ $(echo "$m3 < 1" | bc) -eq 1 ]];then
    echo "0"$m3
    else
    echo $m3
    fi
    else
    echo "0"
    fi
echo "</td>"
echo "<td>"
  if [[ $(echo "$(cat /home/soda/stat/net.stat | wc -l) > 6" | bc) -eq 1 ]]
    then
    m1=$(cat /home/soda/stat/net.stat | tail -1 | awk '{print $10}')
    m2=$(cat /home/soda/stat/net.stat | tail -7 | awk "(NR==1)" | awk '{print $10}')
    m3=$(echo "($m1 - $m2) * 8 / 1024 / 60 " | bc -l | cut -c -5)
    if [[ $(echo "$m3 < 1" | bc) -eq 1 ]];then
    echo "0"$m3
    else
    echo $m3
    fi
    else
    echo "0"
    fi
echo "</td>"
echo "<td>"
  if [[ $(echo "$(cat /home/soda/stat/net.stat | wc -l) > 6" | bc) -eq 1 ]]
    then
    m3=$(echo "$m3 / $speed_kb" | bc -l | cut -c -3)
    if [[ $(echo "$m3 < 1" | bc) -eq 1 ]];then
    echo "0"$m3
    else
    echo $m3
    fi
    else
    echo "0"
    fi
echo "</td>"
echo "<td>"
  if [[ $(echo "$(cat /home/soda/stat/net.stat | wc -l) > 6" | bc) -eq 1 ]]
    then
    m1=$(cat /home/soda/stat/net.stat | tail -1 | awk '{print $11}')
    m2=$(cat /home/soda/stat/net.stat | tail -7 | awk "(NR==1)" | awk '{print $11}')
    m3=$(echo "($m1 - $m2) / 60 " | bc -l | cut -c -5)
    if [[ $(echo "$m3 < 1" | bc) -eq 1 ]];then
    echo "0"$m3
    else
    echo $m3
    fi
    else
    echo "0"
    fi
echo "</td>"
echo "</tr>"

echo "</table>"

