#!/bin/bash

echo '<table align="left" border="1">'
echo "<tr>"
echo '<td colspan="2">TCP connections</td>'
echo "</tr>"

name_tr=(None LISTEN SYN-SENT SYN-RECEIVED ESTABLISHED CLOSE-WAIT LAST-ACK FIN-WAIT-1 FIN-WAIT-2 CLOSING TIME-WAIT CLOSED)
#echo "<tr>"
#echo "<td>LISTEN</td>"
#echo "<td>SYN-SENT</td>"
#echo "<td>SYN-RECEIVED</td>"
#echo "<td>ESTABLISHED</td>"
#echo "<td>CLOSE-WAIT</td>"
#echo "<td>LAST-ACK</td>"
#echo "<td>FIN-WAIT-1</td>"
#echo "<td>FIN-WAIT-2</td>"
#echo "<td>CLOSING</td>"
#echo "<td>TIME-WAIT</td>"
#echo "<td>CLOSED</td>"
#echo "</tr>"

#echo "<tr>"
for i in {1..11}
do
echo "<tr>"
echo "<td>"
  echo ${name_tr[$i]}
echo "</td>"
  cat /home/soda/stat/tcp_num.stat | tail -11 | awk "(NR==$i)"
echo "<td>"

echo "</td>"
echo "</tr>"
done

#echo "</tr>"
echo "</table>"

