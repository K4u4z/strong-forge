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

        <main>
            <section class="featured-trainers">
                <h2>Personal Trainer </h2>
                <div class="trainer-card">
                    <div class="trainer-photo">
                        <img src="${personais.image}" alt="${personais.image}">
                    </div>
                    <div class="trainer-info">
                        <h3>${personais.nome}</h3>



                        <div class="specialties">
                            <h4>Especialidades:</h4>
                            <ul>
                                "${personais.especialidade}"
                            </ul>
                        </div>

                        <div class="services">
                            <h4>Descrição:</h4>

                        </div>

                        <div class="specialties">
                                                    <h4>Contato:</h4>
"${personais.contato}"
                                                </div>

                        <div class="philosophy">
                            <p>${personais.nome}</p>
                        </div>
                        <button class="contact-btn">Entrar em Contato</button>
                         <div id="contactModal" class="modal">
                                    <div class="modal-content">
                                        <span class="close-btn">&times;</span>
                                        <h3>Solicitação enviada!</h3>
                                        <p>Entraremos em contato com <strong>${personais.nome}</strong> solicitando retorno para você.</p>
                                        <p>Obrigado por usar o Strong Forge!</p>
                                        <button id="okButton">OK</button>
                                    </div>
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




        </div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const contactBtn = document.querySelector(".contact-btn");
        const modal = document.getElementById("contactModal");
        const closeBtn = document.querySelector(".close-btn");
        const okButton = document.getElementById("okButton");

        contactBtn.addEventListener("click", function () {
            modal.style.display = "block";

            // Simula envio de mensagem (poderia ser um POST AJAX aqui)
            console.log("Mensagem enviada ao personal trainer solicitando contato.");
        });

        closeBtn.addEventListener("click", function () {
            modal.style.display = "none";
        });

        okButton.addEventListener("click", function () {
            modal.style.display = "none";
        });

        // Fecha ao clicar fora do modal
        window.addEventListener("click", function (e) {
            if (e.target == modal) {
                modal.style.display = "none";
            }
        });
    });
</script>
</body>

</html>