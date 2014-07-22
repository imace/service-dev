<?php
App::uses('AppModel', 'Model');
/**
 * Popularity Model
 *
 */
class Popularity extends AppModel {
        var $name = 'Popularity';

/**
 * Use table
 *
 * @var mixed False or table name
 */
	public $useTable = 'popularity';
        
        public $belongsTo = array('Supporter' => array (
            'className' => 'Supporter',
            'foreignKey' => 'supporterUserId'
        ),'User' => array (
            'className' => 'User',
            'foreignKey' => 'ownerUserId'
        ));
}
