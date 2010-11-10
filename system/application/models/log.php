<?php

/**
 * 	Class definition for logs
 * 	@author Brandon Jackson
 */

class Log extends DataMapper {
	
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
}