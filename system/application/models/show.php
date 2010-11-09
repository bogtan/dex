<?php

/**
 * 	Class definition for shows
 * 	@author Brandon Jackson
 */

class Show extends MY_Model {
	
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