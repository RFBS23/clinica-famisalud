<?php
    require_once 'acceso-seguro.php';
?>

<div class=" card card-outline card-info">
    <div class="card-header">
        <p class="card-title mt-2" style="font-size: 22px">Cambiar Contraseña</p>
    </div>
    <!-- /.card-header -->
    
        <div class="card-body">
        <form action="" id="formularioActualizarContraseña">
            <div class="form-group">
                <div class="row">
                    <div class="col-md-12">
                        <label for="claveactual">Contraseña Actual</label>
                        <input type="text" class="form-control form-control-border" id="claveactual" placeholder="Escriba su contraseña actual">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="clavenueva">Contraseña Nueva</label>
                <input type="text" class="form-control form-control-border" id="clavenueva" placeholder="Escriba su nueva contraseña">
            </div>
            <div class="form-group">
                <label for="clavenuevaconfirmada">Confirmar contraseña nueva</label>
                <input type="text" class="form-control form-control-border" id="clavenuevaconfirmada" placeholder="Repita su nueva contraseña">
            </div>
        </form>
    </div>
    <!-- /.card-body -->
        <div class="card-footer text-right bg-white">
        <button type="reset" class="btn bg-gradient-secondary " id="cancelar">Cancelar</button>
        <button type="button" class="btn bg-gradient-info" id="cambiarclave">Actualizar</button>
    </div>
    <!-- /.card-footer -->
</div>

<script src="js/usuarios.js"></script>