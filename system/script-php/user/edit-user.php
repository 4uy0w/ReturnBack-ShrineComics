<?php

	include "../core/koneksi.php";
	include "../config/debug/debug-edit-user.php";

	$user_hash = $_GET["user_hash"];

	if($_SERVER["REQUEST_METHOD"] == "POST"){
		$username = $_POST["username"];
		$password = $_POST["password"];
		$email = $_POST["email"];
		$address = $_POST["address"];
		$role = $_POST["role"];
		$telephone_number = $_POST["telephone_number"];
		$point = 0;
		$status = "logout";
		$hash_code = md5("$username-$password-$email-$address-$role-$telephone_number");

		$search_user = mysqli_query($server,"SELECT user_id FROM user WHERE hash_code='$user_hash'";
		$fetch_search_result = mysqli_fetch_array($search_user);
		$user_id = $fetch_search_result["user_id"];

		$sql_syntax = "UPDATE user SET username='$username',password='$password',email='$email',address='$address',role='$role',telephone_number='$telephone_number',point=$point,status='$status',hash_code='$hash_code' WHERE user_id=$user_id";
		$result = mysqli_query($server,$sql_syntax);

		if($debug_create_user){
			echo "success to create new user";
		}else{
			echo "failed to create new user";
		}
	}else{
		echo "POST method only!";
	}

?>
