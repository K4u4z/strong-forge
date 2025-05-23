<!DOCTYPE html>
<html lang="pt-br">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Strong Forge</title>
    <link rel="stylesheet" href="css/style2.css">
</head>

<body>
    <div class="container">
        <nav>
            <div class="logo">
                <img src="img/logo01.png" alt="Logo">
                <p>"Transforme seu corpo, fortaleça sua mente."</p>
            </div>
            <div class="nav-links">
                <div class="auth-buttons">
                    <a href="login.jsp" class="btn-login">Login</a>
                    <a href="cadastro.jsp" class="btn-cadastro">Cadastro</a>
                </div>

                <a href="home.jsp">Home</a>
                <a href="/findAllPersonal">Personais</a>
                <a href="/findAllLista">Treinos</a>
                <a href="/findAllExercicio">Exercícios</a>

                <c:if test="${sessionScope.loggedUsuario != null}">
                    <a href="admin.jsp">Admin</a>
                </c:if>
            </div>
        </nav>

        <main>
            <div class="exercicio-detalhes">
                <section class="detalhes exercicio">
                    <h3>${exercicio.nome}</h3>
                    <img src="${exercicio.image}" alt="exercicio_imagem">
                    <h4>agrupamento</h4>
                    <h3>${exercicio.agrupamento}</h3>
                    <h4>nivel</h4>
                    <h3>${exercicio.nivel}</h3>
                    <h4>Passo a Passo</h4>
                    <p>${exercicio.descricao}</p>
                    <h3>Como executar</h3>
                    <iframe src="${exercicio.video}" frameborder="0" allowfullscreen></iframe>
                </section>
            </div>
        </main>
    </div>

    <footer>
        <div class="footer-content">
            <div class="footer-section">
                <h4>Sobre Nós</h4>
                <p>Strong Forge é dedicada a fornecer informações de qualidade sobre exercícios e treinamento físico. Nosso objetivo é ajudar você a alcançar seus objetivos de forma segura e eficiente.</p>
            </div>
            <div class="footer-section">
                <h4>Contato</h4>
                <p>Email: contato@stronggym.com</p>
                <p>Telefone: (11) 98765-4321</p>
            </div>
            <div class="footer-section">
                <h4>Redes Sociais</h4>
                <a href="#">Instagram</a>
                <a href="#">Facebook</a>
                <a href="#">YouTube</a>
            </div>
        </div>
        <div class="footer-bottom">
            &copy; 2025 Strong Gym. Todos os direitos reservados.
        </div>
    </footer>
</body>
</html>
