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


        <form action="/createExercicio" method="post"  enctype="multipart/form-data">

           <input type="hidden" name="id" id="id" value="${param.id}">
            <label class="Label_cad">Nome</label>
            <input type="text" name="exercicio-name" id="exercicio-name" class="Input_cad" value="${param.nome}" required>
             <label class="Label_cad">Agrupamento</label>
             <input type="text" name="exercicio-agrupamento" id="exercicio-agrupamento" class="Input_cad" value="${param.agrupamento}" required>
             <label class="Label_cad">Nivel</label>
             <input type="text" name="exercicio-nivel" id="exercicio-nivel" class="Input_cad" value="${param.nivel}" required>
             <label class="Label_cad">Descrição</label>
             <input type="text" name="exercicio-descricao" id="exercicio-descricao" class="Input_cad" value="${param.descricao}" required>
             <label class="Label_cad">Imagem</label>
            <input type="file" name="image" id="image" class="Input_cad" value="${param.image}" required>
            <label class="Label_cad">Video</label>
            <input type="text" name="exercicio-video" id="exercicio-video" class="Input_cad" value="${param.video}" required>

            <button  id="Btn_cad" type="submit">Cadastrar</button>

        </form>
            </div>
        </div>

</body>
</html>
