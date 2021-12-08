function handleDisable(data){
    var parent = document.querySelectorAll(data.parent)
    parent.forEach(function(element){
        var btnElement = element.querySelector(data.childBtn)
        var statusElement = element.querySelector(data.childStatus);
        if(statusElement.innerHTML == data.statusName.UnFinished){
            btnElement.disabled = true;
        }
        var actionBtnElement = element.querySelector(data.childBtnSuccess);
        actionBtnElement.onclick = function(){
            statusElement.innerHTML = data.statusName.Finished;
            statusElement.classList.remove(data.childBtnClassName.Secondary);
            statusElement.classList.add(data.childBtnClassName.Success);
            btnElement.disabled = false;
        }
    })
}
