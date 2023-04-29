<?php
    require_once 'datatable.php';
    require_once 'acceso-seguro.php';
    if($_SESSION['nivelacceso']!= "Administrador"){
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
                <p class="card-title mt-1" style="font-size: 22px" id="Aviso">Registro de Usuario</p>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
                <form action="" id="formularioUsuario">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-12">
                                <label for="nombres">Nombres:</label>
                                <input id="nombres" class="form-control form-control-border">
                            </div>
                            <div class="col-md-12 mt-3">
                                <label for="apellidos">Apellidos:</label>
                                <input id="apellidos" class="form-control form-control-border">
                            </div>
                            <div class="col-md-12 mt-3">
                                <label for="nombreusuario">Nombre de usuario:</label>
                                <input id="nombreusuario" class="form-control form-control-border">
                            </div>
                            <div class="col-md-12 mt-3">
                                <label for="nivelacceso">Nivel de acceso:</label>
                                <select id="nivelacceso" class="form-control form-control-border">
                                    <option value="">Seleccione</option>
                                    <option value="A">Administrador</option>
                                    <option value="F">Farmacia</option>
                                    <option value="M">Médico</option>
                                </select>
                                <input type="text" id="idusuariomod" class="form-control form-control-border asignar" disabled>
                            </div>
                            <div class="col-md-12 mt-3">
                                <label for="email">Email:</label>
                                <input id="email" class="form-control form-control-border">
                            </div>
                        </div>
                    </div>
                    <p>Nota: La contraseña por defecto será 123456</p>
                </form>
            </div>
            <!-- /.card-body -->
            <div class="card-footer text-right bg-white">
                <button type="reset" class="btn bg-gradient-secondary" id="cancelar">Cancelar</button>
                <button type="button" class="btn bg-gradient-info" id="registrar">Guardar</button>
                <button type="button" class="btn bg-gradient-info asignar" id="actualizar">Actualizar</button>
            </div>
            <!-- /.card-footer -->
        </div>
    </div>
    <div class="col-md-8">
        <div  class=" card card-outline card-info">
            <div class="card-header">
                <p class="card-title" style="font-size: 22px">Lista de Usuarios</p>
            </div>
            <div class="card-body table-responsive">
                <table class="table" id="tablaUsuario">
                    <thead>
                        <tr>
                            <th class="text-center">N°</th>
                            <th class="text-center">Apellidos</th>
                            <th class="text-center">Nombres</th>
                            <th class="text-center">Usuario</th>
                            <th class="text-center">Nivel de usuario</th>
                            <th class="text-center">Operaciones</th>
                        </tr>
                    </thead>
                    <tbody class="table" id="datosUsuario">
                        <!-- Se carga de manera dinamica -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="js/usuarios.js"></script>

