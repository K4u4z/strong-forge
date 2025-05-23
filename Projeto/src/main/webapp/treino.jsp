<!DOCTYPE html>
<html lang="pt-br">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Strong Forge - Treinos</title>
    <link rel="stylesheet" href="css/style2.css">
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

<section class="exercises-container">
         <!-- Seção de Filtros -->

         <section class="treinos-filters">
             <h2><i class="fas fa-filter"></i> Filtrar Treinos</h2>
             <div class="treinos-filter-buttons">
                 <button class="treinos-filter-btn active" onclick="filterTreinosByDay('all')">
                     <i class="fas fa-list"></i> Todos
                 </button>
                 <button class="treinos-filter-btn" onclick="filterTreinosByDay('SEGUNDA')">
                     <i class="fas fa-calendar-day"></i> Segunda
                 </button>
                 <button class="treinos-filter-btn" onclick="filterTreinosByDay('TERÇA')">
                     <i class="fas fa-calendar-day"></i> Terça
                 </button>
                 <button class="treinos-filter-btn" onclick="filterTreinosByDay('QUARTA')">
                     <i class="fas fa-calendar-day"></i> Quarta
                 </button>
                 <button class="treinos-filter-btn" onclick="filterTreinosByDay('QUINTA')">
                     <i class="fas fa-calendar-day"></i> Quinta
                 </button>
                 <button class="treinos-filter-btn" onclick="filterTreinosByDay('SEXTA')">
                     <i class="fas fa-calendar-day"></i> Sexta
                 </button>
                 <button class="treinos-filter-btn" onclick="filterTreinosByDay('SABADO')">
                     <i class="fas fa-calendar-day"></i> Sábado
                 </button>
                 <button class="treinos-filter-btn" onclick="filterTreinosByDay('DOMINGO')">
                     <i class="fas fa-calendar-day"></i> Domingo
                 </button>
             </div>
         </section>
 <!-- Lista de Treinos -->
         <div class="treinos-container">
             <a href="lista.jsp" class="add-treino-btn">
                 <i class="fas fa-plus"></i> Adicionar Novo Treino
             </a>

             <div class="treinos-list-header">
                 <div>Nome do Treino</div>
                 <div>Data</div>
                 <div>Dia</div>
                 <div>Ações</div>
             </div>

             <div class="treinos-list-items">
                 <c:forEach var="Lista" items="${listas}">
                     <div class="treino-item" data-dia="${Lista.dia}">
                         <div data-label="Treino">${Lista.nome}</div>
                         <div data-label="Data">${Lista.data}</div>
                         <div data-label="Dia">${Lista.dia}</div>
                         <div class="treino-actions" data-label="Ações">
                             <form action="/detalhesListaById" method="GET">
                                 <input type="hidden" name="id" value="${Lista.id}">
                                 <button type="submit" class="treino-action-btn">
                                     <i class="fas fa-eye"></i> Detalhes
                                 </button>
                             </form>
                         </div>
                     </div>
                 </c:forEach>
             </div>
         </div>
</section>
<br>

<script>
function filterTreinosByDay(day) {
    // Atualiza botões ativos
    document.querySelectorAll('.treinos-filter-btn').forEach(btn => {
        btn.classList.remove('active');
    });

    // Encontra o botão clicado e marca como ativo
    const clickedBtn = Array.from(document.querySelectorAll('.treinos-filter-btn'))
        .find(btn => btn.textContent.includes(day === 'all' ? 'Todos' : day));
    if (clickedBtn) {
        clickedBtn.classList.add('active');
    }

    // Filtra itens
    document.querySelectorAll('.treino-item').forEach(item => {
        if(day === 'all' || item.getAttribute('data-dia') === day) {
            item.classList.add('visible');
            item.style.display = 'grid';
        } else {
            item.classList.remove('visible');
            item.style.display = 'none';
        }
    });
}

// Inicializa mostrando todos
document.addEventListener('DOMContentLoaded', () => {
    // Marca o botão "Todos" como ativo inicialmente
    document.querySelector('.treinos-filter-btn').classList.add('active');

    // Mostra todos os itens inicialmente
    document.querySelectorAll('.treino-item').forEach(item => {
        item.classList.add('visible');
        item.style.display = 'grid';
    });
});
</script>
</body>
</html>