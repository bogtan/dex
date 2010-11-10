<li id='<?php echo $track["playlist_track_id"]; ?>'>
  <span class='play_track' />
  <span class='track_artist'><?php echo $track["artist_name"]; ?></span>
  <span class='track_song'><?php echo stripslashes($track['song_title']); ?></span>
  <div class='track_menu'>
	   <a class='iframe track_options' href='<?php echo site_url('meta/ajaxData/track_options/'.$track['playlist_track_id']); ?>'>Options</a>
    <span class='sort_handle'>
    	<img src='<?php echo site_url()."/assets/images/sort_handle.png"; ?>' />
    </span>
  </div>
  <input type='hidden' class='album_title' value='<?php echo  $track['album_title']; ?>' />
  <input type='hidden' class='album_id' value='<?php echo $track['album_id']; ?>' />
  <input type='hidden' class='artist_id' value='<?php echo $track['artist_id']; ?>' />
  <input type='hidden' class='song_id' value='<?php echo  $track['song_id']; ?>' />
 <br style='clear: both;' />
</li>