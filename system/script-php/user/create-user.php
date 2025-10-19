<?php

	include "../core/koneksi.php";
	include "../config/debug/debug-create-user.php";

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

		$sql_syntax = "INSERT INTO user (username,password,email,address,role,telephone_number,point,status,hash_code) VALUES ('$username','$password','$email','$address','$role','$telephone_number','$point','$hash_code')";
		$result = mysqli_query($server,$sql_syntax);

		if($debug_create_user){
			echo "success to create new user";
		}else{
			// NO CODE
		}
	}else{
		echo "POST method only!";
	}

?>
