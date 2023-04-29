<?php
    require_once 'datatable.php';
    require_once 'acceso-seguro.php';
    if($_SESSION['nivelacceso'] == 'Farmacia'){
        echo "<strong>No tiene el nivel de acceso requerido</strong>";
        exit();
    }
?>
<link rel="stylesheet" type="text/css" href="../css/scroll.css"
<div class="row">
    <div class="col-md-12">
        <div  class=" card card-outline card-info">
            <div class="card-header">
                <div class="row col-md-12">
                    <div class="col-md-9">
                        <p class="card-title" style="font-size: 22px">Lista de Productos</p>
                    </div>
                    <div class="col-md-3">
                        <select name="categoriaselect" id="categoriaselectmedico" class="form-control float-right">
                        </select>
                    </div>
                </div>
            </div>
            <div class="card-body table-responsive">
                <table class="table text-center" id="tablaProductoMedico">
                    <thead>
                        <tr>
                            <th class="text-center">N°</th>
                            <th class="text-center">Producto</th>
                            <th class="text-center">Principios activos</th>
                            <th class="text-center">Forma Farmacéutica</th>
                            <th class="text-center">Observaciones</th>
                            <th class="text-center">Fecha de Vencimiento</th>
                        </tr>
                    </thead>
                    <tbody class="table" id="tablaProductoMedicolistar">
                        <!-- Se carga de manera dinamica -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" /> -->
<script src="js/productos.js"></script>
