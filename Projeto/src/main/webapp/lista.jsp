<!DOCTYPE html>
<html lang="pt-br">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Strong Forge - Criar Treino</title>
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

        <main class="main-formulario">
            <section class="formulario-treino">
                <h2 class="titulo-formulario">Criar Novo Treino</h2>
                <form action="/createLista" method="post">
                    <div class="grupo-campo">
                        <label for="lista-nome">Nome da Lista</label>
                        <input type="text" name="lista-nome" id="lista-nome" required>
                    </div>

                    <div class="grupo-campo">
                        <label for="data-lista">Data da Lista</label>
                        <input type="text" name="data-lista" id="data-lista" required>
                    </div>

                    <div class="grupo-campo">
                        <label for="dia-lista">Dia</label>
                        <select name="dia-lista" id="dia-lista">
                            <option value="SEGUNDA">Segunda</option>
                            <option value="TERÇA">Terça</option>
                            <option value="QUARTA">Quarta</option>
                            <option value="QUINTA">Quinta</option>
                            <option value="SEXTA">Sexta</option>
                            <option value="SABADO">Sábado</option>
                            <option value="DOMINGO">Domingo</option>
                        </select>
                    </div>

                    <div class="grupo-botao">
                        <button type="submit">Criar</button>
                    </div>
                </form>
            </section>
        </main>
    </div>


</body>
</html>
