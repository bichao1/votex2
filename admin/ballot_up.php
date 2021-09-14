<?php
	include 'includes/session.php';

	if(isset($_POST['id'])){
		$id = $_POST['id'];

		$output = array('error'=>false);

		$sql = "SELECT * FROM polls WHERE id='$id'";	
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();

		$priority = $row['priority'] - 1;

		if($priority == 0){
			$output['error'] = true;
			$output['message'] = 'This poll is already at the top';
		}
		else{
			$sql = "UPDATE polls SET priority = priority + 1 WHERE priority = '$priority'";
			$conn->query($sql);

			$sql = "UPDATE polls SET priority = '$priority' WHERE id = '$id'";
			$conn->query($sql);
		}

		echo json_encode($output);

	}
	
?>