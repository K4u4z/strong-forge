<!doctype html>
<html lang="pt-br">
<head>
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
        <form action="/login" method="post">

          <span>${requestScope.message}</span>

            <br>

            <label class="Label_cad">Email</label>
            <input type="email" name="user-email" id="user-email"  class="Input_cad" required>
            <label class="Label_cad">Senha</label>
            <input type="text" name="user-senha" id="user-senha" class="Input_cad" required>

            <button  id="Btn_cad" type="submit">Logar</button>

        </form>
    </div>
</div>

</body>
</html>
