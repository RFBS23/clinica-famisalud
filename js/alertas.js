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