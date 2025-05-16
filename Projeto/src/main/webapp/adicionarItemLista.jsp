<!DOCTYPE html>
<html lang="pt-br">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Strong Forge</title>
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
                <a href="home.jsp">Home</a>
                <a href="personais.html">Personais</a>
                <a href="cronograma.html">Cronograma</a>
                <a href="exercicios.jsp">Exercícios</a>
            </div>
        </nav>



                     <h1>Adicionar Exercícios à Lista</h1>
                      <form action="/CreateExercItem" method="post">
                          <input type="hidden" name="idLista" value="${param.idLista}">

                          <c:forEach var="exercicio" items="${exercicios}>
                              <input type="checkbox" name="exercicios" value="${exercicio.id}"> ${exercicio.nome}<br>
                          </c:forEach>

                          <button type="submit">Adicionar Exercícios</button>
                      </form>



            </div>
        </main>
    </div>

    <footer>
        <div class="footer-content">
            <div class="footer-section">
                <h4>Sobre Nós</h4>
                <p>Strong Gym é dedicada a fornecer informações de qualidade sobre exercícios e treinamento físico. Nosso objetivo é ajudar você a alcançar seus objetivos de forma segura e eficiente.</p>
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
            &copy; 2023 Strong Gym. Todos os direitos reservados.
        </div>
    </footer>

</body>

</html>

