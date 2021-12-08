function handle(btnElement, formElement){
    var courses = document.querySelectorAll(btnElement)
    courses.forEach(function (course){
        course.onclick = function() {
            var form = document.querySelector(formElement);
            form.classList.add("active");
        }
    })
}
function Cancel(btnElement,formElement, removeElement = false){
    var courses = document.querySelectorAll(btnElement)
    courses.forEach(function (course){
        course.onclick = function(){
            var form = document.querySelector(formElement);
            form.classList.remove("active");
            if(removeElement){
                var remove = document.querySelector(removeElement);
                while(remove.lastElementChild){
                    remove.removeChild(remove.lastElementChild)
                }
            }
        }
    })

}

