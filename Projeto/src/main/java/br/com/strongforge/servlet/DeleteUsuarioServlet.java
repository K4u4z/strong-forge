package br.com.strongforge.servlet;

import br.com.strongforge.dao.UsuarioDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delete-usuario")
public class DeleteUsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String userid = req.getParameter("id");

        new UsuarioDao().deleteUsuarioById(userid);

        resp.sendRedirect("/findAllUsuario");


    }
}
