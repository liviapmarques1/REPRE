fetch("Components/headerSet.php") //Procura o arquivo
    .then(response => response.text()) //Pega como resposta o que foi procurado e transforma em texto
    .then(data => { //variavel que guarda o texto
        document.getElementById("headerSet").innerHTML = data; //innerHTML coloca o texto no html

        //=========================================
        const menuBtn = document.getElementById("menu-btn");
        const closeBtn = document.getElementById("close-btn");
        const navbar = document.getElementById("navbar");

        menuBtn.addEventListener("click", () => {
            navbar.classList.toggle("opened");
        });
        closeBtn.addEventListener("click", () => {
            navbar.classList.remove("opened");
        });
        //=============================================
    });
