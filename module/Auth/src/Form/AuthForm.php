<?php
namespace Auth\Form;

use Zend\Form\Form;

class AuthForm extends Form
{
    public function __construct($name = null)
    {
        parent::__construct('auth');
        $this->setAttribute('method', 'post');
        $this->setAttribute('class', 'form-horizontal');

        $this->add(array(
            'name' => 'usr_name',
            'type'  => 'text',
            'options' => array(
                'label' => 'Username',
                
            ),
            'attributes' => array(
                'class' => 'form-control',
                'placeholder' => 'Login',
            ),
        ));

        $this->add(array(
            'name' => 'usr_password',
            'type'  => 'password',
            'options' => array(
                'label' => 'Password',
            ),
            'attributes' => array(
                'class' => 'form-control',
                'placeholder' => 'Password',
            ),
        ));
        
        $this->add(array(
            'name' => 'rememberme',
			'type' => 'checkbox', // 'Zend\Form\Element\Checkbox',			
            'options' => array(
                'label' => 'Remember Me',
//				'checked_value' => 'true', without value here will be 1
//				'unchecked_value' => 'false', // witll be 1
            ),
            'attributes' => array(
                'class' => 'checkbox',
            ),
        ));			
        $this->add(array(
            'name' => 'submit',
            'type'  => 'submit',
            'attributes' => array(
                'value' => 'Go',
                'id' => 'submitbutton',
                'class' => 'btn btn-default',
            ),
        )); 
    }
}