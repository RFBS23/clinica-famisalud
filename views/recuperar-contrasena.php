<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recuperar Contraseña</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="icon" href="../images/contrasena.png">
    <link rel="stylesheet" href="../dist/css/adminlte.min.css">
</head>

<body>
    <div class="container mt-5">
        <div class=" card card-outline card-info">
            <div class="card-header">
                <p class="card-title" style="font-size: 22px">Recuperar contraseña</p>
                <a href="../index.php">
                    <button style="background-color: white; font-size: 18px" type="button"class="btn btn-lg float-right"><i class="fas fa-search"></i> &nbsp;Ir a inicio de sesión</button>
                </a>
            </div>
            <div class="card-body">
                <form action="" id="formularioRecuperarContrasena">
                    <div class="form-group">
                        <label for="contrasenanueva">Contraseña nueva</label>
                        <input type="password" class="form-control form-control-border" id="contrasenanueva"
                            placeholder="Escriba su nueva contraseña">
                    </div>
                    <div class="form-group">
                        <label for="contrasenanuevaconfirmada">Confirmar contraseña nueva</label>
                        <input type="password" class="form-control form-control-border" id="contrasenanuevaconfirmada"
                            placeholder="Repita su nueva contraseña">
                    </div>
                </form>
            </div>
            <!-- /.card-body -->
            <div class="card-footer text-right bg-white">
                <button type="button" class="btn bg-gradient-secondary " id="cancelar">Cancelar</button>
                <button type="button" class="btn bg-gradient-info" id="recuperarContrasena">Recuperar</button>
            </div>
            <!-- /.card-footer -->
        </div>
    </div>

</body>

</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
$(document).ready(function() {
    function mostrarAlerta(icon,title){
        Swal.fire({
            icon: icon,
            title: title,
            position: 'bottom-end',
            timerProgressBar: true,
            timer: 1000,
            toast:true,
            showConfirmButton:false,
            didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
            toast.addEventListener('mouseleave', Swal.resumeTimer)
            }
        });
    }

    function cancelarRecuperacionContraseña() {
        $("#formularioRecuperarContrasena")[0].reset();
    }

    function recuperarClave() {
        var clavenueva = $("#contrasenanueva").val();
        var claveconfirmar = $("#contrasenanuevaconfirmada").val();
        var idusuariorecuperacion = localStorage.getItem('idusuario');
        if(clavenueva == "" || claveconfirmar == "" || idusuariorecuperacion == null){
            mostrarAlerta("warning", "¡Completar los campos necesarios!");
        }else{
            if (clavenueva != claveconfirmar) {
                mostrarAlerta("error", "¡Las contraseñas son diferentes!");
            } else {
                $.ajax({
                    url: '../controllers/Usuario.controller.php',
                    type: 'GET',
                    data: {
                        'op': 'recuperarClave',
                        'idusuario': idusuariorecuperacion,
                        'clave': claveconfirmar
                    },
                    success: function(result) {
                        mostrarAlerta("success", "¡Actualizado con éxito!");
                    }
                });
            }
        }
    }

    $("#recuperarContrasena").click(recuperarClave);

    $("#cancelar").click(cancelarRecuperacionContraseña);
});
</script>