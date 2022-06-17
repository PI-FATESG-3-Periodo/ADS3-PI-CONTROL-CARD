<%-- 
    Document   : index
    Created on : 24 de mai. de 2022, 13:02:14
    Author     : WsmGyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>HomePage - ControlCard - PI</title>
        <link rel="shortcut icon" type="imagem/x-icon" href="css/imgs/favicon.svg" />
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <main class="container-home">
            <header class="header-homepage">
                <img src="css/imgs/logoPIAzul.svg" alt="logoPI">
                <nav class="btns-home">
                    <a href="login.jsp">
                        <button class="entrar">Entrar</button>
                    </a>
                    <a href="cadastro.jsp">
                        <button class="cadastrar">Cadastrar</button>
                    </a>

                </nav>
            </header>
            <div class="main-homepage">
                <section class="section-homepage">
                    <div class="info-info-homepage">
                        <h1>Quer ter controle <span>financeiro</span> em sua vida?</h1>
                        <h3>Conheça a Control Card:</h3>
                        <p>
                            Descriçao -> finalidade: Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                            Aenean molestie consequat dui. Aenean dictum volutpat felis. Nullam porta erat massa, 
                            molestie pharetra est gravida a. Interdum et malesuada fames ac ante ipsum primis in faucibus. 
                            Quisque posuere egestas turpis.
                        </p>
                        <a href="cadastro.jsp">
                            <button class="vamos-comecar">
                                Vamos Começar
                            </button>
                        </a>

                    </div>
                    <div class="info-homepage">
                        <img src="css/imgs/homepage.svg" alt="imagem homem e mulher controle financeiro homepage">
                    </div>
                </section>
            </div>

        </main>

        <footer class="footer-homepage">
            <p>Desenvolvidso por G2 - PI 3º Período | 2022</p>
        </footer>

    </body>
</html>
