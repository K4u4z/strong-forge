<!DOCTYPE html>
<html lang="pt-br">

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

            <section class="exercises-grid">
                <h2>Exercícios Disponíveis</h2>
                <div class="exercises-container">
                    <!-- Perna -->
                    <div class="exercise-card" data-category="perna">
                        <img src="images/agachamento.jpg" alt="Agachamento Livre">
                        <h3>Agachamento Livre</h3>
                        <p>Exercício completo para desenvolvimento das pernas.</p>
                        <a href="exercicios/agachamento.html" class="exercise-btn">Ver Detalhes</a>
                    </div>

                    <div class="exercise-card" data-category="perna">
                        <img src="images/leg-press.jpg" alt="Leg Press">
                        <h3>Leg Press</h3>
                        <p>Excelente para quadríceps e posterior de coxa.</p>
                        <a href="exercicios/leg-press.html" class="exercise-btn">Ver Detalhes</a>
                    </div>

                    <!-- Costas -->
                    <div class="exercise-card" data-category="costas">
                        <img src="images/barra-fixa.jpg" alt="Barra Fixa">
                        <h3>Barra Fixa</h3>
                        <p>Exercício fundamental para desenvolvimento das costas.</p>
                        <a href="exercicios/barra-fixa.html" class="exercise-btn">Ver Detalhes</a>
                    </div>

                    <div class="exercise-card" data-category="costas">
                        <img src="images/remada-curvada.jpg" alt="Remada Curvada">
                        <h3>Remada Curvada</h3>
                        <p>Excelente para espessura das costas.</p>
                        <a href="exercicios/remada-curvada.html" class="exercise-btn">Ver Detalhes</a>
                    </div>

                    <!-- Abdômen -->
                    <div class="exercise-card" data-category="abdomen">
                        <img src="images/prancha.jpg" alt="Prancha">
                        <h3>Prancha</h3>
                        <p>Fortalece todo o core e abdômen.</p>
                        <a href="exercicios/prancha.html" class="exercise-btn">Ver Detalhes</a>
                    </div>

                    <div class="exercise-card" data-category="abdomen">
                        <img src="images/abdominal-supra.jpg" alt="Abdominal Supra">
                        <h3>Abdominal Supra</h3>
                        <p>Foco na parte superior do abdômen.</p>
                        <a href="exercicios/abdominal-supra.html" class="exercise-btn">Ver Detalhes</a>
                    </div>

                    <!-- Glúteos -->
                    <div class="exercise-card" data-category="gluteos">
                        <img src="images/agachamento-sumo.jpg" alt="Agachamento Sumô">
                        <h3>Agachamento Sumô</h3>
                        <p>Excelente para glúteos e parte interna das coxas.</p>
                        <a href="exercicios/agachamento-sumo.html" class="exercise-btn">Ver Detalhes</a>
                    </div>

                    <div class="exercise-card" data-category="gluteos">
                        <img src="images/elevacao-pelvica.jpg" alt="Elevação Pélvica">
                        <h3>Elevação Pélvica</h3>
                        <p>Exercício isolado para glúteos.</p>
                        <a href="exercicios/elevacao-pelvica.html" class="exercise-btn">Ver Detalhes</a>
                    </div>

                    <!-- Peito -->
                    <div class="exercise-card" data-category="peito">
                        <img src="images/supino.jpg" alt="Supino Reto">
                        <h3>Supino Reto</h3>
                        <p>Exercício fundamental para peitoral.</p>
                        <a href="exercicios/supino.html" class="exercise-btn">Ver Detalhes</a>
                    </div>

                    <div class="exercise-card" data-category="peito">
                        <img src="images/crucifixo.jpg" alt="Crucifixo">
                        <h3>Crucifixo</h3>
                        <p>Excelente para alongamento do peitoral.</p>
                        <a href="exercicios/crucifixo.html" class="exercise-btn">Ver Detalhes</a>
                    </div>

                    <!-- Braço -->
                    <div class="exercise-card" data-category="braco">
                        <img src="images/rosca-direta.jpg" alt="Rosca Direta">
                        <h3>Rosca Direta</h3>
                        <p>Clássico para desenvolvimento do bíceps.</p>
                        <a href="exercicios/rosca-direta.html" class="exercise-btn">Ver Detalhes</a>
                    </div>

                    <div class="exercise-card" data-category="braco">
                        <img src="images/triceps-testa.jpg" alt="Tríceps Testa">
                        <h3>Tríceps Testa</h3>
                        <p>Exercício eficaz para tríceps.</p>
                        <a href="exercicios/triceps-testa.html" class="exercise-btn">Ver Detalhes</a>
                    </div>

                    <!-- Cardio -->
                    <div class="exercise-card" data-category="cardio">
                        <img src="images/corrida.jpg" alt="Corrida">
                        <h3>Corrida</h3>
                        <p>Exercício cardiovascular completo.</p>
                        <a href="exercicios/corrida.html" class="exercise-btn">Ver Detalhes</a>
                    </div>

                    <div class="exercise-card" data-category="cardio">
                        <img src="images/burpee.jpg" alt="Burpee">
                        <h3>Burpee</h3>
                        <p>Exercício completo que combina força e cardio.</p>
                        <a href="exercicios/burpee.html" class="exercise-btn">Ver Detalhes</a>
                    </div>
                </div>
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