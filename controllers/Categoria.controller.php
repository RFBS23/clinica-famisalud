<?php
session_start();

require_once '../models/Categoria.php';

if (isset($_GET['op'])){

  $categoria = new Categoria();

    
    if($_GET['op'] == 'cargarCategoria'){
      $datosObtenidos = $categoria->cargarCategoria();
        echo "<option value=''>Seleccione</option>";
        foreach($datosObtenidos as $valor){
            echo"
            <option value='$valor->idcategoria'>$valor->categoria</option>
            ";
        }
    //   echo json_encode($data);
    }
}
?>