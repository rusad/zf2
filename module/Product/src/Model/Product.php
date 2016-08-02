<?php

namespace Product\Model;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;
use Zend\InputFilter\FileInput;

class Product implements InputFilterAwareInterface
{
    public $id;
    public $name;
    public $description;
    public $price;
    public $photo;
    protected $inputFilter;

    public function exchangeArray(array $data)
    {
        $this->id           = !empty($data['id']) ? $data['id'] : null;
        $this->name         = !empty($data['name']) ? $data['name'] : null;
        $this->description  = !empty($data['description']) ? $data['description'] : null;
        $this->price        = !empty($data['price']) ? $data['price'] : null;
        $this->photo        = !is_array($data['photo']) ? $data['photo'] : '/'.$data['photo']['tmp_name'];
    }

    public function setInputFilter(InputFilterInterface $inputFilter)
    {
        throw new \Exception("Not used");
    }

    public function getInputFilter()
    {
        if (!$this->inputFilter) {
            $inputFilter = new InputFilter();

            $inputFilter->add(array(
                'name'     => 'id',
                'required' => true,
                'filters'  => array(
                    array('name' => 'Int'),
                ),
            ));

            $inputFilter->add(array(
                'name'     => 'name',
                'required' => true,
                'filters'  => array(
                    array('name' => 'StripTags'),
                    array('name' => 'StringTrim'),
                ),
                'validators' => array(
                    array(
                        'name'    => 'StringLength',
                        'options' => array(
                            'encoding' => 'UTF-8',
                            'min'      => 1,
                            'max'      => 100,
                        ),
                    ),
                ),
            ));

            $inputFilter->add(array(
                'name'     => 'description',
                'required' => true,
                'filters'  => array(
                    array('name' => 'StripTags'),
                    array('name' => 'StringTrim'),
                ),
                'validators' => array(
                    array(
                        'name'    => 'StringLength',
                        'options' => array(
                            'encoding' => 'UTF-8',
                            'min'      => 10,
                            'max'      => 500,
                        ),
                    ),
                ),
            ));

            $file = new FileInput('photo');
            $file->setAllowEmpty(true);
            $file->getFilterChain()->attachByName(
                'filerenameupload',
                array(
                    'target'          => 'public/img/',
                    'overwrite'       => true,
                    'use_upload_name' => true,
                    'randomize' => true,
                )
            );
            $inputFilter->add($file);

            $inputFilter->add(array(
                'name'     => 'photo',
                'validators' => array(
                    array(
                        'name' => 'Zend\Validator\File\Size',
                        'options' => array(
                            'min' => 120,
                            'max' => 20000,
                        ),
                    ),
                ),
            ));

            $this->inputFilter = $inputFilter;
        }

        return $this->inputFilter;
    }

    public function getArrayCopy()
    {
        return get_object_vars($this);
    }
}