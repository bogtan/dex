<?php

/**
 * 	Class definition for episodes
 * 	@author Brandon Jackson
 */

class Episode extends MY_Model {
	
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