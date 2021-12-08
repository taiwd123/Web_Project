function thongBao(classElm){
    $(function() {
        var Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 5000
        });

        $(classElm).click(function() {
            setTimeout(function(){
                Toast.fire({
                    icon: 'success',
                    title: 'Tải hình ảnh lên thành công'
                })
            }, 5000);
            //alert('success')

        });

    });
}