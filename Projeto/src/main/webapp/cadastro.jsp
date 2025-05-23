<!doctype html>
<html lang="pt-br">
<head><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
      <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="css/style.css" rel="stylesheet">
    <link rel="icon" href="img/logo_strongforge.png" type="image/x-icon">
    <title>Cadastro</title>
</head>
<body>
    <div id="container2" class="container2">
        <div id="img-container">
            <img src="img/logo_strongforge.jpg" alt="imagem_strongforge" id="img_cad">
        </div>
        <div id="form-container">
            <form action="/createUser" method="POST" enctype="multipart/form-data">

                <!-- Campos básicos para todos os usuários -->
                <label class="Label_cad">Nome</label>
                <input type="text" name="user-name" id="user-name" class="Input_cad" value="${param.nome}" required>

                <label class="Label_cad">Email</label>
                <input type="email" name="user-email" id="user-email" class="Input_cad" required>

                <label class="Label_cad">Senha</label>
                <input type="password" name="user-senha" id="user-senha" class="Input_cad" required>


                <label class="Label_cad">Tipo de Usuário</label>
                <select name="user-tipo" id="user-tipo" class="Input_cad" onchange="togglePersonalFields()">
                    <option value="COMUM">COMUM</option>
                    <option value="PERSONAL">PERSONAL</option>
                    <option value="ADMIN">ADMIN</option>
                </select>


                <div id="personal-fields" style="display: none;">
                    <label class="Label_cad">Contato</label>
                    <input type="text" name="personal-contato" id="personal-contato" class="Input_cad">

                    <label class="Label_cad">Especialidade</label>
                    <input type="text" name="personal-especialidade" id="personal-especialidade" class="Input_cad">

                    <label class="Label_cad">Descrição</label>
                    <textarea name="personal-descricao" id="personal-descricao" class="Input_cad"></textarea>

                    <label class="Label_cad">Foto de Perfil</label>
                    <input type="file" name="personal-image" id="personal-image" class="Input_cad" accept="image/*">
                </div>

                <input type="hidden" name="id" id="id" value="${param.id}">

                <button id="Btn_cad" type="submit">Cadastrar</button>
            </form>
        </div>
    </div>

    <script>
       function togglePersonalFields() {
           const userType = document.getElementById('user-tipo').value;
           const personalFields = document.getElementById('personal-fields');

           if (userType === 'PERSONAL') { // Note que no seu HTML o valor é "PERSONAL" (com N)
               personalFields.style.display = 'block';
               // Tornar campos obrigatórios
               document.getElementById('personal-contato').required = true;
               document.getElementById('personal-especialidade').required = true;
           } else {
               personalFields.style.display = 'none';
               // Remover obrigatoriedade
               document.getElementById('personal-contato').required = false;
               document.getElementById('personal-especialidade').required = false;
           }
       }

       // Chamar a função quando a página carregar para configurar o estado inicial
       document.addEventListener('DOMContentLoaded', function() {
           togglePersonalFields();

           // Adicionar o event listener ao select
           document.getElementById('user-tipo').addEventListener('change', togglePersonalFields);
       });
    </script>
</body>
</html>