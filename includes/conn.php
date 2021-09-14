<?php
	$conn = new mysqli('lhcp3210.webapps.net', 'pm4jg8j4_asd', 'Svh11cawizyC', 'pm4jg8j4_vote', '3306');

	if ($conn->connect_error) {
	    die("Connection failed: " . $conn->connect_error);
	}
	
?>
