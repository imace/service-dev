<?php
// app/Controller/UsersController.php
class UsersController extends AppController {

    public function getMySupporters() {
    	$this->set('title_for_layout', '有谁支持我');
        $this->set('mySupporters', $this->User->find('all'));
    }
        
}
