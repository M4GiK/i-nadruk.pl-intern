var cssId = 'kalkulator-css';  // you could encode the css path itself to generate id..
if (!document.getElementById(cssId)) {
    var head = document.getElementsByTagName('head')[0];
    var link = document.createElement('link');
    link.id = cssId;
    link.rel = 'stylesheet';
    link.type = 'text/css';
    link.href = 'catalog/view/theme/default/stylesheet/kalkulator.css';
    link.media = 'all';
    head.appendChild(link);
}

function moveElement() {
    const element = document.getElementById('onClick');
    const currentLeft = parseInt(element.style.left || 0);
    const newLeft = currentLeft + 2;
    text.style.transition = 'left 0.5s';
    text.style.left = newLeft + 'px';
}

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode == 46 || charCode > 31 && (charCode < 48 || charCode > 57)) {
        evt.preventDefault();
        return false;
    }
    return true;
}

function isNumberKeyWithCommaOrDot(event) {
    var charCode = (event.which) ? event.which : event.keyCode;
    if (charCode == 46 || charCode > 31 && (charCode < 48 || charCode > 57) && (charCode >= 96 || charCode <= 105) && (charCode >= 188 || charCode <= 190)) {
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

// Funkcja obliczCene() wywoływana przy zmianie wartości w formularzu
document.addEventListener("DOMContentLoaded", () => {
    const inputElements = document.querySelectorAll("#haftForm input");
    inputElements.forEach(inputElement => {
        inputElement.addEventListener("input", obliczCene, false);
    });
    
    // Wybierz wszystkie selecty w formularzu
    const selectElements = document.querySelectorAll("#haftForm select");
    selectElements.forEach(selectElement => {
        selectElement.addEventListener("change", obliczCene, false);
    });
});


const PowierzchniaWypelnienia = {
    MINIMUM: 'MINIMUM',
    SREDNIO: 'SREDNIO',
    MAXIMUM: 'MAXIMUM'
};

function obliczCene() {
    const wysokosc = parseInt(document.getElementById("wysokosc").value);
    const dlugosc = parseInt(document.getElementById("dlugosc").value);
    const powierzchnia = wysokosc * dlugosc;
    const iloscSztuk = parseInt(document.getElementById("iloscSztuk").value);
    const wypelnienie = document.getElementById("wypelnienie").value;

    const cenaZaCm2 = 0.50; // cena za cm2 --------------------------------------------------------------------

    let cenaSztuki;
    if (iloscSztuk <= 2) {
        cenaSztuki = 27.5;
    } else if (iloscSztuk <= 6) {
        cenaSztuki = 16.5;
    } else if (iloscSztuk <= 12) {
        cenaSztuki = 14.5;
    } else if (iloscSztuk <= 24) {
        cenaSztuki = 12;
    } else if (iloscSztuk <= 50) {
        cenaSztuki = 8.8;
    } else if (iloscSztuk <= 100) {
        cenaSztuki = 6.6;
    } else if (iloscSztuk <= 300) {
        cenaSztuki = 5.5;
    } else if (iloscSztuk <= 500) {
        cenaSztuki = 4.4;
    } else {
        cenaSztuki = 4.4;
    }


    let rodzajWypelnienia;
    switch (wypelnienie) {
        case "do 40% powierzchni":
            rodzajWypelnienia = PowierzchniaWypelnienia.MINIMUM;
            break;
        case "od 41-70%":
            rodzajWypelnienia = PowierzchniaWypelnienia.SREDNIO;
            break;
        case "powyzej 71%":
            rodzajWypelnienia = PowierzchniaWypelnienia.MAXIMUM;
            break;
        default:
            document.getElementById("wynik").innerHTML = "Nieprawidłowe wypełnienie";
            return;
    }

    let iloscSciegow = zwrocWartoscSciegow(rodzajWypelnienia, powierzchnia);

    if (iloscSciegow !== null) {
        // TODO dalesze wyliczenia
        const cenaZaSztuke = wyliczCene(iloscSztuk, iloscSciegow);

        document.getElementById("wynik").innerHTML = `Cena za haft: <b>${cenaZaSztuke.toFixed(2)} PLN</b> cena za całe zamówienie: <b>${(cenaZaSztuke * iloscSztuk).toFixed(2)} PLN</b>`;
    } else {
        document.getElementById("wynik").innerHTML = `Prosimy o kontakt w celu indywidualnej wyceny.`;
    }
}

function wyliczCene(iloscSztuk, iloscSciegow) {
    let cenaSztuki = null;

    if (iloscSciegow > 0 && iloscSciegow <= 3000 && iloscSztuk > 0 && iloscSztuk <= 2) {
        cenaSztuki = 27.5;
    } else if (iloscSciegow > 0 && iloscSciegow <= 3000 && iloscSztuk > 2 && iloscSztuk <= 6) {
        cenaSztuki = 16.5;
    } else if (iloscSciegow > 0 && iloscSciegow <= 3000 && iloscSztuk > 6 && iloscSztuk <= 12) {
        cenaSztuki = 14.5;
    } else if (iloscSciegow > 0 && iloscSciegow <= 3000 && iloscSztuk > 12 && iloscSztuk <= 24) {
        cenaSztuki = 12;
    } else if (iloscSciegow > 0 && iloscSciegow <= 3000 && iloscSztuk > 24 && iloscSztuk <= 50) {
        cenaSztuki = 8.8;
    } else if (iloscSciegow > 0 && iloscSciegow <= 3000 && iloscSztuk > 50 && iloscSztuk <= 100) {
        cenaSztuki = 6.6;
    } else if (iloscSciegow > 0 && iloscSciegow <= 3000 && iloscSztuk > 100 && iloscSztuk <= 300) {
        cenaSztuki = 5.5;
    } else if (iloscSciegow > 0 && iloscSciegow <= 3000 && iloscSztuk > 300 && iloscSztuk <= 500) {
        cenaSztuki = 4.4;
    } else if (iloscSciegow > 3000 && iloscSciegow <= 5000 && iloscSztuk > 0 && iloscSztuk <= 2) {
        cenaSztuki = 27.5;
    } else if (iloscSciegow > 3000 && iloscSciegow <= 5000 && iloscSztuk > 2 && iloscSztuk <= 6) {
        cenaSztuki = 16.5;
    } else if (iloscSciegow > 3000 && iloscSciegow <= 5000 && iloscSztuk > 6 && iloscSztuk <= 12) {
        cenaSztuki = 14.5;
    } else if (iloscSciegow > 3000 && iloscSciegow <= 5000 && iloscSztuk > 12 && iloscSztuk <= 24) {
        cenaSztuki = 13;
    } else if (iloscSciegow > 3000 && iloscSciegow <= 5000 && iloscSztuk > 24 && iloscSztuk <= 50) {
        cenaSztuki = 11;
    } else if (iloscSciegow > 3000 && iloscSciegow <= 5000 && iloscSztuk > 50 && iloscSztuk <= 100) {
        cenaSztuki = 8.8;
    } else if (iloscSciegow > 3000 && iloscSciegow <= 5000 && iloscSztuk > 100 && iloscSztuk <= 300) {
        cenaSztuki = 7.5;
    } else if (iloscSciegow > 3000 && iloscSciegow <= 5000 && iloscSztuk > 300 && iloscSztuk <= 500) {
        cenaSztuki = 5;
    } else if (iloscSciegow > 5000 && iloscSciegow <= 7000 && iloscSztuk > 0 && iloscSztuk <= 2) {
        cenaSztuki = 27.5;
    } else if (iloscSciegow > 5000 && iloscSciegow <= 7000 && iloscSztuk > 2 && iloscSztuk <= 6) {
        cenaSztuki = 16.5;
    } else if (iloscSciegow > 5000 && iloscSciegow <= 7000 && iloscSztuk > 6 && iloscSztuk <= 12) {
        cenaSztuki = 15.4;
    } else if (iloscSciegow > 5000 && iloscSciegow <= 7000 && iloscSztuk > 12 && iloscSztuk <= 24) {
        cenaSztuki = 14.5;
    } else if (iloscSciegow > 5000 && iloscSciegow <= 7000 && iloscSztuk > 24 && iloscSztuk <= 50) {
        cenaSztuki = 13;
    } else if (iloscSciegow > 5000 && iloscSciegow <= 7000 && iloscSztuk > 50 && iloscSztuk <= 100) {
        cenaSztuki = 11;
    } else if (iloscSciegow > 5000 && iloscSciegow <= 7000 && iloscSztuk > 100 && iloscSztuk <= 500) {
        cenaSztuki = 'Prosimy o kontakt do wyceny indywidualnej';
    } else if (iloscSciegow > 7000 && iloscSciegow <= 10000 && iloscSztuk > 0 && iloscSztuk <= 2) {
        cenaSztuki = 35.2;
    } else if (iloscSciegow > 7000 && iloscSciegow <= 10000 && iloscSztuk > 2 && iloscSztuk <= 6) {
        cenaSztuki = 22;
    } else if (iloscSciegow > 7000 && iloscSciegow <= 10000 && iloscSztuk > 6 && iloscSztuk <= 12) {
        cenaSztuki = 16.5;
    } else if (iloscSciegow > 7000 && iloscSciegow <= 10000 && iloscSztuk > 12 && iloscSztuk <= 24) {
        cenaSztuki = 15.4;
    } else if (iloscSciegow > 7000 && iloscSciegow <= 10000 && iloscSztuk > 24 && iloscSztuk <= 50) {
        cenaSztuki = 14.5;
    } else if (iloscSciegow > 7000 && iloscSciegow <= 10000 && iloscSztuk > 50 && iloscSztuk <= 100) {
        cenaSztuki = 12;
    } else if (iloscSciegow > 7000 && iloscSciegow <= 10000 && iloscSztuk > 100 && iloscSztuk <= 500) {
        cenaSztuki = 'Prosimy o kontakt do wyceny indywidualnej';
    } else if (iloscSciegow > 10000 && iloscSciegow <= 12000 && iloscSztuk > 0 && iloscSztuk <= 2) {
        cenaSztuki = 38.5;
    } else if (iloscSciegow > 10000 && iloscSciegow <= 12000 && iloscSztuk > 2 && iloscSztuk <= 6) {
        cenaSztuki = 25.5;
    } else if (iloscSciegow > 10000 && iloscSciegow <= 12000 && iloscSztuk > 6 && iloscSztuk <= 12) {
        cenaSztuki = 19.4;
    } else if (iloscSciegow > 10000 && iloscSciegow <= 12000 && iloscSztuk > 12 && iloscSztuk <= 24) {
        cenaSztuki = 18.4;
    } else if (iloscSciegow > 10000 && iloscSciegow <= 12000 && iloscSztuk > 24 && iloscSztuk <= 50) {
        cenaSztuki = 16.5;
    } else if (iloscSciegow > 10000 && iloscSciegow <= 12000 && iloscSztuk > 50 && iloscSztuk <= 100) {
        cenaSztuki = 15.4;
    } else if (iloscSciegow > 10000 && iloscSciegow <= 12000 && iloscSztuk > 100 && iloscSztuk <= 500) {
        cenaSztuki = 'Prosimy o kontakt do wyceny indywidualnej';
    } else if (iloscSciegow > 12000 && iloscSciegow <= 15000 && iloscSztuk > 0 && iloscSztuk <= 2) {
        cenaSztuki = 44;
    } else if (iloscSciegow > 12000 && iloscSciegow <= 15000 && iloscSztuk > 2 && iloscSztuk <= 6) {
        cenaSztuki = 30.5;
    } else if (iloscSciegow > 12000 && iloscSciegow <= 15000 && iloscSztuk > 6 && iloscSztuk <= 12) {
        cenaSztuki = 22.6;
    } else if (iloscSciegow > 12000 && iloscSciegow <= 15000 && iloscSztuk > 12 && iloscSztuk <= 24) {
        cenaSztuki = 21.5;
    } else if (iloscSciegow > 12000 && iloscSciegow <= 15000 && iloscSztuk > 24 && iloscSztuk <= 50) {
        cenaSztuki = 19.8;
    } else if (iloscSciegow > 12000 && iloscSciegow <= 15000 && iloscSztuk > 50 && iloscSztuk <= 100) {
        cenaSztuki = 18.7;
    } else if (iloscSciegow > 12000 && iloscSciegow <= 15000 && iloscSztuk > 100 && iloscSztuk <= 500) {
        cenaSztuki = 'Prosimy o kontakt do wyceny indywidualnej';
    } else if (iloscSciegow > 15000 && iloscSciegow <= 25000 && iloscSztuk > 0 && iloscSztuk <= 2) {
        cenaSztuki = 55;
    } else if (iloscSciegow > 15000 && iloscSciegow <= 25000 && iloscSztuk > 2 && iloscSztuk <= 6) {
        cenaSztuki = 41.8;
    } else if (iloscSciegow > 15000 && iloscSciegow <= 25000 && iloscSztuk > 6 && iloscSztuk <= 12) {
        cenaSztuki = 30.8;
    } else if (iloscSciegow > 15000 && iloscSciegow <= 25000 && iloscSztuk > 12 && iloscSztuk <= 24) {
        cenaSztuki = 29.7;
    } else if (iloscSciegow > 15000 && iloscSciegow <= 25000 && iloscSztuk > 24 && iloscSztuk <= 50) {
        cenaSztuki = 28.6;
    } else if (iloscSciegow > 15000 && iloscSciegow <= 25000 && iloscSztuk > 50 && iloscSztuk <= 100) {
        cenaSztuki = 27.5;
    } else if (iloscSciegow > 15000 && iloscSciegow <= 25000 && iloscSztuk > 100 && iloscSztuk <= 500) {
        cenaSztuki = 'Prosimy o kontakt do wyceny indywidualnej';
    } else if (iloscSciegow > 25000 && iloscSciegow <= 30000 && iloscSztuk > 0 && iloscSztuk <= 2) {
        cenaSztuki = 66;
    } else if (iloscSciegow > 25000 && iloscSciegow <= 30000 && iloscSztuk > 2 && iloscSztuk <= 6) {
        cenaSztuki = 46.8;
    } else if (iloscSciegow > 25000 && iloscSciegow <= 30000 && iloscSztuk > 6 && iloscSztuk <= 12) {
        cenaSztuki = 36.5;
    } else if (iloscSciegow > 25000 && iloscSciegow <= 30000 && iloscSztuk > 12 && iloscSztuk <= 24) {
        cenaSztuki = 35.5;
    } else if (iloscSciegow > 25000 && iloscSciegow <= 30000 && iloscSztuk > 24 && iloscSztuk <= 50) {
        cenaSztuki = 34.5;
    } else if (iloscSciegow > 25000 && iloscSciegow <= 30000 && iloscSztuk > 50 && iloscSztuk <= 100) {
        cenaSztuki = 33;
    } else if (iloscSciegow > 25000 && iloscSciegow <= 30000 && iloscSztuk > 100 && iloscSztuk <= 500) {
        cenaSztuki = 'Prosimy o kontakt do wyceny indywidualnej';
    }


    return cenaSztuki;
}

// Pobierz pola wyboru
// const sizeSelect = document.getElementById("size");
// const quantityInput = document.getElementById("quantity");

function handleCheckboxChange(checkbox) {
    const checkboxes = document.getElementsByName("colors");
    checkboxes.forEach((cb) => {
        if (cb !== checkbox) {
            cb.checked = false;
        }
    });
    calculatePrice();
}

function calculatePrice() {
    const printType = document.getElementById("printType").value;
    const size = document.getElementById("size").value;
    const checkboxes = document.getElementsByName("colors");
    let colors = 0;
    checkboxes.forEach((checkbox) => {
        if (checkbox.checked) {
            colors += parseInt(checkbox.value);
        }
    });
    const quantity = parseInt(document.getElementById("quantity").value);

    if (colors === 0) {
        const resultElement = document.getElementById("result");
        resultElement.innerHTML = 'Wybierz ilość kolorów, aby obliczyć cenę.';
        return; // Przerwij funkcję, jeśli nie wybrano żadnego koloru
    }

    let basePrice = 0;
    
    switch (printType) {
        case "Flex":
            switch (size) {
                case "A7":
                    switch (true) {
                        case (quantity <= 5):
                            basePrice = 13.52;
                            break;
                        case (quantity <= 10):
                            basePrice = 9.44;
                            break;
                        case (quantity <= 25):
                            basePrice = 6.64;
                            break;
                        case (quantity <= 50):
                            basePrice = 6.31;
                            break;
                        case (quantity <= 100):
                            basePrice = 4.98;
                            break;
                        case (quantity <= 300):
                            basePrice = 4.32;
                            break;
                        case (quantity <= 500):
                            basePrice = 3.98;
                            break;
                    }
                    break;
                case "A6":
                    switch (true) {
                        case (quantity <= 5):
                            basePrice = 16.90;
                            break;
                        case (quantity <= 10):
                            basePrice = 11.80;
                            break;
                        case (quantity <= 25):
                            basePrice = 8.30;
                            break;
                        case (quantity <= 50):
                            basePrice = 7.88;
                            break;
                        case (quantity <= 100):
                            basePrice = 6.22;
                            break;
                        case (quantity <= 300):
                            basePrice = 5.40;
                            break;
                        case (quantity <= 500):
                            basePrice = 4.98;
                            break;
                    }
                    break;
                case "A5":
                    switch (true) {
                        case (quantity <= 5):
                            basePrice = 20.25;
                            break;
                        case (quantity <= 10):
                            basePrice = 14.14;
                            break;
                        case (quantity <= 25):
                            basePrice = 9.94;
                            break;
                        case (quantity <= 50):
                            basePrice = 9.45;
                            break;
                        case (quantity <= 100):
                            basePrice = 7.46;
                            break;
                        case (quantity <= 300):
                            basePrice = 6.46;
                            break;
                        case (quantity <= 500):
                            basePrice = 5.97;
                            break;
                    }
                    break;
                case "A4":
                    switch (true) {
                        case (quantity <= 5):
                            basePrice = 23.61;
                            break;
                        case (quantity <= 10):
                            basePrice = 16.48;
                            break;
                        case (quantity <= 25):
                            basePrice = 11.60;
                            break;
                        case (quantity <= 50):
                            basePrice = 11.02;
                            break;
                        case (quantity <= 100):
                            basePrice = 8.70;
                            break;
                        case (quantity <= 300):
                            basePrice = 7.54;
                            break;
                        case (quantity <= 500):
                            basePrice = 6.96;
                            break;
                    }
                    break;
                case "A3":
                    switch (true) {
                        case (quantity <= 5):
                            basePrice = 39.04;
                            break;
                        case (quantity <= 10):
                            basePrice = 27.26;
                            break;
                        case (quantity <= 25):
                            basePrice = 19.17;
                            break;
                        case (quantity <= 50):
                            basePrice = 18.21;
                            break;
                        case (quantity <= 100):
                            basePrice = 14.38;
                            break;
                        case (quantity <= 300):
                            basePrice = 12.46;
                            break;
                        case (quantity <= 500):
                            basePrice = 11.50;
                            break;
                    }
                    break;
            }

            switch (colors) {
                case 1:
                    break;
                case 2:
                    basePrice *= 1.788;
                    break;
                case 3:
                    basePrice *= 2.102;
                    break;
            }

            break;

        case "Flock":
            switch (size) {
                case "A7":
                    switch (true) {
                        case (quantity <= 5):
                            basePrice = 15.90;
                            break;
                        case (quantity <= 10):
                            basePrice = 11.10;
                            break;
                        case (quantity <= 25):
                            basePrice = 7.81;
                            break;
                        case (quantity <= 50):
                            basePrice = 7.42;
                            break;
                        case (quantity <= 100):
                            basePrice = 5.86;
                            break;
                        case (quantity <= 300):
                            basePrice = 5.08;
                            break;
                        case (quantity <= 500):
                            basePrice = 4.68;
                            break;
                    }
                    break;
                case "A6":
                    switch (true) {
                        case (quantity <= 5):
                            basePrice = 19.87;
                            break;
                        case (quantity <= 10):
                            basePrice = 13.87;
                            break;
                        case (quantity <= 25):
                            basePrice = 9.76;
                            break;
                        case (quantity <= 50):
                            basePrice = 9.27;
                            break;
                        case (quantity <= 100):
                            basePrice = 7.32;
                            break;
                        case (quantity <= 300):
                            basePrice = 6.34;
                            break;
                        case (quantity <= 500):
                            basePrice = 5.86;
                            break;
                    }
                    break;
                case "A5":
                    switch (true) {
                        case (quantity <= 5):
                            basePrice = 23.81;
                            break;
                        case (quantity <= 10):
                            basePrice = 16.62;
                            break;
                        case (quantity <= 25):
                            basePrice = 11.69;
                            break;
                        case (quantity <= 50):
                            basePrice = 11.11;
                            break;
                        case (quantity <= 100):
                            basePrice = 8.77;
                            break;
                        case (quantity <= 300):
                            basePrice = 7.60;
                            break;
                        case (quantity <= 500):
                            basePrice = 7.02;
                            break;
                    }
                    break;
                case "A4":
                    switch (true) {
                        case (quantity <= 5):
                            basePrice = 27.76;
                            break;
                        case (quantity <= 10):
                            basePrice = 19.38;
                            break;
                        case (quantity <= 25):
                            basePrice = 13.63;
                            break;
                        case (quantity <= 50):
                            basePrice = 12.95;
                            break;
                        case (quantity <= 100):
                            basePrice = 10.23;
                            break;
                        case (quantity <= 300):
                            basePrice = 8.86;
                            break;
                        case (quantity <= 500):
                            basePrice = 8.18;
                            break;
                    }
                    break;
                case "A3":
                    switch (true) {
                        case (quantity <= 5):
                            basePrice = 45.91;
                            break;
                        case (quantity <= 10):
                            basePrice = 32.05;
                            break;
                        case (quantity <= 25):
                            basePrice = 22.55;
                            break;
                        case (quantity <= 50):
                            basePrice = 21.42;
                            break;
                        case (quantity <= 100):
                            basePrice = 16.91;
                            break;
                        case (quantity <= 300):
                            basePrice = 14.65;
                            break;
                        case (quantity <= 500):
                            basePrice = 13.53;
                            break;
                    }
                    break;
            }

            switch (colors) {
                case 1:
                    break;
                case 2:
                    basePrice *= 1.788;
                    break;
                case 3:
                    basePrice *= 2.102;
                    break;
            }
    }
    // Kod pozostałych obliczeń cen

    const totalPrice = basePrice * quantity;

    const resultElement = document.getElementById("result");
    resultElement.innerHTML = `Cena za sztukę: <strong>${basePrice.toFixed(2)} zł</strong>, 
    Całkowita cena za ${quantity} szt.: <strong>${totalPrice.toFixed(2)} zł</strong> 
    (ceny podane w netto)`;
    //resultElement.innerHTML = `Całkowita cena: <strong>${totalPrice.toFixed(2)} zł (cena podana w netto)`;
}

function zwrocWartoscSciegow(rodzajWypelnienia, powierzchniaCm2) {
    let iloscSciegow = 0;

    if (rodzajWypelnienia === PowierzchniaWypelnienia.MINIMUM && powierzchniaCm2 > 0 && powierzchniaCm2 <= 9) {
        iloscSciegow = 3000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.SREDNIO && powierzchniaCm2 > 0 && powierzchniaCm2 <= 9) {
        iloscSciegow = 4000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.MAXIMUM && powierzchniaCm2 > 0 && powierzchniaCm2 <= 9) {
        iloscSciegow = 5000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.MINIMUM && powierzchniaCm2 > 9 && powierzchniaCm2 <= 16) {
        iloscSciegow = 3000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.SREDNIO && powierzchniaCm2 > 9 && powierzchniaCm2 <= 16) {
        iloscSciegow = 5000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.MAXIMUM && powierzchniaCm2 > 9 && powierzchniaCm2 <= 16) {
        iloscSciegow = 8000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.MINIMUM && powierzchniaCm2 > 16 && powierzchniaCm2 <= 25) {
        iloscSciegow = 3000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.SREDNIO && powierzchniaCm2 > 16 && powierzchniaCm2 <= 25) {
        iloscSciegow = 6000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.MAXIMUM && powierzchniaCm2 > 16 && powierzchniaCm2 <= 25) {
        iloscSciegow = 9000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.MINIMUM && powierzchniaCm2 > 25 && powierzchniaCm2 <= 36) {
        iloscSciegow = 5000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.SREDNIO && powierzchniaCm2 > 25 && powierzchniaCm2 <= 36) {
        iloscSciegow = 7000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.MAXIMUM && powierzchniaCm2 > 25 && powierzchniaCm2 <= 36) {
        iloscSciegow = 12000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.MINIMUM && powierzchniaCm2 > 36 && powierzchniaCm2 <= 49) {
        iloscSciegow = 6000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.SREDNIO && powierzchniaCm2 > 36 && powierzchniaCm2 <= 49) {
        iloscSciegow = 10000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.MAXIMUM && powierzchniaCm2 > 36 && powierzchniaCm2 <= 49) {
        iloscSciegow = 14000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.MINIMUM && powierzchniaCm2 > 49 && powierzchniaCm2 <= 64) {
        iloscSciegow = 6000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.SREDNIO && powierzchniaCm2 > 49 && powierzchniaCm2 <= 64) {
        iloscSciegow = 13000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.MAXIMUM && powierzchniaCm2 > 49 && powierzchniaCm2 <= 64) {
        iloscSciegow = 17000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.MINIMUM && powierzchniaCm2 > 64 && powierzchniaCm2 <= 91) {
        iloscSciegow = 6000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.SREDNIO && powierzchniaCm2 > 64 && powierzchniaCm2 <= 91) {
        iloscSciegow = 15000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.MAXIMUM && powierzchniaCm2 > 64 && powierzchniaCm2 <= 91) {
        iloscSciegow = 20000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.MINIMUM && powierzchniaCm2 > 91 && powierzchniaCm2 <= 100) {
        iloscSciegow = 7000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.SREDNIO && powierzchniaCm2 > 91 && powierzchniaCm2 <= 100) {
        iloscSciegow = 17000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.MAXIMUM && powierzchniaCm2 > 91 && powierzchniaCm2 <= 100) {
        iloscSciegow = 22000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.MINIMUM && powierzchniaCm2 > 100 && powierzchniaCm2 <= 121) {
        iloscSciegow = 7000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.SREDNIO && powierzchniaCm2 > 100 && powierzchniaCm2 <= 121) {
        iloscSciegow = 20000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.MAXIMUM && powierzchniaCm2 > 100 && powierzchniaCm2 <= 121) {
        iloscSciegow = 25000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.MINIMUM && powierzchniaCm2 > 121 && powierzchniaCm2 <= 144) {
        iloscSciegow = 7000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.SREDNIO && powierzchniaCm2 > 121 && powierzchniaCm2 <= 144) {
        iloscSciegow = 22000;
    } else if (rodzajWypelnienia === PowierzchniaWypelnienia.MAXIMUM && powierzchniaCm2 > 121 && powierzchniaCm2 <= 144) {
        iloscSciegow = 30000;
    } else {
        iloscSciegow = null;
    }

    return iloscSciegow;
}

// Pobierz pola wyboru
const sizeSelectDTF = document.getElementById("sizeDTF");
const quantityInput = document.getElementById("quantityDTF");


function calculatePriceDTF() {
    const printType = document.getElementById("printType").value;
    const size = document.getElementById("sizeDTF").value;
    const quantity = parseInt(document.getElementById("quantityDTF").value);

    let basePrice = 0;
    switch (size) {
        case "A7":
            switch (true) {
                case (quantity <= 5):
                    basePrice = 21.99;
                    break;
                case (quantity <= 10):
                    basePrice = 15.35;
                    break;
                case (quantity <= 25):
                    basePrice = 10.80;
                    break;
                case (quantity <= 50):
                    basePrice = 10.26;
                    break;
                case (quantity <= 100):
                    basePrice = 8.10;
                    break;
                case (quantity <= 300):
                    basePrice = 7.02;
                    break;
                case (quantity <= 500):
                    basePrice = 6.48;
                    break;
            }
            break;
        case "A6":
            switch (true) {
                case (quantity <= 5):
                    basePrice = 27.48;
                    break;
                case (quantity <= 10):
                    basePrice = 19.19;
                    break;
                case (quantity <= 25):
                    basePrice = 13.50;
                    break;
                case (quantity <= 50):
                    basePrice = 12.82;
                    break;
                case (quantity <= 100):
                    basePrice = 10.10;
                    break;
                case (quantity <= 300):
                    basePrice = 8.80;
                    break;
                case (quantity <= 500):
                    basePrice = 8.10;
                    break;
            }
            break;
        case "A5":
            switch (true) {
                case (quantity <= 5):
                    basePrice = 32.93;
                    break;
                case (quantity <= 10):
                    basePrice = 22.99;
                    break;
                case (quantity <= 25):
                    basePrice = 16.17;
                    break;
                case (quantity <= 50):
                    basePrice = 15.36;
                    break;
                case (quantity <= 100):
                    basePrice = 12.13;
                    break;
                case (quantity <= 300):
                    basePrice = 10.51;
                    break;
                case (quantity <= 500):
                    basePrice = 9.70;
                    break;
            }
            break;
        case "A4":
            switch (true) {
                case (quantity <= 5):
                    basePrice = 38.40;
                    break;
                case (quantity <= 10):
                    basePrice = 26.81;
                    break;
                case (quantity <= 25):
                    basePrice = 18.86;
                    break;
                case (quantity <= 50):
                    basePrice = 17.92;
                    break;
                case (quantity <= 100):
                    basePrice = 14.14;
                    break;
                case (quantity <= 300):
                    basePrice = 12.26;
                    break;
                case (quantity <= 500):
                    basePrice = 11.32;
                    break;
            }
            break;
        case "A3":
            switch (true) {
                case (quantity <= 5):
                    basePrice = 63.50;
                    break;
                case (quantity <= 10):
                    basePrice = 44.34;
                    break;
                case (quantity <= 25):
                    basePrice = 31.19;
                    break;
                case (quantity <= 50):
                    basePrice = 29.63;
                    break;
                case (quantity <= 100):
                    basePrice = 23.39;
                    break;
                case (quantity <= 300):
                    basePrice = 20.27;
                    break;
                case (quantity <= 500):
                    basePrice = 18.71;
                    break;
            }
            break;
    }


    // Obliczenia cen

    const totalPrice = basePrice * quantity;
    // Pamiętaj, żeby zdefiniować resultElement, bo go wcześniej nie miałeś
    const resultElement = document.getElementById("resultDTF");
    // resultElement.innerHTML = `Całkowita cena: <strong>${totalPrice.toFixed(2)} zł (cena podana w netto)`;

    resultElement.innerHTML = `Cena za sztukę: <strong>${basePrice.toFixed(2)} zł</strong>, 
    Całkowita cena za ${quantity} szt.: <strong>${totalPrice.toFixed(2)} zł</strong> 
    (ceny podane w netto)`;
}


function otworzKalkulator(id) {
    // Ukryj wszystkie kalkulatory
    var kalkulatory = document.querySelectorAll("[id^='kalkulator']");
    for (var i = 0; i < kalkulatory.length; i++) {
        kalkulatory[i].style.display = "none";
    }
    // Pokaż wybrany kalkulator
    document.getElementById(id).style.display = "block";
}
