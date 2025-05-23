<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link href="css/style.css" rel="stylesheet">
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
  <div>

           <a href="/cadExerc.jsp" class="logout-btn">Adicionar exercicio</a>
<div class="content-block">
        <h1 style="color: #343a40; border-bottom: 2px solid #28a745; padding-bottom: 10px;">Gerenciamento de Exercicios</h1>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Agrupamento</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="Exercicio" items="${exercicios}">
                    <tr>
                        <td>${Exercicio.id}</td>
                        <td>${Exercicio.nome}</td>
                        <td>${Exercicio.agrupamento}</td>
                        <td>
                        <span class="divider">|</span>


                        <br>
                            <form action="/delete-exercicio" method="post" style="display: inline;">
                                <input type="hidden" id="id" name="id" value="${Exercicio.id}">
                                <button type="submit" class="action-btn delete-btn">Excluir</button>
                            </form>



                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>