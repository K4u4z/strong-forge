<!DOCTYPE html>
<html lang="pt-br">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Strong Forge</title>
    <link rel="stylesheet" href="css/style2.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>
    <div class="container">
        <nav>
            <div class="logo">
                <img src="img/logo2.png" alt="Logo">
                <p>"Transforme seu corpo, fortaleça sua mente."</p>
            </div>
            <div class="nav-links">
                <a href="home.jsp">Home</a>
                <a href="personais.html">Personais</a>
                <a href="cronograma.html">Cronograma</a>
                <a href="exercicios.html">Exercícios</a>


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