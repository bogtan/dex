<?php
$type = $choices[0];
unset($choices[0]);
?>
<div id='choices'>
	<h2>Which album would you like?</h2>
	<ul>
	<?php foreach ($choices as $key=>$val){
		if ( $type == "existing" )
		{
			$rel = htmlentities("existing&&&".$val['song_id']);
		}
		elseif ( $type == "new" )
		{
			$rel = htmlentities("new&&&".$this->song_id."&&&".$val['album']);
		} ?>
		<li>
			<img src="<?php echo $val['art'];?>" rel="<?php echo $rel; ?>" />
			<span><?php echo $val['album']; ?></span>
		</li>
	} ?>
	</ul>
	<br style='clear: both;' />
</div>