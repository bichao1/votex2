<?php
	
	include 'includes/session.php';
	include 'includes/slugify.php';

	$output = array('error'=>false,'list'=>'');

	$sql = "SELECT * FROM polls";
	$query = $conn->query($sql);

	while($row = $query->fetch_assoc()){
		$poll = slugify($row['description']);
		$pos_id = $row['id'];
		if(isset($_POST[$poll])){
			if($row['max_vote'] > 1){
				if(count($_POST[$poll]) > $row['max_vote']){
					$output['error'] = true;
					$output['message'][] = '<li>You can only choose '.$row['max_vote'].' options for '.$row['description'].'</li>';
				}
				else{
					foreach($_POST[$poll] as $key => $values){
						$sql = "SELECT * FROM options WHERE id = '$values'";
						$cmquery = $conn->query($sql);
						$cmrow = $cmquery->fetch_assoc();
						$output['list'] .= "
							<div class='row votelist'>
		                      	<span class='col-sm-4'><span class='pull-right'><b>".$row['description']." :</b></span></span> 
		                      	<span class='col-sm-8'>".$cmrow['fname']."</span>
		                    </div>
						";
					}

				}
				
			}
			else{
				$option = $_POST[$poll];
				$sql = "SELECT * FROM options WHERE id = '$option'";
				$csquery = $conn->query($sql);
				$csrow = $csquery->fetch_assoc();
				$output['list'] .= "
					<div class='row votelist'>
                      	<span class='col-sm-4'><span class='pull-right'><b>".$row['description']." :</b></span></span> 
                      	<span class='col-sm-8'>".$csrow['fname']."</span>
                    </div>
				";
			}

		}
		
	}

	echo json_encode($output);


?>