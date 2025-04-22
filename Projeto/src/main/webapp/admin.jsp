<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
</head>
<body>
  <div>
    <h1>Cars</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
        </tr>
        <c:forEach var="Usuario" items="${usuarios}">
            <tr>
                <td>${Usuario.id}</td>
             <td>${Usuario.nome}</td>
                   <td>${Usuario.email}</td>
                                <td>${Usuario.senha}</td>
                                 <td>
                                                <form action="/delete-usuario" method="post">
                                                    <input type="hidden" id="id" name="id" value="${Usuario.id}">
                                                    <button type="submit">Delete</button>
                                                    <span> | </span>
                                                    <a href="index.jsp?id=${Usuario.id}&nome=${Usuario.nome}">Update</a>
                                                </form>
                                            </td>
            </tr>
        </c:forEach>
    </table>
  </div>
</body>
</html>