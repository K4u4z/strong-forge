package br.com.strongforge.servlet;

import br.com.strongforge.dao.UsuarioDao;
import br.com.strongforge.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet({"/findAllUsuario", "/admin/findAllUsuario"})
public class ListUsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Usuario> usuarios = new UsuarioDao().findAllUsuario();

        req.setAttribute("usuarios", usuarios);

        req.getRequestDispatcher("admin.jsp").forward(req,resp);
    }
}
