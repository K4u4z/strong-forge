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

                      <a href="/findAllLista">Treinos</a>

                      <a href="/findAllExercicio">Exercícios</a>

                      <c:if test="${sessionScope.loggedUsuario != null}">
                      <a href="/findAllUsuario">Admin</a>
                       </c:if>

                  </div>
              </nav>

        <div class="exercicio-detalhes">
            <h2>${lista.nome}</h2>
            <p class="lista-data">Data: ${lista.data}</p> <!-- Adicionando a data -->

            <div class="exercicios-container">
                <c:choose>
                    <c:when test="${not empty lista.exercicios}">
                        <c:forEach var="exercicio" items="${lista.exercicios}">
                            <div class="exercise-card">
                                <h3>${exercicio.nome}</h3>


                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p>Nenhum exercício encontrado nesta lista.</p>
                    </c:otherwise>
                </c:choose>
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