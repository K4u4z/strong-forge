<!DOCTYPE html>
<html lang="pt-br">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Strong Forge</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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

    <main>

        <section class="exercise-categories">
            <h2>Selecione um Exercício</h2>
            <div class="category-buttons">
                <button class="category-btn active" data-category="all">Todos</button>
                <button class="category-btn" data-category="perna">Perna</button>
                <button class="category-btn" data-category="costas">Costas</button>
                <button class="category-btn" data-category="abdomen">Abdômen</button>
                <button class="category-btn" data-category="gluteos">Glúteos</button>
                <button class="category-btn" data-category="peito">Peito</button>
                <button class="category-btn" data-category="braco">Braço</button>
                <button class="category-btn" data-category="cardio">Cardio</button>
            </div>
        </section>


        <section class="exercises-container">
            <c:forEach var="exercicio" items="${exercicios}">
                <div class="exercise-card" data-category="${exercicio.agrupamento.toLowerCase()}">
                    <img src="${exercicio.image}" alt="exercicio_imagem">
                    <h3>${exercicio.nome}</h3>
                    <p>${exercicio.descricao}</p>

                    <form action="detalhesExercicioById" method="GET">
                        <input type="hidden" name="id" value="${exercicio.id}">
                        <button type="submit" class="action-btn delete-btn">Ver detalhes</button>
                    </form>
                </div>
            </c:forEach>
        </section>


    </main>
</div>


<script>
    document.addEventListener('DOMContentLoaded', function () {
        const categoryButtons = document.querySelectorAll('.category-btn');
        const exerciseCards = document.querySelectorAll('.exercise-card');

        categoryButtons.forEach(button => {
            button.addEventListener('click', () => {
                // Remove active class from all buttons
                categoryButtons.forEach(btn => btn.classList.remove('active'));
                // Add active class to clicked button
                button.classList.add('active');

                const category = button.dataset.category;

                // Filter exercises
                exerciseCards.forEach(card => {
                    if (category === 'all' || card.dataset.category === category) {
                        card.style.display = 'block';
                    } else {
                        card.style.display = 'none';
                    }
                });
            });
        });
    });
</script>
</body>

</html>