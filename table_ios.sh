#!/bin/bash

num_sd=$(ls -l /home/soda/stat | grep sd | wc -l)
num_hd=$(ls -l /home/soda/stat | grep hd | wc -l)
num_vd=$(ls -l /home/soda/stat | grep vd | wc -l)
num_mmcblk=$(ls -l /home/soda/stat | grep mmcblk | wc -l)
num_tr=$(echo "$num_sd + $num_hd + $num_vd + $num_mmcblk" | bc)

echo "<p>"
echo "</p>"
echo '<table align="left" border="1">'
echo "<tr>"
echo '<td colspan="6">Iostat</td>'
echo "</tr>"

echo "<tr>"
echo "<td>Device</td>"
echo "<td>tps</td>"
echo "<td>kB read/s</td>"
echo "<td>kB wrtn/s</td>"
echo "<td>kB read</td>"
echo "<td>kB wrtn</td>"
echo "</tr>"

for i in $(seq $num_sd)
do
echo "<tr>"
echo "<td>"
cat /home/soda/stat/ios_sd_$i.stat | tail -1 | awk '{print $1}'
echo "</td>"
echo "<td>"
  if [[ $(echo "$(cat /home/soda/stat/ios_sd_$i.stat | wc -l) > 5" | bc) -eq 1 ]]
    then
    m[0]=0
    for u in {1..6};do
    m[$u]=$(cat /home/soda/stat/ios_sd_$i.stat | tail -6 | awk "(NR==$u)" | awk '{print $2}')
    m[0]=$(echo "${m[0]} + ${m[$u]}" | bc)
    done
    m[0]=$(echo "${m[0]} / 6" | bc -l | cut -c -5)
    echo ${m[0]}
    else
    cat /home/soda/stat/ios_sd_$i.stat | tail -1 | awk '{print $2}'
    fi
echo "</td>"
echo "<td>"
  if [[ $(echo "$(cat /home/soda/stat/ios_sd_$i.stat | wc -l) > 5" | bc) -eq 1 ]]
    then
    m[0]=0
    for u in {1..6};do
    m[$u]=$(cat /home/soda/stat/ios_sd_$i.stat | tail -6 | awk "(NR==$u)" | awk '{print $3}')
    m[0]=$(echo "${m[0]} + ${m[$u]}" | bc)
    done
    m[0]=$(echo "${m[0]} / 6" | bc -l | cut -c -5)
    echo ${m[0]}
    else
    cat /home/soda/stat/ios_sd_$i.stat | tail -1 | awk '{print $3}'
    fi
echo "</td>"
echo "<td>"
  if [[ $(echo "$(cat /home/soda/stat/ios_sd_$i.stat | wc -l) > 5" | bc) -eq 1 ]]
    then
    m[0]=0
    for u in {1..6};do
    m[$u]=$(cat /home/soda/stat/ios_sd_$i.stat | tail -6 | awk "(NR==$u)" | awk '{print $4}')
    m[0]=$(echo "${m[0]} + ${m[$u]}" | bc)
    done
    m[0]=$(echo "${m[0]} / 6" | bc -l | cut -c -5)
    echo ${m[0]}
    else
    cat /home/soda/stat/ios_sd_$i.stat | tail -1 | awk '{print $4}'
    fi
echo "</td>"
echo "<td>"
    if [[ $(echo "$(cat /home/soda/stat/ios_sd_$i.stat | wc -l) > 6" | bc) -eq 1 ]]
    then
    m1=$(cat /home/soda/stat/ios_sd_$i.stat | tail -7 | awk "(NR==1)" | awk '{print $5}')
    m2=$(cat /home/soda/stat/ios_sd_$i.stat | tail -1 | awk '{print $5}')
    echo "$m2 - $m1" | bc
    else
    cat /home/soda/stat/ios_sd_$i.stat | tail -1 | awk '{print $5}'
    fi

echo "</td>"
echo "<td>"
    if [[ $(echo "$(cat /home/soda/stat/ios_sd_$i.stat | wc -l) > 6" | bc) -eq 1 ]]
    then
    m1=$(cat /home/soda/stat/ios_sd_$i.stat | tail -7 | awk "(NR==1)" | awk '{print $6}')
    m2=$(cat /home/soda/stat/ios_sd_$i.stat | tail -1 | awk '{print $6}')
    echo "$m2 - $m1" | bc
    else
    cat /home/soda/stat/ios_sd_$i.stat | tail -1 | awk '{print $6}'
    fi

echo "</td>"

echo "</tr>"
done

for i in $(seq $num_mmcblk)
do
echo "<tr>"
echo "<td>"
cat /home/soda/stat/ios_mmcblk_$i.stat | tail -1 | awk '{print $1}'
echo "</td>"
echo "<td>"
  if [[ $(echo "$(cat /home/soda/stat/ios_mmcblk_$i.stat | wc -l) > 5" | bc) -eq 1 ]]
    then
    m[0]=0
    for u in {1..6};do
    m[$u]=$(cat /home/soda/stat/ios_mmcblk_$i.stat | tail -6 | awk "(NR==$u)" | awk '{print $2}')
    m[0]=$(echo "${m[0]} + ${m[$u]}" | bc)
    done
    m[0]=$(echo "${m[0]} / 6" | bc -l | cut -c -5)
    echo ${m[0]}
    else
    cat /home/soda/stat/ios_mmcblk_$i.stat | tail -1 | awk '{print $2}'
    fi
echo "</td>"
echo "<td>"
  if [[ $(echo "$(cat /home/soda/stat/ios_mmcblk_$i.stat | wc -l) > 5" | bc) -eq 1 ]]
    then
    m[0]=0
    for u in {1..6};do
    m[$u]=$(cat /home/soda/stat/ios_mmcblk_$i.stat | tail -6 | awk "(NR==$u)" | awk '{print $3}')
    m[0]=$(echo "${m[0]} + ${m[$u]}" | bc)
    done
    m[0]=$(echo "${m[0]} / 6" | bc -l | cut -c -5)
    echo ${m[0]}
    else
    cat /home/soda/stat/ios_mmcblk_$i.stat | tail -1 | awk '{print $3}'
    fi
echo "</td>"
echo "<td>"
  if [[ $(echo "$(cat /home/soda/stat/ios_mmcblk_$i.stat | wc -l) > 5" | bc) -eq 1 ]]
    then
    m[0]=0
    for u in {1..6};do
    m[$u]=$(cat /home/soda/stat/ios_mmcblk_$i.stat | tail -6 | awk "(NR==$u)" | awk '{print $4}')
    m[0]=$(echo "${m[0]} + ${m[$u]}" | bc)
    done
    m[0]=$(echo "${m[0]} / 6" | bc -l | cut -c -5)
    echo ${m[0]}
    else
    cat /home/soda/stat/ios_mmcblk_$i.stat | tail -1 | awk '{print $4}'
    fi
echo "</td>"
echo "<td>"
    if [[ $(echo "$(cat /home/soda/stat/ios_mmcblk_$i.stat | wc -l) > 6" | bc) -eq 1 ]]
    then
    m1=$(cat /home/soda/stat/ios_mmcblk_$i.stat | tail -7 | awk "(NR==1)" | awk '{print $5}')
    m2=$(cat /home/soda/stat/ios_mmcblk_$i.stat | tail -1 | awk '{print $5}')
    echo "$m2 - $m1" | bc
    else
    cat /home/soda/stat/ios_mmcblk_$i.stat | tail -1 | awk '{print $5}'
    fi

echo "</td>"
echo "<td>"
    if [[ $(echo "$(cat /home/soda/stat/ios_mmcblk_$i.stat | wc -l) > 6" | bc) -eq 1 ]]
    then
    m1=$(cat /home/soda/stat/ios_mmcblk_$i.stat | tail -7 | awk "(NR==1)" | awk '{print $6}')
    m2=$(cat /home/soda/stat/ios_mmcblk_$i.stat | tail -1 | awk '{print $6}')
    echo "$m2 - $m1" | bc
    else
    cat /home/soda/stat/ios_mmcblk_$i.stat | tail -1 | awk '{print $6}'
    fi

echo "</td>"

echo "</tr>"
done

for i in $(seq $num_hd)
do
echo "<tr>"
echo "<td>"
cat /home/soda/stat/ios_hd_$i.stat | tail -1 | awk '{print $1}'
echo "</td>"
echo "<td>"
  if [[ $(echo "$(cat /home/soda/stat/ios_hd_$i.stat | wc -l) > 5" | bc) -eq 1 ]]
    then
    m[0]=0
    for u in {1..6};do
    m[$u]=$(cat /home/soda/stat/ios_hd_$i.stat | tail -6 | awk "(NR==$u)" | awk '{print $2}')
    m[0]=$(echo "${m[0]} + ${m[$u]}" | bc)
    done
    m[0]=$(echo "${m[0]} / 6" | bc -l | cut -c -5)
    echo ${m[0]}
    else
    cat /home/soda/stat/ios_hd_$i.stat | tail -1 | awk '{print $2}'
    fi
echo "</td>"
echo "<td>"
  if [[ $(echo "$(cat /home/soda/stat/ios_hd_$i.stat | wc -l) > 5" | bc) -eq 1 ]]
    then
    m[0]=0
    for u in {1..6};do
    m[$u]=$(cat /home/soda/stat/ios_hd_$i.stat | tail -6 | awk "(NR==$u)" | awk '{print $3}')
    m[0]=$(echo "${m[0]} + ${m[$u]}" | bc)
    done
    m[0]=$(echo "${m[0]} / 6" | bc -l | cut -c -5)
    echo ${m[0]}
    else
    cat /home/soda/stat/ios_hd_$i.stat | tail -1 | awk '{print $3}'
    fi
echo "</td>"
echo "<td>"
  if [[ $(echo "$(cat /home/soda/stat/ios_hd_$i.stat | wc -l) > 5" | bc) -eq 1 ]]
    then
    m[0]=0
    for u in {1..6};do
    m[$u]=$(cat /home/soda/stat/ios_hd_$i.stat | tail -6 | awk "(NR==$u)" | awk '{print $4}')
    m[0]=$(echo "${m[0]} + ${m[$u]}" | bc)
    done
    m[0]=$(echo "${m[0]} / 6" | bc -l | cut -c -5)
    echo ${m[0]}
    else
    cat /home/soda/stat/ios_hd_$i.stat | tail -1 | awk '{print $4}'
    fi
echo "</td>"
echo "<td>"
    if [[ $(echo "$(cat /home/soda/stat/ios_hd_$i.stat | wc -l) > 6" | bc) -eq 1 ]]
    then
    m1=$(cat /home/soda/stat/ios_hd_$i.stat | tail -7 | awk "(NR==1)" | awk '{print $5}')
    m2=$(cat /home/soda/stat/ios_hd_$i.stat | tail -1 | awk '{print $5}')
    echo "$m2 - $m1" | bc
    else
    cat /home/soda/stat/ios_hd_$i.stat | tail -1 | awk '{print $5}'
    fi

echo "</td>"
echo "<td>"
    if [[ $(echo "$(cat /home/soda/stat/ios_hd_$i.stat | wc -l) > 6" | bc) -eq 1 ]]
    then
    m1=$(cat /home/soda/stat/ios_hd_$i.stat | tail -7 | awk "(NR==1)" | awk '{print $6}')
    m2=$(cat /home/soda/stat/ios_hd_$i.stat | tail -1 | awk '{print $6}')
    echo "$m2 - $m1" | bc
    else
    cat /home/soda/stat/ios_hd_$i.stat | tail -1 | awk '{print $6}'
    fi

echo "</td>"

echo "</tr>"
done

for i in $(seq $num_vd)
do
echo "<tr>"
echo "<td>"
cat /home/soda/stat/ios_vd_$i.stat | tail -1 | awk '{print $1}'
echo "</td>"
echo "<td>"
  if [[ $(echo "$(cat /home/soda/stat/ios_vd_$i.stat | wc -l) > 5" | bc) -eq 1 ]]
    then
    m[0]=0
    for u in {1..6};do
    m[$u]=$(cat /home/soda/stat/ios_vd_$i.stat | tail -6 | awk "(NR==$u)" | awk '{print $2}')
    m[0]=$(echo "${m[0]} + ${m[$u]}" | bc)
    done
    m[0]=$(echo "${m[0]} / 6" | bc -l | cut -c -5)
    echo ${m[0]}
    else
    cat /home/soda/stat/ios_vd_$i.stat | tail -1 | awk '{print $2}'
    fi
echo "</td>"
echo "<td>"
  if [[ $(echo "$(cat /home/soda/stat/ios_vd_$i.stat | wc -l) > 5" | bc) -eq 1 ]]
    then
    m[0]=0
    for u in {1..6};do
    m[$u]=$(cat /home/soda/stat/ios_vd_$i.stat | tail -6 | awk "(NR==$u)" | awk '{print $3}')
    m[0]=$(echo "${m[0]} + ${m[$u]}" | bc)
    done
    m[0]=$(echo "${m[0]} / 6" | bc -l | cut -c -5)
    echo ${m[0]}
    else
    cat /home/soda/stat/ios_vd_$i.stat | tail -1 | awk '{print $3}'
    fi
echo "</td>"
echo "<td>"
  if [[ $(echo "$(cat /home/soda/stat/ios_vd_$i.stat | wc -l) > 5" | bc) -eq 1 ]]
    then
    m[0]=0
    for u in {1..6};do
    m[$u]=$(cat /home/soda/stat/ios_vd_$i.stat | tail -6 | awk "(NR==$u)" | awk '{print $4}')
    m[0]=$(echo "${m[0]} + ${m[$u]}" | bc)
    done
    m[0]=$(echo "${m[0]} / 6" | bc -l | cut -c -5)
    echo ${m[0]}
    else
    cat /home/soda/stat/ios_vd_$i.stat | tail -1 | awk '{print $4}'
    fi
echo "</td>"
echo "<td>"
    if [[ $(echo "$(cat /home/soda/stat/ios_vd_$i.stat | wc -l) > 6" | bc) -eq 1 ]]
    then
    m1=$(cat /home/soda/stat/ios_vd_$i.stat | tail -7 | awk "(NR==1)" | awk '{print $5}')
    m2=$(cat /home/soda/stat/ios_vd_$i.stat | tail -1 | awk '{print $5}')
    echo "$m2 - $m1" | bc
    else
    cat /home/soda/stat/ios_vd_$i.stat | tail -1 | awk '{print $5}'
    fi

echo "</td>"
echo "<td>"
    if [[ $(echo "$(cat /home/soda/stat/ios_vd_$i.stat | wc -l) > 6" | bc) -eq 1 ]]
    then
    m1=$(cat /home/soda/stat/ios_vd_$i.stat | tail -7 | awk "(NR==1)" | awk '{print $6}')
    m2=$(cat /home/soda/stat/ios_vd_$i.stat | tail -1 | awk '{print $6}')
    echo "$m2 - $m1" | bc
    else
    cat /home/soda/stat/ios_vd_$i.stat | tail -1 | awk '{print $6}'
    fi

echo "</td>"

echo "</tr>"
done

echo "</table>"

