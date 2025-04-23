package br.com.strongforge.servlet;
import br.com.strongforge.dao.UsuarioDao;
import br.com.strongforge.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/createUser")
public class CreateUsuarioServlet  extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String userId = req.getParameter("id");
        String userName = req.getParameter("user-name");
        String userEmail = req.getParameter("user-email");
        String userSenha = req.getParameter("user-senha");

        System.out.println(userId);
        System.out.println(userName);
        System.out.println(userEmail);
        System.out.println(userSenha);

        Usuario usuario = new Usuario(userId,userName,userEmail,userSenha);


        UsuarioDao usuarioDao = new UsuarioDao();


        if (userId == null || userId.isBlank()) {

            usuarioDao.createUsuario(usuario);

        } else {

            usuarioDao.updateUsuario(usuario);
        }


        resp.sendRedirect("login.jsp");


    }
}
