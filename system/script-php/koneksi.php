<?php

	include "config/konfigurasi-koneksi.php";

	$success_to_connect = false;

	$server = mysqli_connect($hostname,$username,$password,$database);

	if($server){
		$success_to_connect = true;
	}

	if($debug_koneksi){
		if($server){
			echo "berhasil terhubung dengan database! \n";
		}else{
			echo "gagal terhubung dengan database!: " . mysqli_error($server) . "\n";
		}
	}

?>
