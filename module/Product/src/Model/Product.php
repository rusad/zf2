<?php

namespace Product\Model;

class Product
{
    public $id;
    public $name;
    public $description;
    public $price;
    public $photo;

    public function exchangeArray(array $data)
    {
        $this->id = !empty($data['id']) ? $data['id'] : null;
        $this->name = !empty($data['name']) ? $data['name'] : null;
        $this->description  = !empty($data['description']) ? $data['description'] : null;
        $this->price  = !empty($data['price']) ? $data['price'] : null;
        $this->photo  = !empty($data['photo']) ? $data['photo'] : null;
    }
}