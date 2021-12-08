function uploadFirebase(idFile, send, urlImage){
    var files = [];
    document.getElementById(idFile).addEventListener("change", function(e) {
        files = e.target.files;
        for (let i = 0; i < files.length; i++) {
            console.log(files[i]);
        }
    });

    document.getElementById(send).addEventListener("click", function() {
        //checks if files are selected
        if (files.length != 0) {
            //Loops through all the selected files
            for (let i = 0; i < files.length; i++) {
                //create a storage reference
                var storage = firebase.storage().ref(files[i].name);

                //upload file
                var upload = storage.put(files[i]);

                //var storageRef = firebase.storage().ref(imageName);
                var uploadTask = storage.put(files[i]);
                //update progress bar
                upload.on(
                    "state_changed",
                    function progress(snapshot) {

                    },

                    function error(e) {
                        alert(e);
                    },

                    function () {
                        uploadTask.snapshot.ref
                            .getDownloadURL()
                            .then(async function (downloadURL) {
                                document.getElementById(urlImage).value = downloadURL;
                                //alert(downloadURL)
                            });
                    },


                );
            }
        } else {
            alert("Vui lòng chọn hình ảnh");
        }
    });

}
var files = [];
function savefiles(idFile){
    document.getElementById(idFile).addEventListener("change", function(e) {
        files = e.target.files;
        for (let i = 0; i < files.length; i++) {
            console.log(files[i]);
        }
    });
}
function upload(urlImage){
    if (files.length != 0) {
        //Loops through all the selected files
        for (let i = 0; i < files.length; i++) {
            //create a storage reference
            var storage = firebase.storage().ref(files[i].name);

            //upload file
            var upload = storage.put(files[i]);

            //var storageRef = firebase.storage().ref(imageName);
            var uploadTask = storage.put(files[i]);
            //update progress bar
            upload.on(
                "state_changed",
                function progress(snapshot) {

                },

                function error(e) {
                    alert(e);
                },

                function () {
                    uploadTask.snapshot.ref
                        .getDownloadURL()
                        .then(async function (downloadURL) {
                            document.getElementById(urlImage).value = downloadURL;
                            //alert(downloadURL)
                        });
                },


            );
        }
    } else {
        alert("Vui lòng chọn hình ảnh");
    }
}