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

      <main class="exercicio-detalhado">
          <article class="card-detalhes">
              <h2 class="titulo-exercicio">${exercicio.nome}</h2>
              <img class="imagem-exercicio" src="${exercicio.image}" alt="Imagem do Exercício">

              <div class="info-basica">
                  <div><strong>Agrupamento:</strong> ${exercicio.agrupamento}</div>
                  <div><strong>Nível:</strong> ${exercicio.nivel}</div>
              </div>

              <section class="descricao">
                  <h3>Passo a Passo</h3>
                  <p>${exercicio.descricao}</p>
              </section>

              <section class="video">
                  <h3>Como Executar</h3>
                  <div class="video-wrapper">
                      <iframe src="${exercicio.video}" frameborder="0" allowfullscreen></iframe>
                  </div>
              </section>
          </article>
      </main>

    </div>


</body>
</html>
