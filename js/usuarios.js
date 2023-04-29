$(document).ready(function(){

    idusuario = "";
    var txtUsuario = document.querySelector("#idusuariomod");
    var botonActualizar = document.querySelector("#actualizar");
    var botonGuardar = document.querySelector("#registrar");
    
    function registrarUsuarios() {
        let nombres = $("#nombres").val();
        let apellidos = $("#apellidos").val();
        let nombreusuario = $("#nombreusuario").val();
        let nivelacceso = $("#nivelacceso").val();
        let email = $("#email").val();
        if(nombres == "" || apellidos == "" || nombreusuario == "" || nivelacceso == "" || email == ""){
            mostrarAlerta("warning", "¡Completar los campos necesarios!");
        }else{
            Swal.fire({
                icon:'question',
                title:'¿Está seguro de registrar?',
                showCancelButton: true,
                cancelButtonText:'Cancelar',
                confirmButtonText:'Aceptar'
            }).then((result) =>{
                if(result.isConfirmed){
                    var datos = {
                        'op'                    : 'registrarUsuario',
                        'nombres'               : nombres, 
                        'apellidos'             : apellidos, 
                        'nombreusuario'         : nombreusuario, 
                        'nivelacceso'           : nivelacceso,
                        'email'                 : email
                    };

                    $.ajax({
                        url: 'controllers/Usuario.controller.php',
                        type:'GET',
                        data: datos,
                        success:function(e){
                            mostrarAlerta("success", "¡Registrado con éxito!");
                            $("#formularioUsuario")[0].reset();
                            listarUsuarios();
                        }
                    });
                }
            });
        }
    }

    function listarUsuarios(){
        $.ajax({
            url: 'controllers/Usuario.controller.php',
            type: 'GET',
            data: 'op=listarUsuarios',
            success: function(e){
                var tabla = $("#tablaUsuario").DataTable();
                tabla.destroy();
                $("#datosUsuario").html(e);
                $("#tablaUsuario").DataTable({
                    language: { url: '//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json' },
                    columnDefs: [
                    {
                        visible: true,
                        searchable: true
                    }
                    ],
                    dom: 'Bfrtip',
                    buttons: ['copy', 'print', 'pdf', 'excel']
                });
            }
        });
    }

    function GestionUsuario(tipo, valor, icono, mensaje){
        var datos = {
            'op' : tipo,
            'idusuario' : valor
        };
        console.log(datos);
        $.ajax({
            url: 'controllers/Usuario.controller.php',
            type: 'GET',
            data: datos,
            success: function(e){
                mostrarAlerta(icono, mensaje);
            }
        });
    }

    $('#datosUsuario').on('change',"#on",function(){
        var idusuario2 = $(this).attr('data-idusuario2');
        if(this.checked){
            GestionUsuario("reactivarUsuario", idusuario2, "success", "¡Restaurado con éxito!");
        }
        else{
            GestionUsuario("eliminarUsuario", idusuario2, "success", "¡Eliminado con éxito!");
        }
    });

    $("#tablaUsuario").on('click', ".modificar", function(){
        var idusuario = $(this).attr('data-idusuariomod');

        $.ajax({
            url: 'controllers/Usuario.controller.php',
            type: 'GET',
            data: {
                'op': 'getUsuario',
                'idusuario' : idusuario
            },
            success: function(result){                        
                if ($.trim(result) != ""){
                    //Asiganamos y quitamos la clase que muestra la caja de texto
                    $("#Aviso").html("Actualizar Usuario");
                    txtUsuario.classList.remove('asignar');
                    botonActualizar.classList.remove('asignar');
                    botonGuardar.classList.add('asignar');
                    $("#nombres").prop('disabled', true);
                    $("#apellidos").prop('disabled', true);

                    var resultado = JSON.parse(result);

                    $("#apellidos").val(resultado[0].apellidos);
                    $("#nombres").val(resultado[0].nombres);
                    $("#nombreusuario").val(resultado[0].nombreusuario);
                    $("#nivelacceso").val(resultado[0].nivelacceso);
                    $("#email").val(resultado[0].email);
                    txtUsuario.setAttribute("data-idusuario", resultado[0].idusuario);
                    $("#idusuariomod").hide();
                }else{
                    
                    mostrarAlerta("warning", "¡No encontramos registros!");
                }
            }
        });
    });

    
    function modificarUsuarios(){
        let idusuario = $("#idusuariomod").attr('data-idusuario');
        let nombreusuario = $("#nombreusuario").val();
        let nivelacceso = $("#nivelacceso").val();
        let email = $("#email").val();
        if(nombreusuario == "" || nivelacceso == undefined || email == ""){
            mostrarAlerta("warning", "¡Completar los campos necesarios!");
        }else{
            Swal.fire({
                icon:'question',
                title:'¿Está seguro de modificar?',
                showCancelButton: true,
                cancelButtonText:'Cancelar',
                confirmButtonText:'Aceptar'
            }).then((result) =>{
                if(result.isConfirmed){
                    var datos = {
                        'op'              : 'modificarUsuario',
                        'idusuario'       : idusuario,
                        'nombreusuario'   : nombreusuario, 
                        'nivelacceso'     : nivelacceso,
                        'email'           : email
                    };
                    console.log(datos);
                    $.ajax({
                        url: 'controllers/Usuario.controller.php',
                        type:'GET',
                        data: datos,
                        success:function(e){
                            mostrarAlerta("success", "¡Modificado con éxito!");

                            $("#formularioUsuario")[0].reset();
                            $("#Aviso").html("Registrar Usuario");
                            txtUsuario.classList.add('asignar');
                            botonActualizar.classList.add('asignar');
                            botonGuardar.classList.remove('asignar');
                            $("#nombres").prop('disabled', false);
                            $("#apellidos").prop('disabled', false);

                            listarUsuarios();
                        }
                    });
                }
            });
        }
    }

    $("#cancelar").click(function(){
        $("#formularioUsuario")[0].reset();
        $("#Aviso").html("Registrar Usuario");
        txtUsuario.classList.add('asignar');
        botonActualizar.classList.add('asignar');
        botonGuardar.classList.remove('asignar');
        $("#nombres").prop('disabled', false);
        $("#apellidos").prop('disabled', false);
    });


    function resetearFormulario(){
        $("#formularioActualizarContraseña")[0].reset();
    }

    function actualizarClave(){
        const claveActual = $("#claveactual").val();
        const claveNueva = $("#clavenueva").val();
        const claveNuevaConfirmada = $("#clavenuevaconfirmada").val();

        if(claveActual == "" || claveNueva == "" || claveNuevaConfirmada == ""){
            mostrarAlerta("warning", "¡Completar los campos necesarios!");
        }else{
            if(claveNueva != claveNuevaConfirmada){ // faltaria validacion para cuando la clave actual no es correcta
                mostrarAlerta("warning", "¡Las nuevas contraseñas no coinciden!");
            }else{
                Swal.fire({
                    icon: 'question',
                    title: '¿Está seguro de cambiar la contraseña?',
                    showCancelButton: true,
                    cancelButtonText: 'Cancelar',
                    confirmButtonText: 'Aceptar'
                }).then((result) => {
                    if (result.isConfirmed){
                        $.ajax({
                            url: 'controllers/Usuario.controller.php',
                            type: 'GET',
                            data: {
                                'op' : 'actualizarClave',
                                'claveActual' : claveActual,
                                'claveNueva' : claveNueva 
                            },
                            success: function(result){
                                if($.trim(result) == "OK"){
                                    mostrarAlerta("success", "¡Actualizado correctamente!");
                                    resetearFormulario();
                                }else{
                                    mostrarAlerta("warning", "¡La contraseña actual es incorrecta");
                                    $("#claveactual").focus();
                                }
                            }
                        });
                    }
                });
            }
        }
    }

    function nombreusuarioYaExiste(){
        let nombreusuarioYaExiste = $("#nombreusuario").val();
        
        if(nombreusuarioYaExiste == ""){
            mostrarAlerta("warning", "¡Completar los campos necesarios!");
        }else{
            var datos = {
                'op' : 'nombreusuarioYaRegistrado',
                'nombreusuario' : nombreusuarioYaExiste
            };
            $.ajax({
                type: "GET",
                url:  "controllers/Usuario.controller.php",
                data: datos,
                success: function(e){
                    if(e == 1){
                        mostrarAlerta("error", "¡Ya existe este nombre de usuario!");
                    }
                    else if(e == 2){
                        registrarUsuarios();
                    }else{
                        mostrarAlerta("error", "¡A ocurrido un error!");
                    }
                }
            });
        }
    }
    
    $("#cambiarclave").click(actualizarClave);
    $("#registrar").click(nombreusuarioYaExiste);
    $("#actualizar").click(modificarUsuarios);
    listarUsuarios();
});