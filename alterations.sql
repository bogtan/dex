/* music_albums -> albums */
ALTER TABLE `music_albums` 
CHANGE `album_id` `id` INT( 11 ) NOT NULL AUTO_INCREMENT,
CHANGE `album_title` `title` VARCHAR( 300 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
CHANGE `album_date` `release_date` DATE NOT NULL ,
CHANGE `album_desc` `description` VARCHAR( 1000 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
CHANGE `date_added` `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
DROP COLUMN `flag`,
DROP COLUMN `label_id`;

ALTER TABLE `music_albums` 
MODIFY COLUMN `release_date` DATE AFTER `description`;

RENAME TABLE `music_albums` TO `albums`;

/* music_artists -> artists */
ALTER TABLE `music_artists` 
CHANGE `artist_id` `id` INT( 11 ) NOT NULL AUTO_INCREMENT ,
CHANGE `artist_name` `name` VARCHAR( 200 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
CHANGE `artist_lastfm` `lastfm_url` VARCHAR( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
CHANGE `artist_desc` `description` VARCHAR( 1000 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
CHANGE `artist_listeners` `listeners` INT( 11 ) NOT NULL ,
CHANGE `date_validated` `validated` TIMESTAMP NOT NULL ,
CHANGE `date_added` `created` TIMESTAMP NOT NULL,
DROP COLUMN `flag`,
DROP COLUMN `valid`;

ALTER TABLE `music_artists`
MODIFY COLUMN `lastfm_url` VARCHAR( 100 ) AFTER `listeners`;

RENAME TABLE `music_artists` TO `artists`;

/* music_songs -> songs */
ALTER TABLE `music_songs` 
CHANGE `song_id` `id` INT( 11 ) NOT NULL AUTO_INCREMENT,
CHANGE `song_title` `title` VARCHAR( 255 ) CHARACTER SET utf8 NOT NULL ,
CHANGE `song_track` `track_number` INT( 3 ) NOT NULL ,
CHANGE `song_mbid` `musicbrainz_id` VARCHAR( 100 ) CHARACTER SET utf8 NOT NULL ,
CHANGE `date_added` `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
DROP COLUMN `flag`;

ALTER TABLE `music_songs` 
MODIFY COLUMN `musicbrainz_id` VARCHAR( 100 ) AFTER `album_id`,
MODIFY COLUMN `track_number` INT (3) AFTER `title`;

RENAME TABLE `music_songs` TO `songs`;

/* music_playlists -> playlists */
ALTER TABLE `music_playlists` 
CHANGE `playlist_track_id` `id` INT( 11 ) NOT NULL AUTO_INCREMENT ,
CHANGE `episode_id` `episode_id` INT( 11 ) NOT NULL ,
CHANGE `song_id` `song_id` INT( 11 ) NOT NULL ,
CHANGE `sort_order` `sort_order` INT( 11 ) NOT NULL ,
CHANGE `date_added` `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
CHANGE `status` `status` INT( 1 ) NOT NULL DEFAULT '1';

ALTER TABLE `music_playlists` 
MODIFY COLUMN `status` INT(1) AFTER `sort_order`;

RENAME TABLE `music_playlists` TO `tracks`;

/* music_logs -> logs */
ALTER TABLE `music_log` 
CHANGE `log_id` `id` INT( 11 ) NOT NULL AUTO_INCREMENT ,
CHANGE `log_time` `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
CHANGE `playlist_track_id` `track_id` INT( 11 ) NOT NULL;

ALTER TABLE `music_log`
MODIFY COLUMN `track_id` INT(11) AFTER `id`;

RENAME TABLE `music_log` TO `logs`;

/* music_shows -> shows */
ALTER TABLE `music_shows` 
CHANGE `show_id` `id` INT( 11 ) NOT NULL AUTO_INCREMENT ,
CHANGE `show_title` `title` VARCHAR( 200 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
CHANGE `show_desc` `description` VARCHAR( 10000 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
CHANGE `show_status` `status` INT( 1 ) NOT NULL DEFAULT '1' COMMENT '1=active; 0=not active',
DROP COLUMN `show_dj`,
ADD `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

RENAME TABLE `music_shows` TO `shows`;

/* music_episodes -> episodes */
ALTER TABLE `music_episodes` 
CHANGE `episode_id` `id` INT( 11 ) NOT NULL AUTO_INCREMENT ,
CHANGE `episode_title` `title` VARCHAR( 1000 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
CHANGE `episode_desc` `description` VARCHAR( 10000 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
CHANGE `episode_number` `number` INT( 5 ) NOT NULL DEFAULT 0,
CHANGE `episode_start` `start` TIMESTAMP NOT NULL DEFAULT 0,
CHANGE `episode_stop` `stop` TIMESTAMP NOT NULL ,
CHANGE `show_id` `show_id` INT( 11 ) NOT NULL;

ALTER TABLE `music_episodes`
ADD `status` INT( 1 ) NOT NULL DEFAULT '1' COMMENT '1=active; 0=not active',
ADD `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

RENAME TABLE `music_episodes` to `episodes`;

/* rename tables*/
RENAME TABLE `music_exceptions` to `exceptions`;
RENAME TABLE `music_flags` to `flags`;

/* drop tables */
DROP TABLE `music_labels`;
DROP TABLE `music_genres`;

