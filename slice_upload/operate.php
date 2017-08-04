<?php
	
	function file_slice($fileName,$blocksize='')
	{
		$blocksize  = empty($blocksize) ? 1024*1024 : $blocksize ;
		if(file_exists($fileName)){
			$size = filesize($fileName);
			$orgin_fp = fopen($fileName,'rb');
			$i = 1;
			while($size > 0){
				$size -= $blocksize;
				$new_file_size = $size <= $blocksize ? ($size <= 0 ? $size + $blocksize : $blocksize ) : $blocksize;
				$block_fp = fopen($fileName.'_'.$i,'wb');
				fwrite($block_fp,fread($orgin_fp,$new_file_size));
				fclose($block_fp);
				$i++;
			}
		}
	}

	function file_merge()
	{

	}
	
	file_slice('./upload/test2.mp4');

