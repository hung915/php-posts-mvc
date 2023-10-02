const input_image = document.getElementById('image');
input_image.onchange = () => {
    const [file] = input_image.files
    if (file) {
        const img_tag = document.getElementById('uploaded-image');
        img_tag.src = URL.createObjectURL(file);
        img_tag.style.display = "block";
    }
}