<?php

	include "../core/koneksi.php";

	function edit_comic($comic_title,$comic_writer,$comic_page,$comic_price,$comic_genre,$comic_release_date,$comic_comment,$comic_image,$comic_banner)
	{
		$comic_hash_code = "$comic_title-$comic_writer-$comic_release_date";
		$filled_data = "comic_title='$comic_title',comic_writer='$comic_writer',comic_page=$comic_page,comic_price=$comic_price,comic_genre='$comic_genre',comic_release_date='$comic_release_date',comic_comment='$comic_comment',hash_code='$hash_code'";
		$affected_table = "comic";

		$result_action = false;
		$sql_syntax = "UPDATE $affected_table SET $filled_data";
		$result = mysqli_query($server);

		if($result){
			$result_action = true;
		}

		return $result_action;
	}
?>
