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
                        <a href="personais.html">Personais</a>

                        <a href="/findAllLista">Treinos</a>

                        <a href="/findAllExercicio">Exercícios</a>

                        <c:if test="${sessionScope.loggedUsuario != null}">
                        <a href="/findAllUsuario">Admin</a>
                         </c:if>

                    </div>
                </nav>





                     <br>
                     <br>
                     <form action="/cadastrarExerciciosLista" method="post">
                         <input type="hidden" name="id" value="${param.id}">

                         <section>
                             <h2>Adicionar Exercícios à Lista</h2>
                         </section>

                         <section class="exercises-checklist">
                             <c:forEach var="exercicio" items="${exercicios}">
                                 <div class="exercise-checklist-item">
                                     <label class="exercise-checklist-label">
                                         <input type="checkbox"
                                                name="exerciciosSelecionados"
                                                value="${exercicio.id}"
                                                class="exercise-checklist-input">
                                         <span class="exercise-checklist-custom"></span>
                                         <span class="exercise-checklist-name">${exercicio.nome}</span>
                                     </label>
                                 </div>
                             </c:forEach>
                         </section>

                         <br>
                         <div>
                             <button id="Btn_cad" type="submit">Adicionar Exercícios</button>
                         </div>

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

