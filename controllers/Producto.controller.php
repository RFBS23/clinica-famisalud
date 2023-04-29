<?php
session_start();

require_once '../models/Producto.php';
require_once '../models/Serverside.php';

if (isset($_GET['op'])){

  $producto = new Producto();

    if($_GET['op'] == 'registrarProducto'){
        $producto->registrarProducto([
            'idcategoria' => $_GET['idcategoria'],
            'nombreproducto' => $_GET['nombreproducto'],
            'principiosactivos' => $_GET['principiosactivos'],
            'formafarmaceutica' => $_GET['formafarmaceutica'],
            'descripcion' => $_GET['descripcion'],
            'fechavencimiento' => $_GET['fechavencimiento']
        ]);
    }

    if ($_GET['op'] == 'nombreproductoYaRegistrado'){
        $datosObtenidos = $producto->nombreproductoYaRegistrado(["nombreproducto" => $_GET['nombreproducto']]);
    
        if(count($datosObtenidos) == 0){
          echo 2;
          return true;
        }
        else{
          echo 1;
          return false;
        }
    }

    if ($_GET['op'] == 'ListarProductoMedico'){
      $serverSide->get('vista_listar_productos_farmacia', 'idproducto', array('idproducto', 'nombreproducto', 'principiosactivos', 'formafarmaceutica', 'descripcion', 'fechavencimiento'));
    }

    if ($_GET['op'] == 'ListarProductoFarmacia'){
      $serverSide->get('vista_listar_productos_farmacia', 'idproducto', array('idproducto','categoria', 'nombreproducto', 'principiosactivos', 'fechavencimiento'));
    }

    if($_GET['op']== 'eliminarProducto'){
      $producto->eliminarProducto(["idproducto" => $_GET["idproducto"]]);
    }
    
    if($_GET['op'] == 'modificarProducto'){
      $producto->modificarProducto([
        "idproducto" => $_GET['idproducto'],
        "nombreproducto" => $_GET['nombreproducto'],
        "principiosactivos" => $_GET['principiosactivos'],
        "formafarmaceutica" => $_GET['formafarmaceutica'],
        "descripcion" => $_GET['descripcion'],
        "fechavencimiento" => $_GET['fechavencimiento']
      ]);
    }

    if($_GET['op'] == 'getProducto'){
      $data = $producto->getProducto(["idproducto" => $_GET['idproducto']]);
      echo json_encode($data);
    }

    if($_GET['op'] == 'filtrarCategorias'){
      $clave = $producto->filtrarCategoria(['idcategoria' => $_GET['idcategoria']]);
      $i = 1;
      foreach($clave as $valor){
          echo "
              <tr>
                  <td class='text-center'>$i</td>
                  <td class='text-center'>{$valor->categoria}</td>
                  <td class='text-center'>{$valor->nombreproducto}</td>
                  <td class='text-center'>{$valor->principiosactivos}</td>
                  <td class='text-center'>{$valor->fechavencimiento}</td>
                  <td class='text-center'>
                    <a  href='#' data-idproducto=$valor->idproducto class='btn btn-sm btn-outline-secondary modificar'>
                      <i class='fas fa-edit'></i>
                    </a>
                    <a  href='#' data-idproducto=$valor->idproducto class='btn btn-sm btn-outline-secondary eliminar'>
                      <i class='fas fa-trash-alt'></i>
                    </a>
                  </td>
              </tr>
          ";
          $i++;
      }
    }

    if($_GET['op'] == 'filtrarCategoriasMedicos'){
      $clave = $producto->filtrarCategoria(['idcategoria' => $_GET['idcategoria']]);
      $i = 1;
      foreach($clave as $valor){
          echo "
              <tr>
                  <td class='text-center'>$i</td>
                  <td class='text-center'>{$valor->nombreproducto}</td>
                  <td class='text-center'>{$valor->principiosactivos}</td>
                  <td class='text-center'>{$valor->formafarmaceutica}</td>
                  <td class='text-center'>{$valor->descripcion}</td>
                  <td class='text-center'>{$valor->fechavencimiento}</td>
              </tr>
          ";
          $i++;
      }
    }

}
?>