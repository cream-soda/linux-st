#!/bin/bash

echo '<table align="left" border="1">'
echo "<tr>"
echo '<td colspan="11">TCP connections</td>'
echo "</tr>"

echo "<tr>"
echo "<td>LISTEN</td>"
echo "<td>SYN-SENT</td>"
echo "<td>SYN-RECEIVED</td>"
echo "<td>ESTABLISHED</td>"
echo "<td>CLOSE-WAIT</td>"
echo "<td>LAST-ACK</td>"
echo "<td>FIN-WAIT-1</td>"
echo "<td>FIN-WAIT-2</td>"
echo "<td>CLOSING</td>"
echo "<td>TIME-WAIT</td>"
echo "<td>CLOSED</td>"
echo "</tr>"

echo "<tr>"
for i in {1..11}
do
echo "<td>"
  cat /home/soda/stat/tcp_num.stat | tail -11 | awk "(NR==$i)"
echo "</td>"
done

echo "</table>"

