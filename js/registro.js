//para nombres y apellidos
function SoloLetras(e){
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toString();
    letras = "ABCDEFGHIJKLMNOPQRSTUVWXYZÁÉÍÓÚabcdefghijklmnopqrstuvwxyzáéíóú";

    especiales = [8,13];
    tecla_especial = false
    for(var i in especiales) {
        if(key == especiales[i]){
            tecla_especial = true;
            break;
        }
    }

    if(letras.indexOf(tecla) == -1 && !tecla_especial){
        Swal.fire({
            icon: 'error',
            position: 'top-end',
            toast: true,
            showConfirmButton: false,
            timer: 1500,
            title: 'Ingresar solo letras'
        });
        //alert("Ingresar solo letras");
        return false;
    }
}