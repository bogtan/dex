<?php

/**
 * 	Class definition for artists
 * 	@author Brandon Jackson
 */

class Artist extends DataMapper {
	
	/**
	*	CodeIgniter Super Object
	*	@var object $CI
	*/
	protected $CI;

	/**
	*	Has-One Relationships
	*	@var array $has_one
	*/
	var $has_one = array();
	
	/**
	*	Has-Many Relationships
	*	@var array $has_many
	*/
	var $has_many = array();
	
	/**
	*	Validation array
	*	@var array $validation
	*/
	var $validation = array();
	
	/**
	*	Constructor. 
	*	$data can either be a number or array.
	*	
	*	@param mixed $data
	*/
	function __construct( $id = NULL ) 
	{
		parent::__construct( $id );
		$this->CI =& get_instance();
	}
	
	/**
	*	Merge two artists
	*
	*	@param int $new_id
	*	@param int $old_id
	*	@return boolean
	*/
	function merge($new_id,$old_id)
	{
		//Add an exception so this never happens again.
		$result = $this->CI->db->select('name')->where('id', $old_id)->get('artists')->row();

		$exception_data = array(
			"type"=>"artist-to-id",
			"input"=>$result->name, 
			"output"=>$new_id
		); 
		$this->CI->db->insert("exceptions", $exception_data);
		
		$data = array("artist_id"=>$new_id);
		$where = array("artist_id"=>$old_id);
		
		// update the song table
		$this->CI->db->update('songs',$data, $where);
		
		// update the album table
		$this->CI->db->update('albums',$data, $where);
		
		// delete invalid artist row
		$this->CI->db->where('id', $invalid)->delete('artists');
		
		return TRUE;
	}
}