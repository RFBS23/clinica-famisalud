<?php

require_once '../core/model.master.php';

class Producto extends ModelMaster{

  public function registrarProducto(array $data){
      try{
        parent::execProcedure($data, "spu_productos_registro", false);
      }catch(Exception $error){
        die($error->getMessage());
      }
    }
    
  public function nombreproductoYaRegistrado(array $data){
    try{
        return parent::execProcedureLogin($data, "spu_nombreproducto_registrado", true);
    }
    catch (Exception $error){
        die($error->getMessage());
    }
  }

  public function eliminarProducto(array $data){
    try{
        parent::deleteRows($data, "spu_eliminar_producto");
    }catch(Exception $error){
        die($error->getMessage());
    }
  }

  public function modificarProducto(array $data){
    try{
        parent::execProcedure($data, "spu_productos_modificar", false);
    }catch(Exception $error){
        die($error->getMessage());
    }
  } 

  public function getProducto(array $data){
      try{
          return parent::execProcedure($data, "spu_productos_getdata", true);
      }catch(Exception $error){
          die($error->getMessage());
      }
  }

  public function filtrarCategoria(array $data){
    try{
        return parent::execProcedure($data, "spu_productos_filtrar_categorias", true);
    }catch(Exception $error){
        die($error->getMessage());
    }
  }
}
?>