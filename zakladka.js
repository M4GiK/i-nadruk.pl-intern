window.addEventListener('load', (event) => {
    console.log('The page has fully loaded');
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
    
    document.getElementById("quantity").addEventListener("keypress", isNumberKey, false);
});

window.addEventListener('load', (event) => {
    console.log('The page has fully loaded');
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
    
    document.getElementById("quantityDTF").addEventListener("keypress", isNumberKey, false);
});

window.addEventListener('load', (event) => {
    console.log('The page has fully loaded');
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
    
    document.getElementById("iloscSztuk").addEventListener("keypress", isNumberKey, false);
});

window.addEventListener('load', (event) => {
    console.log('The page has fully loaded');
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
    
    document.getElementById("powierzchnia").addEventListener("keypress", isNumberKey, false);
});



