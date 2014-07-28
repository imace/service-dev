<?php
App::uses('AppController', 'Controller');
/**
 * Users Controller
 *
 * @property User $User
 * @property PaginatorComponent $Paginator
 */
class UsersController extends AppController {
    var $name = Users;
    var $uses = array('User', 'Supporters', 'Popularity');

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator');

/**
 * index method
 *
 * @return void
 */
	public function index() {
		$this->User->recursive = 0;
		$this->set('users', $this->Paginator->paginate());
	}
/**
 * index method
 *
 * @return void
 */
	public function test() {
		$this->User->recursive = 0;
		$this->set('users', $this->Paginator->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		if (!$this->User->exists($id)) {
			throw new NotFoundException(__('Invalid user'));
		}
		$options = array('conditions' => array('User.' . $this->User->primaryKey => $id));
		$this->set('user', $this->User->find('first', $options));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		if ($this->request->is('post')) {
			$this->User->create();
			if ($this->User->save($this->request->data)) {
				$this->Session->setFlash(__('The user has been saved.'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The user could not be saved. Please, try again.'));
			}
		}
	}

/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function edit($id = null) {
		if (!$this->User->exists($id)) {
			throw new NotFoundException(__('Invalid user'));
		}
		if ($this->request->is(array('post', 'put'))) {
			if ($this->User->save($this->request->data)) {
				$this->Session->setFlash(__('The user has been saved.'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The user could not be saved. Please, try again.'));
			}
		} else {
			$options = array('conditions' => array('User.' . $this->User->primaryKey => $id));
			$this->request->data = $this->User->find('first', $options);
		}
	}

/**
 * delete method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function delete($id = null) {
		$this->User->id = $id;
		if (!$this->User->exists()) {
			throw new NotFoundException(__('Invalid user'));
		}
		$this->request->onlyAllow('post', 'delete');
		if ($this->User->delete()) {
			$this->Session->setFlash(__('The user has been deleted.'));
		} else {
			$this->Session->setFlash(__('The user could not be deleted. Please, try again.'));
		}
		return $this->redirect(array('action' => 'index'));
	}
}

/**
 * get my infomations method
 *
 * @throws NotFoundException
 * @param string $openId
 * @return void
 */
        public function myInfos($openId = null) {
            $this->User->unbindModel(array('hasAndBelongsToMany'=>'Supporter'));
            $options = array('conditions' => array('User.openId'=> $openId));
            $info = $this->User->find('first', $options);
            
            $info['User']['pointsOrder'] = $this->getOrderInPoints($openId);
                
            $this->set('info', $info);
        }

        protected function getOrderInPoints($openId = null) {
            $fields = array(
                'User.openId'
            );
            
            $order = array(
                'User.points desc',
                'User.id desc',
            );
            
            $options = array(
                    'order' => $order,
                    'fields' => $fields
            );
            $orderedUsers =$this->User->find('list', $options);
            $inlegalUsers = $this->getInlegalUsers();
            $orderedLegalUsers = array_diff($orderedUsers, $inlegalUsers);
            $orderInPoints = array_search($openId,  array_values($orderedLegalUsers)) + 1;
            return $orderInPoints;
        }

        private function getInlegalUsers() {
            $this->User->bindModel(
                    array(
                        'hasOne'=>array(
                            'InlegalUser'=>array(
                                'className'=>'InlegalUser',
                                'foreignKey' => 'userId'
                                )
                            )
                        )
                    );
            $InlegalUsers = $this->User->InlegalUser->find('list', array('fields'=>array('userId')));
            return $InlegalUsers;
        }
