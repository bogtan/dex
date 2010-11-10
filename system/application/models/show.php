<?php

/**
 * 	Class definition for shows
 * 	@author Brandon Jackson
 */

class Show extends DataMapper {
	
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
	function __construct( $data = NULL ) 
	{
		parent::__construct( $data );
	}	
}