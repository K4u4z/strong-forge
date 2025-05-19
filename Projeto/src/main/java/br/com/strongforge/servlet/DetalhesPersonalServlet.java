package br.com.strongforge.servlet;


import br.com.strongforge.dao.UsuarioDao;

import br.com.strongforge.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/detalhesPersonalById")
public class DetalhesPersonalServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("id");
        Usuario personais = new UsuarioDao().detalhesPersonalById(userId);


        req.setAttribute("personais", personais);
        req.getRequestDispatcher("perfilPersonal.jsp").forward(req, resp);
    }
}
