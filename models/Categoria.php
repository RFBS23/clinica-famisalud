<?php

require_once '../core/model.master.php';

class Categoria extends ModelMaster{

    public function cargarCategoria(){
        try{
          return parent::getRows("spu_categorias_cargar");
        }catch(Exception $error){
          die($error->getMessage());
        }
      }

}
?>