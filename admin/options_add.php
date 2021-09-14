<?php
	include 'includes/session.php';

	if(isset($_POST['add'])){
		$fname = $_POST['fname'];
		$poll = $_POST['poll'];
		$description = $_POST['description'];
		$filename = $_FILES['photo']['name'];
		if(!empty($filename)){
			move_uploaded_file($_FILES['photo']['tmp_name'], '../images/'.$filename);	
		}

		$sql = "INSERT INTO options (poll_id, fname, photo, description) VALUES ('$poll', '$fname', '$filename', '$description')";
		if($conn->query($sql)){
			$_SESSION['success'] = 'Poll added successfully';
		}
		else{
			$_SESSION['error'] = $conn->error;
		}

	}
	else{
		$_SESSION['error'] = 'Fill up add form first';
	}

	header('location: options.php');
?>