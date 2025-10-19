<?php

	include "../core/koneksi.php";
	include "../config/debug/debug-delete-user.php";

	$search_user = mysqli_query($server,"SELECT user_id FROM user WHERE hash_code=$hash_code";
	$fetch_search_user = mysqli_fetch_array($search_user);
	$user_id = $fetch_search_user["user_id"];

	$sql_syntax = "DELETE FROM user WHERE user_id=$user_id";
	$result = mysqli_query($server,$sql_syntax);

	if($debug_delete_user){
		echo "success to delete user";
	}else{
		echo "failed to delete user";
	}
?>
