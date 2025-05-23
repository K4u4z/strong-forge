<!DOCTYPE html>
<html lang="pt-br">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adicionar Exercícios - Strong Forge</title>
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

        <main class="main-checklist">
            <section class="formulario-exercicios">
                <h2 class="titulo-formulario">Adicionar Exercícios à Lista</h2>
                <form action="/cadastrarExerciciosLista" method="post">
                    <input type="hidden" name="id" value="${param.id}">

                    <section class="exercises-checklist">
                        <c:forEach var="exercicio" items="${exercicios}">
                            <label class="exercise-checklist-item">
                                <input type="checkbox" name="exerciciosSelecionados" value="${exercicio.id}">
                                <span class="exercise-checklist-name">${exercicio.nome}</span>
                            </label>
                        </c:forEach>
                    </section>

                    <div class="grupo-botao">
                        <button type="submit">Adicionar Exercícios</button>
                    </div>
                </form>
            </section>
        </main>
    </div>


</body>
</html>
