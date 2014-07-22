<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Supporters
 *
 * @author 28851006
 */
class Supporter extends AppModel{
    var $name = 'Supporter';
    var $useTable = 'user';
    
    var $hasAndBelongsToMany = array(
            'User' => array(
                'className' => 'User',
                'with' => 'Popularity'
            )
    );
}
