<?php
$handle = fopen("/usr/share/wordlists/rockyou.txt", "r");
if ($handle) {
    $line = fgets($handle);
    while ($line !== false) {
        $line = fgets($handle);
	$line = trim($line);
	
	//code here
	
	}
    }
    fclose($handle);
}
else{
	echo "error opening file";
}
?>
