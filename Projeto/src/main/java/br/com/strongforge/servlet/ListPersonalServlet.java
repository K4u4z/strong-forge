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

@WebServlet("/findAllPersonal")
public class ListPersonalServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Usuario> personais = new UsuarioDao().findAllPersonal(); // Chamar o método correto

        req.setAttribute("personais", personais);
        req.getRequestDispatcher("personal.jsp").forward(req,resp);
    }
}
