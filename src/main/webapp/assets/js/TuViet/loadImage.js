function loadImage(fileImage, container){
    const fileUploader = document.getElementById(fileImage);
    const reader = new FileReader();
    const imageGrid = document.getElementById(container);

    fileUploader.addEventListener('change', (event) => {
        const files = event.target.files;
        const file = files[0];

        const img = document.createElement('img');
        imageGrid.appendChild(img);
        img.src = URL.createObjectURL(file);
        img.alt = file.name;
        img.style.maxHeight = "100px"
    });
}