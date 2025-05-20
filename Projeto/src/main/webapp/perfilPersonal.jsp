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
            <section class="featured-trainers">
                <h2>Personal Trainer </h2>
                <div class="trainer-card">
                    <div class="trainer-photo">
                        <img src="${personais.image}" alt="${personais.image}">
                    </div>
                    <div class="trainer-info">
                        <h3>${personais.nome}</h3>
                        <p class="age-location">26 anos | São Paulo</p>
                        <p class="education">Formação: Senac</p>

                        <div class="specialties">
                            <h4>Especialidades:</h4>
                            <ul>
                                <li>Treinamento de emagrecimento/definição</li>
                                <li>Hipertrofia para mulheres e homens</li>
                                <li>Treinamento cardiovascular</li>
                                <li>Condicionamento físico</li>
                            </ul>
                        </div>

                        <div class="services">
                            <h4>Descrição:</h4>

                        </div>

                        <div class="philosophy">
                            <p>${personais.nome}</p>
                        </div>
                        <button class="contact-btn">Entrar em Contato</button>

                    </div>
                </div>
            </section>

            <section class="how-it-works">
                <h2>Como Funciona</h2>
                <div class="steps">
                    <div class="step">
                        <span>1</span>
                        <h3>Busque</h3>
                        <p>Encontre o personal trainer que melhor atende suas necessidades.</p>
                    </div>
                    <div class="step">
                        <span>2</span>
                        <h3>Conecte</h3>
                        <p>Entre em contato diretamente com o profissional.</p>
                    </div>
                    <div class="step">
                        <span>3</span>
                        <h3>Treine</h3>
                        <p>Comece sua jornada rumo aos seus objetivos fitness.</p>
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

</body>

</html>