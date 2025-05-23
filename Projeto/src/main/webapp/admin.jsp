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

    <section class="exercise-categories">
        <h2>Administração</h2>
        <h3>
            <p>Modulo destinado a todos os usuários com permissão
                de administrador, afim de permitir administração
                dos campos de usuario e exercicios</p>
        </h3>
        <h3>
            <p>Selecione a opção desejada</p>
        </h3>
        
        <div class="card-container">
            <div class="card">
                <h4>Exercicio</h4>
                <p>Acesse exercicios</p>
                <a href="/findAllExercicioAdmin" class="card-btn">Acessar</a>
            </div>
            
            <div class="card">
                <h4>Usuario</h4>
                <p>Acessar Usuario</p>
                <a href="/findAllUsuario" class="card-btn">Acessar</a>
            </div>
        </div>
    <section class="exercise-categories">

</div>



</body>

</html>