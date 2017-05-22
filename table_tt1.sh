#!/bin/bash

num_tcp=$(cat /home/soda/stat/dump.stat | grep -E "(TCP|tcp)" | wc -l)
num_udp=$(cat /home/soda/stat/dump.stat | grep -E "(UDP|udp)" | wc -l)
num_icmp=$(cat /home/soda/stat/dump.stat | grep -E "(ICMP|icmp)" | wc -l)

num_tcp=$(echo "$num_tcp * 3" | bc)
num_udp=$(echo "$num_udp * 3" | bc)
num_icmp=$(echo "$num_icmp * 3" | bc)

len_tcp=0
for i in seq($num_tcp)
do
num_word=$(cat /home/soda/stat/dump.stat | grep -E "(TCP|tcp)" |  awk "(NR==$i)" | wc -w)
len_tcp=$(echo "$len_tcp + $(cat /home/soda/stat/dump.stat | grep -E "(TCP|tcp)" |  awk '(NR==$i)' | cut -d" " -f$num_word)" | bc)
done

len_udp=0
for i in seq($num_udp)
do
num_word=$(cat /home/soda/stat/dump.stat | grep -E "(UDP|udp)" |  awk "(NR==$i)" | wc -w)
len_udp=$(echo "$len_udp + $(cat /home/soda/stat/dump.stat | grep -E "(UDP|udp)" |  awk '(NR==$i)' | cut -d" " -f$num_word)" | bc)
done

len_icmp=0
for i in seq($num_icmp)
do
num_word=$(cat /home/soda/stat/dump.stat | grep -E "(ICMP|icmp)" |  awk "(NR==$i)" | wc -w)
len_icmp=$(echo "$len_icmp + $(cat /home/soda/stat/dump.stat | grep -E "(ICMP|icmp)" |  awk '(NR==$i)' | cut -d" " -f$num_word)" | bc)
done

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

