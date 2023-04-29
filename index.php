<?php 
	session_start(); 
	if (isset($_SESSION['acceso'])){
		if ($_SESSION['acceso'] == true){
			header('Location:main.php');
		}
	}
?>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Clínica FamiSalud</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/favicon.png"/>
<!--===============================================================================================-->
	<!-- <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css"> -->
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/scroll.css">
<!--===============================================================================================-->
</head>
<body style="background-color: #666666;">
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" autocomplete="off">
					<span class="login100-form-title p-b-43">
						Farmacia Famisalud
					</span>
					
					<div class="wrap-input100 validate-input" data-validate = "Por favor escriba su usuario">
						<input class="input100" type="text" name="email" id="usuario">
						<span class="focus-input100"></span>
						<span class="label-input100">Usuario</span>
					</div>
					
					
					<div class="wrap-input100 validate-input" data-validate="Por favor escriba su contraseña">
						<input class="input100" type="password" id="clave" name="pass">
						<span class="focus-input100"></span>
						<span class="label-input100">Contraseña</span>
					</div>
			
					<div class="flex-sb-m w-full p-t-3 mb-3">
						<div></div>
						<div>
							<button href="#" style="color:#545454" id="recuperaracceso" data-toggle="modal" data-target="#modelId" class="text1">¿Olvidaste tu contraseña?</button>
						</div>
					</div>

					<div class="container-login100-form-btn">
						<a type="btn" class="login100-form-btn" style="background-color:#648BE4; color: white" id="login">Login</a>
					</div>
					
					<!-- registro de personal -->
					<div class="mt-4 text-center">
						¿Todavia no eres usuario?<a href="registro.php" class="" style="text-decoration: none; color:#648BE4;">&nbsp; Registrar Personal</a>
					</div>
					
				</form>

				<div class="login100-more" style="background-image: url('images/famisalud.png');">
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Recuperar contraseña</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
            </div>
            <div class="modal-body">
                <div>
                    <form action="" id="modificar-persona">
						<label for="correo">Correo</label>
						<div class="input-group">
							<input type="text" class="form-control" id="correoverificacion" placeholder="Escriba su correo">
							<div class="input-group-append">
								<div type="button" class="btn"  id="verificarCorreo" style="background-color:#648BE4; color: white">Enviar</div>
							</div>
						</div>
						<br>
              <div id="cajavalidacioncodigo" style="display: none;">
							<div class="row">
								<label for="verificacion" class="mt-3 ml-3 mr-2">Código de verificación</label>
								<div id="count-down-timer" class="mt-3"></div>
							</div>
							<div class="input-group">
								<div class="input-group-append">
									<input type="text" class="form-control" id="caja1" style="text-align:center; font-size:1em;" maxlength="1">&nbsp;
									<input type="text" class="form-control" id="caja2" style="text-align:center; font-size:1em;" maxlength="1">&nbsp;
									<input type="text" class="form-control" id="caja3" style="text-align:center; font-size:1em;" maxlength="1">&nbsp;
									
									<input type="text" class="form-control" id="caja4" style="text-align:center; font-size:1em;" maxlength="1">&nbsp;
									<input type="text" class="form-control" id="caja5" style="text-align:center; font-size:1em;" maxlength="1">&nbsp;
									<input type="text" class="form-control" id="caja6" style="text-align:center; font-size:1em;" maxlength="1">&nbsp;
								</div>
							</div>
								<button type="button" id="validar" class="btn-block btn btn-md mt-3" style="background-color:#648BE4; color: white">Validar</button>
							<br>
						</div>
					</form>
                </div>

            </div>
        </div>
    </div>
</div>


<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->

<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</body>
</html>

<script src="js/validacion.js"></script>
<script src="js/alertas.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script>	
	$(document).ready(function(){
		function cambiarCaja(nombrecaja, destino){
			$(nombrecaja).keyup(function(e){
				$tecla= e.keyCode;
				// console.log($tecla);
				if($tecla >  64  && $tecla < 91){
					$(destino).focus();
					console.log("esta es una letra");
				}else if($tecla > 191 && $tecla < 193){
					$(destino).focus();
					console.log("esta es la letra ñ");
				}else if($tecla > 47 && $tecla < 58){
					$(destino).focus();
					console.log("esta son numeros");
				}else if($tecla > 95 && $tecla < 106){
					$(destino).focus();
					console.log("esta son numeros de la derecha");
				}else{
					console.log("esta tecla no vale");
				}
			});
		}

		$("#caja1").keyup(cambiarCaja("#caja1","#caja2"));
		$("#caja2").keyup(cambiarCaja("#caja2","#caja3"));
		$("#caja3").keyup(cambiarCaja("#caja3","#caja4"));
		$("#caja4").keyup(cambiarCaja("#caja4","#caja5"));
		$("#caja5").keyup(cambiarCaja("#caja5","#caja6"));
		$("#caja6").keyup(cambiarCaja("#caja6","#validar"));

		function iniciarSesion(){
			if ($("#usuario").val() == "" || $("#clave").val() == ""){
				Swal.fire({
					icon: 'warning',
					title: 'Complete los campos solicitados',
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
			}else{
				$.ajax({
					url: 'controllers/Usuario.controller.php',
					type: 'GET',
					data: {
						op          	: 'login',
						nombreusuario   : $("#usuario").val(),
						clave			: $("#clave").val()
					},
					success: function (result){
						console.log(result);
						if ($.trim(result) == ""){
							window.location.href = 'main.php'
						}else{
							Swal.fire(result);
						}
					}
				});
			}
      	}
		$("#login").click(iniciarSesion);
		$("#clave").keypress(function (e){
			if (e.keyCode == 13){
				iniciarSesion();
			}
    	});	

		$("#correoverificacion").keypress(function (e){
			if (e.keyCode == 13){
				iniciarSesion();
			}
    	});	

	});
</script>