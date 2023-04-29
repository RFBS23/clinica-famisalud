<?php 
  session_start();
  if ($_SESSION['acceso'] == false){
    //Login
    header('Location:../');
  }
?>