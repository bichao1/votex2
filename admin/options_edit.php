<?php
	include 'includes/session.php';

	if(isset($_POST['edit'])){
		$id = $_POST['id'];
		$fname = $_POST['fname'];
		$poll = $_POST['poll'];
		$description = $_POST['description'];

		$sql = "UPDATE options SET fname = '$fname', poll_id = '$poll', description = '$description' WHERE id = '$id'";
		if($conn->query($sql)){
			$_SESSION['success'] = 'Poll updated successfully';
		}
		else{
			$_SESSION['error'] = $conn->error;
		}
	}
	else{
		$_SESSION['error'] = 'Fill up edit form first';
	}

	header('location: options.php');

?>