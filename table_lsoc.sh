#!/bin/bash

num_tcp=$(echo "$(netstat -nlt | grep -Ev tcp6 | wc -l) - 2" | bc)
num_udp=$(echo "$(netstat -nlu | wc -l) - 2" | bc)

echo '<table align="left" border="1">'
echo "<tr>"
echo '<td>Listening sockets</td>'
echo "</tr>"

echo "<tr>"
echo "<td>TCP</td>"
echo "</tr>"

for i in $(seq $num_tcp)
do
echo "<tr>"
echo "<td>"
  cat /home/soda/stat/tcp.stat | tail -$i | awk "(NR==1)" | awk '{print $4}'
echo "</td>"
echo "</tr>"
done

echo "<tr>"
echo "<td>UDP</td>"
echo "</tr>"

for i in $(seq $num_udp)
do
echo "<tr>"
echo "<td>"
  cat /home/soda/stat/udp.stat | tail -$i | awk "(NR==1)" | awk '{print $4}'
echo "</td>"
echo "</tr>"
done

echo "</table>"

