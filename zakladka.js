function moveElement(){
    const element = document.getElementById('onClick');
    const currentLeft = parseInt(element.style.left || 0);
    const newLeft = currentLeft +2;
    text.style.transition = 'left 0.5s';
    text.style.left = newLeft + 'px';
}

function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode == 46 || charCode > 31 && (charCode < 48 || charCode > 57)){
        evt.preventDefault();
        return false;
    }
    return true;
}

function isNumberKeyWithCommaOrDot (event) {
    var charCode = (event.which) ? event.which : event.keyCode;
    if (charCode == 46 || charCode > 31 && (charCode < 48 || charCode > 57) && (charCode >= 96 || charCode <= 105) && (charCode >= 188 || charCode <= 190)){
        event.preventDefault();
        return false;
    }
    return true;
}

window.addEventListener('load', (event) => {
     document.getElementById("quantity").addEventListener("keypress", isNumberKey, false);
});

window.addEventListener('load', (event) => {
    document.getElementById("quantityDTF").addEventListener("keypress", isNumberKey, false);
});

window.addEventListener('load', (event) => {
    document.getElementById("iloscSztuk").addEventListener("keypress", isNumberKey, false);
});
window.addEventListener('load', (event) => {
    document.getElementById("wysokosc").addEventListener("keypress", isNumberKeyWithCommaOrDot, false);
});

window.addEventListener('load', (event) => {
    document.getElementById("dlugosc").addEventListener("keypress", isNumberKeyWithCommaOrDot, false);
});

// window.addEventListener('load', (event) => {
//     document.getElementById("powierzchnia").addEventListener("keypress", isNumberKey, false);
// });



