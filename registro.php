<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>REGISTRO FAMISALUD</title>
  <link rel="icon" type="image/png" href="images/favicon.png" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <link rel="stylesheet" href="css/registro.css">
  <link rel="stylesheet" type="text/css" href="css/scroll.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
  <section>
    <div class="row g-0">
      <div class="col-lg-7">
        <div id="carouselExampleCaptions" class="carousel slide">
          <div class="carousel-inner">
            <div class="carousel-item img-1 min-vh-100 active">
              
            </div>
          </div>
        </div>
      </div>

      <div class="col-lg-5 d-flex flex-column align-items-end min-vh-100">
        <div class="px-lg-5 pt-lg-2 pb-lg-3w-100 mb-auto">
          <img src="images/logo.png" alt="imagen logo" class="img-fluid" width="31.5%">
        </div>
        <div class="px-lg-5 py-lg-2 w-100 align-self-center"><!--con esta clase se alinea la img con el texto-->
          <h3 class="fw-semibold mb-4">Registro de Personal</h3>
          <form autocomplete="off">
            <div class="form-floating mb-4">
              <input type="text" class="form-control" id="nombres" placeholder="ingrese su nombre" onkeypress="return SoloLetras(event);" autofocus required>
              <label for="nombres">Nombre</label>
            </div>
            <div class="form-floating mb-4">
              <input type="text" class="form-control" id="apellidos" placeholder="ingrese su apellido" onkeypress="return SoloLetras(event);" required>
              <label for="apellidos">Apellidos</label>
            </div>

            <div class="form-floating mb-4">
              <input type="text" class="form-control" id="nombreusuario" placeholder="ingrese su apellido" onkeypress="return SoloLetras(event);" required>
              <label for="nombreusuario">Nombre de Usuario</label>
            </div>

            <div class="mb-3">
              <label for="nivelacceso" class="form-label">Nivel de Acceso:</label>
              <select class="form-select form-select-lg mb-4" aria-label=".form-select-lg example" id="nivelacceso" class="form-select" required>
                <option selected disabled value="">Elija el Nivel de Acceso</option>
                <option value="A">Administrador</option>
                <option value="F">Farmacia</option>
                <option value="M">Médico</option>
              </select>
            </div>

            <div class="form-floating mb-4">
              <input type="email" class="form-control" id="email" placeholder="name@example.com" required>
              <label for="email">Correo Electronico</label>
            </div>
            <p class="fw-semibold">Nota: <i>La contraseña por defecto será 123456</i>&nbsp;<i class="fa-solid fa-lock" style="color: #6976F7;"></i></p>
            <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit"><i class="fa-solid fa-user-plus">&nbsp;</i>Registrar Personal</button>
            <!-- registro de personal -->
            <div class="text-center fw-semibold">
              ¿ya eres usuario?<a href="index.php" class="fw-semibold" style="text-decoration: none; color:#648BE4;">&nbsp;Iniciar Sesion&nbsp;<i class="fa-solid fa-right-to-bracket"></i></a>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
  <script src="js/registro.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>