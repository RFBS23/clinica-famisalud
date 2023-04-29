<?php

use PHPMailer\PHPMailer\PHPMailer;  //Core(nucleo)
use PHPMailer\PHPMailer\Exception;  //Controlador de excepciones (errores)
use PHPMailer\PHPMailer\SMTP;       //Administra protocolo envio correo


//Archivos requeridos
require '../src/Exception.php';
require '../src/PHPMailer.php';
require '../src/SMTP.php';

require_once '../models/Usuario.php';

//Instancia de la clase PHPMailer
$mail = new PHPMailer(true);

//Debemos comprobar que el usuario ha requerido un PROCESO
if (isset($_GET['op'])){

  //Instancia del modelo
  $usuario = new Usuario();

  //Almacenamos el proceso requerido en la variable "operación"
  $operacion = $_GET['op'];

  if($operacion == 'enviarEmail'){
    try{
        $mail->SMTPDebug = 0;                
        $mail->isSMTP();
        $mail->Host       = 'smtp.gmail.com';
        $mail->SMTPAuth   = true;
        $mail->Username   = 'clinicafamisaludc@gmail.com';
        $mail->Password   = 'qlgdmczhcokkumkz';
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
        $mail->Port       = 465;
      
        //Remitente
        $mail->setFrom('clinicafamisaludc@gmail.com', 'Clínica Famisalud');
      

        $mail->addAddress($_GET['email']);  //Destinatario
        
        $codigo = $_GET['codigo'];
        $datospersona = $_GET['datospersona'];

        //Contenido
        $mail->isHTML(true);
        $mail->Subject = 'Recuperación de contraseña - Famisalud';
        $mail->Body    = 
        'Estimado/a '. $datospersona.', para recuperar su contraseña ingrese el siguiente código de verificación: '. $codigo;
        $mail->AltBody = 'Proyecto de Ing. Software con I.A./Grupo Technology - SENATI';
      
        $mail->CharSet ='UTF-8'; //Permite tildes.
        $mail->send();
        echo 'Correo enviado correctamente';
      }
      catch(Exception $e){
        echo "No se ha podido enviar el correo electronico: {$mail->ErrorInfo}";
      }
  }else{
      echo 1 , "<h1>NO ENVIADO</h1>";
      return false;
  }
}
?>