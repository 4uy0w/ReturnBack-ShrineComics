<?php

	include "../core/koneksi.php";

	function create_comic($comic_title,$comic_writer,$comic_page,$comic_price,$comic_genre,$comic_release_date,$comic_comment,$comic_image,$comic_banner)
	{
		$comic_hash_code = "$comic_title-$comic_writer-$comic_release_date";
		$affected_collumn = "comic_title,comic_writer,comic_page,comic_price,comic_genre,comic_release_date,comic_comment,comic_image,comic_banner,hash_code";
		$filled_data = "'$comic_title','$comic_writer',$comic_page,$comic_price,'$comic_genre','$comic_release_date','$comic_comment','$comic_image','$comic_banner','$hash_code'";
		$affected_table = "comic";

		$result_action = false;
		$sql_syntax = "INSERT INTO $affected_table ($affected_collumn) VALUES ($filled_data)";
		$result = mysqli_query($server);

		if($result){
			$result_action = true;
		}

		return $result_action;
	}
?>
