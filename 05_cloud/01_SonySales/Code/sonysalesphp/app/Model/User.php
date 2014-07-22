<?php
App::uses('AppModel', 'Model');
/**
 * User Model
 *
 */
class User extends AppModel {
        var $name = 'User';

/**
 * Use table
 *
 * @var mixed False or table name
 */
	public $useTable = 'user';
        
        public $hasAndBelongsToMany = array(
            'Supporter' => array(
                'className' => 'Supporter',
                'with' => 'Popularity'
            )
        );

}
