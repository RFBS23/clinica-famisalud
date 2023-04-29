function paddedFormat(num) {
  return num < 10 ? "0" + num : num; 
}

function startCountDown(duration, element) {

  let secondsRemaining = duration;
  let min = 0;
  let sec = 0;

  let countInterval = setInterval(function () {

      min = parseInt(secondsRemaining / 60);
      sec = parseInt(secondsRemaining % 60);

      element.textContent = `${paddedFormat(min)}:${paddedFormat(sec)}`;

      secondsRemaining = secondsRemaining - 1;
      if (secondsRemaining < 0) { clearInterval(countInterval) };

  }, 1000);
}

function cronometro() {
  let time_minutes = 5; // Value in minutes
  let time_seconds = 00; // Value in seconds

  let duration = time_minutes * 60 + time_seconds;

  element = document.querySelector('#count-down-timer');
  element.textContent = `${paddedFormat(time_minutes)}:${paddedFormat(time_seconds)}`;

  startCountDown(--duration, element);
};

$(document).ready(function(){

    var email = "";
    var codigo = "";
    var datospersona = "";
    var idusuario = "";

    function generarRandom(num) {
        const characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        const charactersLength = characters.length;
        let result = "";
          for (let i = 0; i < num; i++) {
              result += characters.charAt(Math.floor(Math.random() * charactersLength));
          }
      
        return result;
    }   
    
    function enviarEmail(emaildestino){
      $.ajax({
        url : 'controllers/validacion-codigo.php',
        type: 'GET',
        data: {
          'op': 'enviarEmail', 
          'email' : emaildestino, 
          'codigo' : codigo,
          'datospersona' : datospersona
        },
        success:function(result){
          mostrarAlerta('success' ,'Correo enviado');
        }
      });
    }

    function validarCorreoContraseña(){
      var cajaValidacion = document.querySelector('#cajavalidacioncodigo')
      var correo = $("#correoverificacion").val();

      $.ajax({
        url: 'controllers/Usuario.controller.php',
        type: 'GET',
        data: {'op': 'validarCorreoContraseña', 'email' : correo},
        success: function(result){
          var resultado = JSON.parse(result);
          // 1. Verifica que el correo exista
          email = resultado[0].email;
          datospersona = resultado[0].datospersona;
          idusuario = resultado[0].idusuario;

          // 2. Genera el código random
          codigo = generarRandom(6);
          codVerificacion(idusuario ,codigo);

          setTimeout(function(){
            eliminarcodrecuperacion(idusuario);
          }, 300000);
          
          // 3. Envia el correo.
          enviarEmail(email);
          cajaValidacion.style.cssText = null;
        }
      });
    }

    function emailNoExiste(){
      let emailNoExiste = $("#correoverificacion").val();
      
      if(emailNoExiste == ""){
          mostrarAlerta("warning", "¡Completar los campos necesarios!");
      }else{
          var datos = {
              'op' : 'emailNoRegistrado',
              'email' : emailNoExiste
          };
          $.ajax({
              type: "GET",
              url:  "controllers/Usuario.controller.php",
              data: datos,
              success: function(e){
                  if(e == 2){
                      mostrarAlerta("error", "¡El correo no existe!");
                  }
                  else if(e == 1){
                      validarCorreoContraseña();
                      cronometro();
                  }else{
                      mostrarAlerta("error", "¡A ocurrido un error!");
                  }
              }
          });
      }
  }

    function codVerificacion(idusuarioverificacion, codigoverificacion){
      $.ajax({
        url : 'controllers/Usuario.controller.php',
        type: 'GET',
        data: {
          'op': 'codverificacion', 
          'idusuario' : idusuarioverificacion , 
          'codverificacion' : codigoverificacion
        },
        success: function(result){
          mostrarAlerta('info' ,'El codigo será valido por 5 minutos.');
        }
      });
    }

    function eliminarcodrecuperacion(idusuarioeliminarcod){
      $.ajax({
        url: 'controllers/Usuario.controller.php',
        type: 'GET',
        data: {'op': 'eliminarCodverificacion', 'idusuario': idusuarioeliminarcod},
        success: function(result){
          mostrarAlerta('warning' ,'El código creado, ya no es valido.');
        }
      });
    }

    function codigoCorrecto(){
      var correo = $("#correoverificacion").val();
      var num1 = $("#caja1").val();
      var num2 = $("#caja2").val();
      var num3 = $("#caja3").val();
      var num4 = $("#caja4").val();
      var num5 = $("#caja5").val();
      var num6 = $("#caja6").val();

      var codigorecibido = num1 + num2 + num3 + num4 + num5 + num6;

      $.ajax({
        url: 'controllers/Usuario.controller.php',
        type: 'GET',
        data: {'op': 'validarCorreoContraseña', 'email' : correo},
        success: function(result){
          var resultado = JSON.parse(result);
          codigoenviado = resultado[0].codverificacion;
          var idusuariorecuperacion = resultado[0].idusuario;

          if(codigoenviado == codigorecibido){
            localStorage.setItem("idusuario", idusuariorecuperacion);
            window.location.href = "views/recuperar-contrasena.php";

          }else{
            console.log("Vuelva a escribir el codigo");
          }
        }
      });

    }

    // localstorage
    $("#validar").click(codigoCorrecto);
    
    $("#verificarCorreo").click(emailNoExiste);
    //validarCorreoContraseña('luisbo_56@hotmail.com'); // leer caja y hacer funcionar el botón.

    $("#correoverificacion").keypress(function (e){
			if (e.keyCode == 13){
				emailNoExiste();
			}
    	});	
});
  
