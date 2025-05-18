<!DOCTYPE html>
<html lang="pt-br">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Strong Forge - Detalhes da Lista</title>
    <link rel="stylesheet" href="css/style.css">
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
                <br>
                <a href="home.jsp">Home</a>
                <a href="personais.html">Personais</a>
                <a href="cronograma.html">Cronograma</a>
                <a href="exercicios.html">Exercícios</a>
                <c:if test="${sessionScope.loggedUsuario != null}">
                    <a href="/findAllUsuario">Admin</a>
                </c:if>
            </div>
        </nav>

        <div class="exercicio-detalhes">
            <h2>${lista.nome}</h2>

            <div class="exercicios-container">
                <c:forEach var="exercicio" items="${lista.exercicios}">
                    <div class="exercise-card">
                        <img src="${exercicio.image}" alt="${exercicio.nome}">
                        <h3>${exercicio.nome}</h3>
                        <p><strong>Grupo Muscular:</strong> ${exercicio.agrupamento}</p>
                        <p><strong>Nível:</strong> ${exercicio.nivel}</p>
                        <p>${exercicio.descricao}</p>
                        <c:if test="${not empty exercicio.video}">
                            <a href="${exercicio.video}" target="_blank" class="btn-video">Ver Vídeo</a>
                        </c:if>
                    </div>
                </c:forEach>
            </div>
        </div>

        <footer>
            <div class="footer-content">
                <div class="footer-section">
                    <h4>Sobre Nós</h4>
                    <p>Strong Forge é dedicada a fornecer informações de qualidade sobre exercícios e treinamento físico.</p>
                </div>
                <div class="footer-section">
                    <h4>Contato</h4>
                    <p>Email: contato@strongforge.com</p>
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
                &copy; 2025 Strong Forge. Todos os direitos reservados.
            </div>
        </footer>
    </div>
</body>
</html>