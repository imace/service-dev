<?php
App::uses('AppController', 'Controller');
/**
 * Popularities Controller
 *
 * @property Popularity $Popularity
 * @property PaginatorComponent $Paginator
 */
class PopularitiesController extends AppController {

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
		$this->Popularity->recursive = 0;
		$this->set('popularities', $this->Paginator->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		if (!$this->Popularity->exists($id)) {
			throw new NotFoundException(__('Invalid popularity'));
		}
		$options = array('conditions' => array('Popularity.' . $this->Popularity->primaryKey => $id));
		$this->set('popularity', $this->Popularity->find('first', $options));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		if ($this->request->is('post')) {
			$this->Popularity->create();
			if ($this->Popularity->save($this->request->data)) {
				$this->Session->setFlash(__('The popularity has been saved.'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The popularity could not be saved. Please, try again.'));
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
		if (!$this->Popularity->exists($id)) {
			throw new NotFoundException(__('Invalid popularity'));
		}
		if ($this->request->is(array('post', 'put'))) {
			if ($this->Popularity->save($this->request->data)) {
				$this->Session->setFlash(__('The popularity has been saved.'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The popularity could not be saved. Please, try again.'));
			}
		} else {
			$options = array('conditions' => array('Popularity.' . $this->Popularity->primaryKey => $id));
			$this->request->data = $this->Popularity->find('first', $options);
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
		$this->Popularity->id = $id;
		if (!$this->Popularity->exists()) {
			throw new NotFoundException(__('Invalid popularity'));
		}
		$this->request->onlyAllow('post', 'delete');
		if ($this->Popularity->delete()) {
			$this->Session->setFlash(__('The popularity has been deleted.'));
		} else {
			$this->Session->setFlash(__('The popularity could not be deleted. Please, try again.'));
		}
		return $this->redirect(array('action' => 'index'));
	}
/**
 * delete method
 *
 * @throws NotFoundException
 * @param string $ownerId
 * @return array
 */   
        public function getSupporters($ownerId = null) {
            $this->Popularity->User->id = $ownerId;
	    if (!$this->Popularity->User->exists()) {
		    throw new NotFoundException(__('Invalid user'));
	    }
            
            $conditions = array(
                'Popularity.ownerUserId' => $ownerId
            );
            
            $contain = array('User', 'Popularity');
            
            $fields = array(
                'Supporter.nickname',
                'Popularity.createTime'
            );
            
            $order = array(
                'Popularity.createTime desc'
            );
            
            $options = array(
                    'conditions' => $conditions,
                    'contain' => $contain,
                    'fields' => $fields,
                    'order' => $order
            );
            
            $supporters = $this->Popularity->find('all', $options);
            debug($supporters);
            return $supporters;
        }
}
