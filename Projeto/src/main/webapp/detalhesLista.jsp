<!DOCTYPE html>
<html lang="pt-br">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalhes da Lista - Strong Forge</title>
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

                        <br>
                        <a href="home.jsp">Home</a>
                        <a href="/findAllPersonal">Personais</a>

                        <a href="/findAllLista">Treinos</a>

                        <a href="/findAllExercicio">Exercícios</a>

                        <c:if test="${sessionScope.loggedUsuario != null}">
                                     <a href="admin.jsp">Admin</a>
                                      </c:if>

                    </div>
                </nav>

        <main class="lista-detalhes-main">
            <section class="lista-detalhes">
                <h1 class="titulo-lista">${lista.nome}</h1>
                <p class="info-lista">📅 Data: <strong>${lista.data}</strong></p>
                <p class="info-lista">📆 Dia da Semana: <strong>${lista.dia}</strong></p>

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
                            <p class="sem-exercicio">Nenhum exercício encontrado nesta lista.</p>
                        </c:otherwise>
                    </c:choose>
                </div>
            </section>
        </main>


    </div>
</body>
</html>
