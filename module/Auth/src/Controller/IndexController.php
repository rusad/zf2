<?php
namespace Auth\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

use Zend\Authentication\Result;
use Zend\Authentication\AuthenticationService;
use Zend\Authentication\Storage\Session as SessionStorage;

use Zend\Db\Adapter\Adapter as DbAdapter;

use Zend\Authentication\Adapter\DbTable as AuthAdapter;

use Auth\Model\Auth;
use Auth\Form\AuthForm;

class IndexController extends AbstractActionController
{
    public function indexAction()
    {
		return new ViewModel();
	}	
	
    public function loginAction()
	{
		$form = new AuthForm();
		$form->get('submit')->setValue('Login');
		$messages = null;

		$request = $this->getRequest();
        if ($request->isPost()) {
			$authFormFilters = new Auth();
            $form->setInputFilter($authFormFilters->getInputFilter());	
			$form->setData($request->getPost());
			 if ($form->isValid()) {
				$data = $form->getData();
				$sm = $this->getServiceLocator();
				$dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
				
				$authAdapter = new AuthAdapter($dbAdapter,
										   'users', // there is a method setTableName to do the same
										   'usr_name', // there is a method setIdentityColumn to do the same
										   'usr_password', // there is a method setCredentialColumn to do the same
										   "MD5(?)"  // setCredentialTreatment(parametrized string) 'MD5(?)'
										   );
				$authAdapter
					->setIdentity($data['usr_name'])
					->setCredential($data['usr_password']);
								
				$auth = $sm->get('my_auth_service');
								
				$result = $auth->authenticate($authAdapter);			
				
				switch ($result->getCode()) {
					case Result::FAILURE_IDENTITY_NOT_FOUND:
						// do stuff for nonexistent identity
						break;

					case Result::FAILURE_CREDENTIAL_INVALID:
						// do stuff for invalid credential
						break;

					case Result::SUCCESS:
						$storage = $auth->getStorage();
						$storage->write($authAdapter->getResultRowObject(
							null,
							'usr_password'
						));
						$time = 60 * 60 * 24 * 14; // 14 days

						if ($data['rememberme']) {
							$sessionManager = new \Zend\Session\SessionManager();
							$sessionManager->rememberMe($time);
						}
						$this->redirect()->toRoute('product', array('controller' => 'product', 'action' => 'index'));
						break;

					default:
						// do stuff for other failure
						break;
				}				
				foreach ($result->getMessages() as $message) {
					$messages .= "$message\n"; 
				}			
			 }
		}
		return new ViewModel(array('form' => $form, 'messages' => $messages));
	}
	
	public function logoutAction()
	{
		$auth = $this->getServiceLocator()->get('my_auth_service');
		
		if ($auth->hasIdentity()) {
			$identity = $auth->getIdentity();
		}			
		
		$auth->clearIdentity();
		
		$sessionManager = new \Zend\Session\SessionManager();
		
		$sessionManager->forgetMe();
		
		return $this->redirect()->toRoute('auth/default', array('controller' => 'index', 'action' => 'login'));		
	}	
}