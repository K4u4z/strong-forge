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
                <img src="img/logo2.png" alt="Logo">
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
           <h1>${exercicio.nome}</h1>
           <p><strong>Nível:</strong> ${exercicio.nivel}</p>
           <p><strong>Agrupamento:</strong> ${exercicio.agrupamento}</p>
           <p><strong>Descrição:</strong> ${exercicio.descricao}</p>

           <c:if test="${not empty exercicio.image}">
               <img src="${exercicio.image}" alt="Demonstração do exercício">
           </c:if>

           <c:if test="${not empty exercicio.video}">
               <video controls>
                   <source src="${exercicio.video}" type="video/mp4">
               </video>
           </c:if>
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