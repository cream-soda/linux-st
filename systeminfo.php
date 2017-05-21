<?php
   $headers=getallheaders();
   $ip=$headers['X-Forwarded-For'];
   $port=$headers['REMOTE-PORT'];
   $nginx_version=$headers['X-NGX-VERSION'];

   $ng_ip=$_SERVER['REMOTE_ADDR'];
   $ng_port=$_SERVER['REMOTE_PORT'];
   
?>
<html>
<head><meta http-equiv="Refresh" content="5" />
<p align="center">System information</p></head>
<body>
<p><?php system(date)?></p>
<hr>
<p>Your IP-adress: <?php echo($ip)?> Port: <?php echo($port)?></p>
<p>
<br>Nginx version: <?php echo($nginx_version)?></br>
<br>Nginx IP: <?php echo($ng_ip)?> Port: <?php echo($ng_port)?></br> 
<p/>
<hr>
<p><?php system("/home/soda/table_lavg.sh")?></p>
<br></br>
<br></br>
<p><?php system("/home/soda/table_ios.sh")?></p>
<br></br>
<br></br>
<p><?php system("/home/soda/table_net.sh")?></p>
<br></br>
<br></br>
<br></br>
<p><?php system("/home/soda/table_cpu.sh")?></p>
<br></br>
<br></br>
<p><?php system("/home/soda/table_mem.sh")?></p>
<br></br>
<br></br>
<br></br>
<p><?php system("/home/soda/table_lsoc.sh")?></p>
<br></br>
<br></br>
<br></br>
<br></br>
<p><?php system("/home/soda/table_scon.sh")?></p>
<br></br>
<br></br>
<br></br>
<br></br>
<br></br>
<br></br>
<br></br>
<br></br>
<p><?php system("/home/soda/table_tt1.sh")?></p>

<body>
</html>
