$(document).ready(function(){

    idproducto = "";
    var txtProducto = document.querySelector("#idproductomod");
    var botonActualizar = document.querySelector("#actualizar");
    var botonGuardar = document.querySelector("#registrar");

    tinymce.init({
        selector: 'textarea',
        menubar:false,
        height: 200,
        plugins: [
            'advlist', 'autolink', 'lists', 'link', 'image', 'charmap', 'preview',
            'anchor', 'searchreplace', 'visualblocks', 'code', 'fullscreen',
            'insertdatetime', 'media', 'table', 'help', 'wordcount'
        ],
        toolbar: 'undo redo | ' +
        'fontfamily fontsize bold italic underline backcolor  forecolor | ',
    });

    function registrarProducto(){
        var idcategoria = $("#idcategoria").val();
        var nombreproducto = tinymce.get("nombreproducto").getContent();
        var principiosactivos = tinymce.get("principiosactivos").getContent();
        var formafarmaceutica = tinymce.get("formafarmaceutica").getContent();
        var descripcion = tinymce.get("descripcion").getContent();
        var fechavencimiento = $("#fechavencimiento").val();

        if(idcategoria == "" || nombreproducto == "" || principiosactivos == "" || formafarmaceutica == "" || descripcion == "" || fechavencimiento == ""){
            mostrarAlerta("warning", "¡Completar los campos necesarios!");
        }else{
            Swal.fire({
                icon:'question',
                title:'¿Está seguro de registrar?',
                showCancelButton: true,
                cancelButtonText:'Cancelar',
                confirmButtonText:'Aceptar'
            }).then((result) => {
                
                if(result.isConfirmed){
                    var datos = {
                        'op'                : 'registrarProducto',
                        'idcategoria'       : idcategoria,
                        'nombreproducto'    : nombreproducto,
                        'principiosactivos'  : principiosactivos,
                        'formafarmaceutica' : formafarmaceutica,
                        'descripcion'       : descripcion,
                        'fechavencimiento'       : fechavencimiento
                    };
                    console.log(datos);
                    $.ajax({
                        url : 'controllers/Producto.controller.php',
                        type: 'GET',
                        data: datos,                        
                        success: function(result){
                            mostrarAlerta("success", "¡Registrado con éxito!");
                            $("#formularioFarmacia")[0].reset();
                            ListarProductos();
                            ListarProductosMedicos();
                        }
                    });
                }
            });
        }
    }

    function nombreproductoYaExiste(){
        // let nombreproductoYaExiste = $("#nombreproducto").val();
        var nombreproductoYaExiste = tinymce.get("nombreproducto").getContent();

        if(nombreproductoYaExiste == ""){
            mostrarAlerta("warning", "¡Completar los campos necesarios!");
        }else{
            var datos = {
                'op' : 'nombreproductoYaRegistrado',
                'nombreproducto' : nombreproductoYaExiste
            };
            $.ajax({
                type: "GET",
                url:  "controllers/Producto.controller.php",
                data: datos,
                success: function(e){
                    if(e == 1){
                        mostrarAlerta("error", "¡Ya existe este producto!");
                    }
                    else if(e == 2){
                        registrarProducto();
                    }else{
                        mostrarAlerta("error", "¡A ocurrido un error!");
                    }
                }
            });
        }
    }

    function ListarProductosMedicos(){
        var tabla = $("#tablaProductoMedico").DataTable();
        tabla.destroy();

        tabla = $("#tablaProductoMedico").DataTable({
            "processing" : true,
            "serverSide" : true,
            "order"      : [[1, "asc"]],
            "sAjaxSource": 'controllers/Producto.controller.php?op=ListarProductoMedico',
            "pageLength" : 10,
            "language": { url: '//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json'},
            "dom": 'Bfrtip',
            "buttons": ['copy', 'print', 'pdf', 'excel', 'docx']
        });
    }  

    function cargarCategorias(select){
        var datos ={
            'op': 'cargarCategoria'
        };
        $.ajax({
            url : 'controllers/Categoria.controller.php',
            type: 'GET',
            data: datos,
            success:function(e){
                $(select).html(e);
            }
        });
    }

    function ListarProductos(){
        var tabla = $("#tablaProducto").DataTable();
        tabla.destroy();

        tabla = $("#tablaProducto").DataTable({
            "processing" : true,
            "serverSide" : true,
            "order"      : [[2, "asc"]],
            "sAjaxSource": 'controllers/Producto.controller.php?op=ListarProductoFarmacia',
            "pageLength" : 10,
            "language": { url: '//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json'},
            "dom": 'Bfrtip',
            "buttons": ['copy', 'print', 'pdf', 'excel'],
            "columnDefs" : [
                {
                    "data": null,
                    render: function(data,type,row){
                        return `
                            <a  href='#' data-idproducto='${data[0]}' class='btn btn-sm btn-outline-secondary modificar'>
                                <i class='fas fa-edit'></i>
                            </a>
                            <a  href='#' data-idproducto='${data[0]}' class='btn btn-sm btn-outline-secondary eliminar'>
                                <i class='fas fa-trash-alt'></i>
                            </a>
                        `;
                    },
                    "targets":5
                }
            ]
        });
    }  

    $("#tablaProducto").on("click", ".eliminar", function(){
        let idproducto = $(this).attr('data-idproducto');
        Swal.fire({
            icon: 'question',
            title: 'PATITAS APP',
            text: 'Esta seguro de eliminar?',
            showCancelButton: true,
            cancelButtonText: 'Cancelar',
            confirmButtonText: 'Confirmar',
        }).then((result)=>{
            if(result.isConfirmed){
                var datos = {
                    'op' : 'eliminarProducto',
                    'idproducto' : idproducto
                };
                $.ajax({
                    url: 'controllers/Producto.controller.php',
                    type: 'GET',
                    data: datos,
                    success: function(e){
                        mostrarAlerta("success", "¡Eliminado correctamente!");
                        ListarProductos();
                        ListarProductosMedicos();
                    }
                });
            }
            });
    });

    $("#tablaProducto").on('click', ".modificar", function(){
        let idproducto = $(this).attr('data-idproducto');

        var datos = {
            'op' : 'getProducto',
            'idproducto' : idproducto
        };
        // console.log(datos);
        $.ajax({
            url: 'controllers/Producto.controller.php',
            type: 'GET',
            data: datos,
            success: function(result){                        
                if ($.trim(result) != ""){
                    //Asignamos y quitamos la clase que muestra la caja de texto
                    $("#Aviso").html("Actualizar Producto");
                    txtProducto.classList.remove('asignar');
                    botonActualizar.classList.remove('asignar');
                    botonGuardar.classList.add('asignar');
                    $("#idcategoria").prop('disabled', true);
                    // $("#descripcion").prop('disabled', true);
                    

                    var resultado = JSON.parse(result);
                    // console.log(resultado);
                    
                    $("#idcategoria").val(resultado[0].idcategoria);
                    tinymce.get("nombreproducto").setContent(resultado[0].nombreproducto);
                    tinymce.get("principiosactivos").setContent(resultado[0].principiosactivos);
                    tinymce.get("formafarmaceutica").setContent(resultado[0].formafarmaceutica);
                    tinymce.get("descripcion").setContent(resultado[0].descripcion);
                    txtProducto.setAttribute("data-idproducto", resultado[0].idproducto);
                    $("#fechavencimiento").val(resultado[0].fechavencimiento);
                    $("#idproductomod").hide();
                }else{
                    mostrarAlerta("warning", "¡No encontramos registros!");
                }
            }
        });
    });
    
    $("#cancelar").click(function(){
        $("#formularioFarmacia")[0].reset();
        $("#Aviso").html("Registrar Producto");
        txtProducto.classList.add('asignar');
        botonActualizar.classList.add('asignar');
        botonGuardar.classList.remove('asignar');
        $("#descripcion").prop('disabled', false);
    });

    function modificarProducto(){
        let idproducto = $("#idproductomod").attr('data-idproducto');
        var nombreproducto = tinymce.get("nombreproducto").getContent();
        var principiosactivos = tinymce.get("principiosactivos").getContent();
        var formafarmaceutica = tinymce.get("formafarmaceutica").getContent();
        var descripcion = tinymce.get("descripcion").getContent();
        var fechavencimiento = $("#fechavencimiento").val();

        if(principiosactivos == "" || nombreproducto == "" || formafarmaceutica == "" || descripcion == "" || fechavencimiento == ""){
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
                        'op'                     : 'modificarProducto',
                        'idproducto'             : idproducto,
                        'nombreproducto'         : nombreproducto,
                        'principiosactivos'      : principiosactivos, 
                        'formafarmaceutica'      : formafarmaceutica,
                        'descripcion'            : descripcion,
                        'fechavencimiento'       : fechavencimiento
                    };
                    console.log(datos);
                    $.ajax({
                        url: 'controllers/Producto.controller.php',
                        type:'GET',
                        data: datos,
                        success:function(e){
                            mostrarAlerta("success", "¡Modificado con éxito!");

                            $("#formularioFarmacia")[0].reset();
                            $("#Aviso").html("Registrar Producto");
                            txtProducto.classList.add('asignar');
                            botonActualizar.classList.add('asignar');
                            botonGuardar.classList.remove('asignar');
                            $("#idcategoria").prop('disabled', false);

                            ListarProductos();
                        }
                    });
                }
            });
        }
    }

    $("#categoriaselect").change(function(){
        var filtros = $(this).val();
        // console.log(filtros);
        if(filtros==""){
            ListarProductos();
        }else{

            $.ajax({
                url: 'controllers/Producto.controller.php',
                type: 'GET',
                data: {
                    'op': 'filtrarCategorias',
                    'idcategoria' : filtros
                    },
                success: function(result){
                    // console.log(result);
                    $("#tablaProductolistar").html(result);
                }
            });
        }
    });

    $("#categoriaselectmedico").change(function(){
        var filtros = $(this).val();
        // console.log(filtros);
        if(filtros==""){
            ListarProductosMedicos();
        }else{

            $.ajax({
                url: 'controllers/Producto.controller.php',
                type: 'GET',
                data: {
                    'op': 'filtrarCategoriasMedicos',
                    'idcategoria' : filtros
                    },
                success: function(result){
                    // console.log(result);
                    $("#tablaProductoMedicolistar").html(result);
                }
            });
        }
    });

    ListarProductos();
    ListarProductosMedicos();
    $("#registrar").click(nombreproductoYaExiste);
    $("#actualizar").click(modificarProducto);
    cargarCategorias("#idcategoria");
    cargarCategorias("#categoriaselect");
    cargarCategorias("#categoriaselectmedico");
});