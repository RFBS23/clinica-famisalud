<?php
    require_once 'datatable.php';
    require_once 'acceso-seguro.php';
    if($_SESSION['nivelacceso'] == 'Médico'){
        echo "<strong>No tiene el nivel de acceso requerido</strong>";
        exit();
    }
?>

<style>
    .asignar{
        display: none !important;
    }
    body::-webkit-scrollbar {
        display: none;
    }
    .modal-body::-webkit-scrollbar {
        display: none;
    }
    /*logo 00webhost*/
    img[src*="https://cdn.000webhost.com/000webhost/logo/footer-powered-by-000webhost-white2.png"]{
        display: none;
    }
</style>

<div class="row">
    <div class="col-md-4">
        <div class=" card card-outline card-info">
            <div class="card-header">
                <p class="card-title mt-1" style="font-size: 22px" id="Aviso">Registro de Productos</p>

            </div>
            <!-- /.card-header -->
            <div class="card-body">
                <form action="" id="formularioFarmacia">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-12 mt-3">
                                <label for="idcategoria">Categoría</label>
                                <select class="form-control form-control-border" name="idcategoria" id="idcategoria">
                                </select>
                            </div>
                            <div class="col-md-12 mt-3">
                                <label for="nombreproducto">Producto:</label>
                                <textarea name="" id="nombreproducto"   data-idproductomod="" class="form-control"></textarea>
                                <input type="text" id="idproductomod" class="form-control form-control-border asignar" disabled>
                            </div>
                            <div class="col-md-12 mt-3">
                                <label for="principiosactivos">Principios activos:</label>
                                <textarea name="" id="principiosactivos" class="form-control"></textarea>
                            </div>
                            <div class="col-md-12 mt-3">
                                <label for="formafarmaceutica">Forma farmacéutica:</label>
                                <textarea name="" id="formafarmaceutica" class="form-control"></textarea>
                            </div>
                            <div class="col-md-12 mt-3">
                                <label for="descripcion">Observación:</label>
                                <textarea name="" id="descripcion" class="form-control"></textarea>
                            </div>
                            <div class="col-md-12 mt-3">
                                <label for="fechavencimiento">Fecha de Vencimiento:</label>
                                <input type="date" id="fechavencimiento" class="form-control form-control-border">
                            </div>

                        </div>
                    </div>
                </form>
            </div>
            <!-- /.card-body -->
            <div class="card-footer text-right bg-white">
                <button type="button" class="btn bg-gradient-secondary" id="cancelar">Cancelar</button>
                <button type="button" class="btn bg-gradient-info" id="registrar">Guardar</button>
                <button type="button" class="btn bg-gradient-info asignar" id="actualizar">Actualizar</button>
            </div>
            <!-- /.card-footer -->
        </div>
    </div>
    <div class="col-md-8">
        <div  class=" card card-outline card-info">
            <div class="card-header">
                <div class="row col-md-12">
                    <div class="col-md-9">
                        <p class="card-title" style="font-size: 22px">Lista de Productos</p>
                    </div>
                    <div class="col-md-3">
                        <select name="categoriaselect" id="categoriaselect" class="form-control float-right">
                        </select>
                    </div>
                </div>
            </div>
            <div class="card-body table-responsive">
                <table class="table text-center" id="tablaProducto">
                    <thead>
                        <tr>
                            <th class="text-center">N°</th>
                            <th class="text-center">Categoría</th>
                            <th class="text-center">Producto</th>
                            <th class="text-center">Principios activos</th>
                            <th class="text-center">Vencimiento</th>
                            <th class="text-center">Operaciones</th>
                        </tr>
                    </thead>
                    <tbody class="table" id="tablaProductolistar">
                        <!-- Se carga de manera dinamica -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="js/productos.js"></script>
