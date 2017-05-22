#!/bin/bash

num_tcp_1=$(cat /home/soda/stat/dump.stat | grep -E "(TCP|tcp)" | wc -l)
num_udp_1=$(cat /home/soda/stat/dump.stat | grep -E "(UDP|udp)" | wc -l)
num_icmp_1=$(cat /home/soda/stat/dump.stat | grep -E "(ICMP|icmp)" | wc -l)

num_tcp=$(echo "$num_tcp_1 * 3" | bc)
num_udp=$(echo "$num_udp_1 * 3" | bc)
num_icmp=$(echo "$num_icmp_1 * 3" | bc)

if [[ "$num_tcp_1" -ge 1 ]]
then
len_tcp=0
for i in $(seq $num_tcp_1)
do
num_word=$(cat /home/soda/stat/dump.stat | grep -E "(TCP|tcp)" |  awk "(NR==$i)" | wc -w)
buff=$(cat /home/soda/stat/dump.stat | grep -E "(TCP|tcp)" |  awk "(NR==$i)" | cut -d" " -f$num_word)
len_tcp=$(echo "$len_tcp + $buff" | bc)
done
fi

if [[ "$num_udp_1" -ge 1 ]]
then
len_udp=0
for i in $(seq $num_udp_1)
do
num_word=$(cat /home/soda/stat/dump.stat | grep -E "(UDP|udp)" |  awk "(NR==$i)" | wc -w)
buff=$(cat /home/soda/stat/dump.stat | grep -E "(UDP|udp)" |  awk "(NR==$i)" | cut -d" "  -f$num_word)
len_udp=$(echo "$len_udp + $buff" | bc)
done
fi

if [[ "$num_icmp_1" -ge 1 ]]
then
len_icmp=0
for i in $(seq $num_icmp_1)
do
num_word=$(cat /home/soda/stat/dump.stat | grep -E "(ICMP|icmp)" |  awk "(NR==$i)" | wc -w)
buff=$(cat /home/soda/stat/dump.stat | grep -E "(ICMP|icmp)" |  awk "(NR==$i)" | cut -d" "  -f$num_word)
len_icmp=$(echo "$len_icmp + $buff" | bc)
done
fi

echo "<p>"
echo "</p>"
echo '<table align="left" border="1">'
echo "<tr>"
echo '<td colspan="3">Top talkers</td>'
echo "</tr>"

echo "<tr>"
echo "<td>Protocol</td>"
echo "<td>Packets</td>"
echo "<td>Bytes</td>"
echo "</tr>"

echo "<tr>"
echo "<td>TCP</td>"
echo "<td>"
echo $num_tcp
echo "</td>"
echo "<td>"
echo $len_tcp
echo "</td>"
echo "</tr>"

echo "<tr>"
echo "<td>UDP</td>"
echo "<td>"
echo $num_udp
echo "</td>"
echo "<td>"
echo $len_udp
echo "</td>"
echo "</tr>"

echo "<tr>"
echo "<td>ICMP</td>"
echo "<td>"
echo $num_icmp
echo "</td>"
echo "<td>"
echo $len_icmp
echo "</td>"
echo "</tr>"

echo "</table>"

