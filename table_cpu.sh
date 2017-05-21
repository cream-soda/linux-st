#!/bin/bash

color (){
    if [[ $(echo "$1 > 70" | bc) -eq 1 ]]; then
         OUT="<span style='color: red;'>$1</span>"
    elif [[ $(echo "$1 > 50" | bc) -eq 1 ]]; then
         OUT="<span style='color: yellow;'>$1</span>"
    else
         OUT="<span style='color: green;'>$1</span>"
    fi
    echo $OUT
}


echo '<table align="left" border="1">'
echo "<tr>"
echo '<td colspan="4">CPU load</td>'
echo "</tr>"

echo "<tr>"
echo "<td>User</td>"
echo "<td>System</td>"
echo "<td>Idle</td>"
echo "<td>I/O wait</td>"
echo "</tr>"

echo "<tr>"
echo "<td>"
  if [[ $(echo "$(cat /home/soda/stat/cpu.stat | wc -l) > 5" | bc) -eq 1 ]]
    then
    m[0]=0
    for u in {1..6};do
    m[$u]=$(cat /home/soda/stat/cpu.stat | tail -6 | awk "(NR==$u)" | awk '{print $3}')
    m[0]=$(echo "${m[0]} + ${m[$u]}" | bc -l)
    m[$u]=$(cat /home/soda/stat/cpu.stat | tail -6 | awk "(NR==$u)" | awk '{print $4}')
    m[0]=$(echo "${m[0]} + ${m[$u]}" | bc -l)
    done
    m[0]=$(echo "${m[0]} / 6" | bc -l | cut -c -5)
    color ${m[0]}
    else
    m1=$(cat /home/soda/stat/cpu.stat | tail -1 | awk '{print $3}')
    m2=$(cat /home/soda/stat/cpu.stat | tail -1 | awk '{print $4}')
    m[0]=$(echo "$m1 + $m2" | bc -l)
    color ${m[0]}
    fi
echo "</td>"
echo "<td>"
  if [[ $(echo "$(cat /home/soda/stat/cpu.stat | wc -l) > 5" | bc) -eq 1 ]]
    then
    m[0]=0
    for u in {1..6};do
    m[$u]=$(cat /home/soda/stat/cpu.stat | tail -6 | awk "(NR==$u)" | awk '{print $5}')
    m[0]=$(echo "${m[0]} + ${m[$u]}" | bc -l)
    done
    m[0]=$(echo "${m[0]} / 6" | bc -l | cut -c -5)
    color ${m[0]}
    else
    color $(cat /home/soda/stat/cpu.stat | tail -1 | awk '{print $5}')
    fi

echo "</td>"
echo "<td>"
echo "<span style='color: green;'>"
  if [[ $(echo "$(cat /home/soda/stat/cpu.stat | wc -l) > 5" | bc) -eq 1 ]]
    then
    m[0]=0
    for u in {1..6};do
    m[$u]=$(cat /home/soda/stat/cpu.stat | tail -6 | awk "(NR==$u)" | awk '{print $12}')
    m[0]=$(echo "${m[0]} + ${m[$u]}" | bc -l)
    done
    m[0]=$(echo "${m[0]} / 6" | bc -l | cut -c -5)
    echo ${m[0]}
    else
    echo $(cat /home/soda/stat/cpu.stat | tail -1 | awk '{print $12}')
    fi
echo "</span>"
echo "</td>"
echo "<td>"
  if [[ $(echo "$(cat /home/soda/stat/cpu.stat | wc -l) > 5" | bc) -eq 1 ]]
    then
    m[0]=0
    for u in {1..6};do
    m[$u]=$(cat /home/soda/stat/cpu.stat | tail -6 | awk "(NR==$u)" | awk '{print $6}')
    m[0]=$(echo "${m[0]} + ${m[$u]}" | bc -l)
    done
    m[0]=$(echo "${m[0]} / 6" | bc -l | cut -c -5)
    if [[ $(echo "${m[0]} < 0.01" | bc) -eq 1 ]];then
    color $(echo "0")
    elif [[ $(echo "${m[0]} < 1" | bc) -eq 1 ]];then
    color $(echo "0"${m[0]})
    else
    color ${m[0]}
    fi
    else
    m3=$(cat /home/soda/stat/cpu.stat | tail -1 | awk '{print $6}')
    if [[ $(echo "$m3 < 0.01" | bc) -eq 1 ]];then
    color $(echo "0") 
    elif [[ $(echo "$m3 < 1" | bc) -eq 1 ]];then
    color $(echo "0"$m3)
    else
    color $m3
    fi
    fi
echo "</td>"
echo "</tr>"

echo "</table>"

