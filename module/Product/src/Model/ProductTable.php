<?php

namespace Product\Model;

use Zend\Db\TableGateway\TableGateway;

class ProductTable
{
    protected $tableGateway;

    public function __construct(TableGateway $tableGateway)
    {
         $this->tableGateway = $tableGateway;
    }

    public function fetchAll()
    {
        return $this->tableGateway->select();
    }

    public function getProduct($id)
    {
        $id = (int) $id;
        $rowset = $this->tableGateway->select(['id' => $id]);
        $row = $rowset->current();
        
        if (! $row) {
            throw new \Exception("Could not find row $id");
        }

        return $row;
    }

    public function saveProduct(Product $product)
    {
        $data = [
            'name'        => $product->name,
            'description' => $product->description,
            'price'       => $product->price,
            'photo'       => $product->photo,
        ];

        $id = (int) $product->id;

        if ($id == 0) {
            $this->tableGateway->insert($data);
        } else {
            if ($this->getProduct($id)) {
                $this->tableGateway->update($data, array('id' => $id));
            } else {
                throw new \Exception('Album id does not exist');
            }
            
        }
    }

    public function deleteProduct($id)
    {
        $this->tableGateway->delete(['id' => (int) $id]);
    }
}
