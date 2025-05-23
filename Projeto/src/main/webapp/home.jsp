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
<c:if test="${not empty sessionScope.loggedUsuario}">
    <div class="user-menu" id="userMenu">
        <img src="img/icon.png" alt="icone" class="user-icon" title="Usuário">

        <div class="user-dropdown" id="userDropdown" style="display:none;">
            <form action="logout" method="post">
                <button type="submit" class="btn-logout">Deslogar</button>
            </form>
        </div>
    </div>
</c:if>

        <main>
            <section class="welcome-section">
                <h2>Bem-vindo à Strong Forge!</h2>
                <p class="welcome-message">
                    <strong>Transforme seu corpo, fortaleça sua mente.</strong> na academia onde limites são desafiados e metas se tornam realidade.
                    Na Strong Forge, não moldamos apenas músculos - forjamos <strong>determinação, disciplina</strong> e 
                    <strong>resultados que permanecem</strong>.
                </p>
                <p class="cta-subtext">
                    Comece hoje sua jornada com treinos <strong>personalizados</strong>, equipamentos <strong>de ponta</strong> 
                    e o suporte de profissionais <strong>certificados</strong>.
                </p>
                <img src="img/img academia.png" alt="Academia Strong Forge - Ambiente moderno com pessoas treinando" class="welcome-image">
            </section>

            <section class="mission-section">
                <h3>Nossa Missão</h3>
                <blockquote>
                    "Nossa missão é ajudar você a superar limites com treinos inteligentes, nutrição estratégica e motivação diária.
                    Com anos de experiência no universo fitness, oferecemos conhecimento, suporte e planos para impulsionar sua jornada.
                    Acreditamos que cada repetição conta, cada gota de suor fortalece, e cada desafio vencido é uma vitória rumo ao seu melhor físico.”
                </blockquote>
            </section>

            <section class="services-section">
                <h3>Nossos Diferenciais</h3>
                <div class="services-grid">
                    <div class="service-card">
                        <h4>Treino Personalizado</h4>
                        <p>Ferramentas de plano de treino para ajudar a adaptar seu corpo e mente para novos desafios.</p>
                    </div>
                    <div class="service-card">
                        <h4>Conhecimento de Ponta</h4>
                        <p>Material completo sobre cada exercicio e suas particularidades</p>
                    </div>
                    <div class="service-card">
                        <h4>Comunidade Motivadora</h4>
                        <p>Treine em grupo e compartilhe conquistas.</p>
                    </div>
                </div>
            </section>

            <!-- Mapa de Localização -->
            <section class="location-section">
                <h3>Venha nos Visitar</h3>
                <div class="map-container">
                    <iframe 
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3657.0754267452926!2d-46.65342658447536!3d-23.565734367638155!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce59c8da0aa315%3A0xd59f9431f2c9776a!2sAv.%20Paulista%2C%201000%20-%20Bela%20Vista%2C%20S%C3%A3o%20Paulo%20-%20SP!5e0!3m2!1spt-BR!2sbr!4v1620000000000!5m2!1spt-BR!2sbr" 
                        width="100%" 
                        height="400" 
                        style="border:0;" 
                        allowfullscreen="" 
                        loading="lazy">
                    </iframe>
                    <p>
                        <strong>Endereço:</strong> Av. Paulista, 1000 - Bela Vista, São Paulo - SP<br>
                        <strong>Horário:</strong> Seg-Sex: 6h às 22h | Sáb: 8h às 14h
                    </p>
                </div>
            </section>
        </main>
    </div>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const userMenu = document.getElementById('userMenu');
        const userDropdown = document.getElementById('userDropdown');

        userMenu.addEventListener('click', function(event) {
            event.stopPropagation();
            if (userDropdown.style.display === 'none' || userDropdown.style.display === '') {
                userDropdown.style.display = 'block';
            } else {
                userDropdown.style.display = 'none';
            }
        });

        document.addEventListener('click', function() {
            userDropdown.style.display = 'none';
        });
    });
</script>


    
</body>
</html>