<?php

	include "../config/konfigurasi-koneksi.php";

	$success_to_connect = false;

	$server = mysqli_connect($hostname,$username,$password,$database);

	if($server){
		$success_to_connect = true;
	}else{
		echo "gagal terhubung dengan database!: " . mysqli_error($server) . "\n";
		header("Location: error.php?error_code=error_server_not_found");
	}

	if($debug_koneksi){
		if($server){
			echo "berhasil terhubung dengan database! \n";
		}
	}

?>
