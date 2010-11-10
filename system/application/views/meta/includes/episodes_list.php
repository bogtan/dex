<?php if(count($episodes)==0) { ?>
No episodes found. Talk to the programming director.
<?php } else { ?>
<ul class='list'>
	<?php foreach($episodes as $key=>$val): ?>
		<li>
			<a href="<?php echo site_url('meta/playlist/'.$val['nid']); ?>" class='episode_editor'>
				<?php echo $val['title']." ".date("j F Y", strtotime($val['field_episode_time_value'])-(60*60*5)); ?>
			</a>
		</li>
	<?php endforeach; ?>
</ul>
<?php } ?>