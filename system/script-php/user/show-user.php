<?php

	include "../core/koneksi.php";
	include "../config/debug/debug-show-user.php";

	$result_show_user = null;

	$sql_syntax = "SELECT * FROM user";
	$result = mysqli_query($server,$sql_syntax);

	if($result){
		$result_show_user = $result;
	}

?>
