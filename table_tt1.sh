#!/bin/bash

num_tcp=$(cat /home/soda/stat/dump.stat | grep Flags | wc -l)
num_udp=$(cat /home/soda/stat/dump.stat | grep -E "(Server|Client)" | wc -l)
num_icmp=$(cat /home/soda/stat/dump.stat | grep ICMP | wc -l)


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

