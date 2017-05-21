#!/bin/bash

wai=$(whoami)

if [ "$wai" != "root" ]
then
 sudo /etc/init.d/stat.sh &
else
while true
do
cut -d" " -f1 /proc/loadavg >> /home/soda/stat/lavg1.stat
cut -d" " -f2 /proc/loadavg >> /home/soda/stat/lavg5.stat
cut -d" " -f3 /proc/loadavg >> /home/soda/stat/lavg15.stat


num_sd=$(iostat -k | grep sd | wc -l)
for i in $(seq $num_sd)
  do
  buff=$(iostat -k | grep sd | awk "(NR==$i)")
  echo ${buff//,/.} >> /home/soda/stat/ios_sd_$i.stat
  done

num_hd=$(iostat -k | grep hd | wc -l)
for i in $(seq $num_hd)
  do
  buff=$(iostat -k | grep hd | awk "(NR==$i)")
  echo ${buff//,/.} >> /home/soda/stat/ios_hd_$i.stat
  done

num_vd=$(iostat -k | grep vd | wc -l)
for i in $(seq $num_vd)
  do
  buff=$(iostat -k | grep vd | awk "(NR==$i)")
  echo ${buff//,/.} >> /home/soda/stat/ios_vd_$i.stat
  done

buff=$(cat /proc/net/dev | awk '(NR==3)')
echo ${buff/:/} >> /home/soda/stat/net.stat

buff=$(mpstat 3 1 | awk '(NR==4)')
echo ${buff//,/.} >> /home/soda/stat/cpu.stat

echo "***" >> /home/soda/stat/mem.stat
df -h | grep -Ev "(tmpfs|udev)" | awk '{print $1 " " $5}' | tail -n$(echo "$(df | grep -Ev '(tmpfs|udev)' | wc -l) - 1" | bc) >> /home/soda/stat/mem.stat
echo "***" >> /home/soda/stat/in_mem.stat
df -h -i | grep -Ev "(tmpfs|udev)" | awk '{print $1 " " $5}' | tail -n$(echo "$(df | grep -Ev '(tmpfs|udev)' | wc -l) - 1" | bc) >> /home/soda/stat/in_mem.stat

echo "***" >> /home/soda/stat/tcp.stat
netstat -nlt | grep -Ev tcp6 | tail -n$(echo "$(netstat -nlt | grep -Ev tcp6 | wc -l) - 2" | bc) >> /home/soda/stat/tcp.stat
echo "***" >> /home/soda/stat/udp.stat
netstat -nlu | tail -n$(echo "$(netstat -nlu |  wc -l) - 2" | bc) >> /home/soda/stat/udp.stat

echo "***" >> /home/soda/stat/tcp_num.stat
netstat -ant | grep LISTEN | wc -l  >> /home/soda/stat/tcp_num.stat
netstat -ant | grep SYN_SENT | wc -l >> /home/soda/stat/tcp_num.stat
netstat -ant | grep SYN_RECEIVED | wc -l >> /home/soda/stat/tcp_num.stat
netstat -ant | grep ESTABLISHED | wc -l >> /home/soda/stat/tcp_num.stat
netstat -ant | grep CLOSE_WAIT | wc -l >> /home/soda/stat/tcp_num.stat
netstat -ant | grep LAST_ACK | wc -l >> /home/soda/stat/tcp_num.stat
netstat -ant | grep FIN_WAIT_1 | wc -l >> /home/soda/stat/tcp_num.stat
netstat -ant | grep FIN_WAIT_2 | wc -l >> /home/soda/stat/tcp_num.stat
netstat -ant | grep CLOSING | wc -l >> /home/soda/stat/tcp_num.stat
netstat -ant | grep TIME_WAIT | wc -l >> /home/soda/stat/tcp_num.stat
netstat -ant | grep CLOSED | wc -l >> /home/soda/stat/tcp_num.stat

/bin/sleep 7
done
fi
