#!/bin/bash

num_tcp=$(cat /home/soda/stat/dump.stat | grep -E "(TCP|tcp)" | wc -l)
num_udp=$(cat /home/soda/stat/dump.stat | grep -E "(UDP|udp)" | wc -l)
num_icmp=$(cat /home/soda/stat/dump.stat | grep -E "(ICMP|icmp)" | wc -l)

num_tcp=$(echo "$num_tcp * 3" | bc)
num_udp=$(echo "$num_udp * 3" | bc)
num_icmp=$(echo "$num_icmp * 3" | bc)

echo "<p>"
echo "</p>"
echo '<table align="left" border="1">'
echo "<tr>"
echo '<td colspan="2">Top talkers</td>'
echo "</tr>"

echo "<tr>"
echo "<td>Protocol</td>"
echo "<td>Packets</td>"
echo "</tr>"

echo "<tr>"
echo "<td>TCP</td>"
echo "<td>"
echo $num_tcp
echo "</td>"
echo "</tr>"

echo "<tr>"
echo "<td>UDP</td>"
echo "<td>"
echo $num_udp
echo "</td>"
echo "</tr>"

echo "<tr>"
echo "<td>ICMP</td>"
echo "<td>"
echo $num_icmp
echo "</td>"
echo "</tr>"

echo "</table>"

