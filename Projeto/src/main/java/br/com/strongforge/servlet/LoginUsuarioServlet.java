package br.com.strongforge.servlet;

import br.com.strongforge.dao.UsuarioDao;
import br.com.strongforge.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginUsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("user-email");
        String senha = req.getParameter("user-senha");

        Usuario usuario = new Usuario(email,senha);

        boolean isValidUsuario = new UsuarioDao().verifyCredentials(usuario);

        if(isValidUsuario){

            req.getSession().setAttribute("loggedUsuario", email);

            resp.sendRedirect("home.jsp");
        }else{
            req.setAttribute("message", "credenciais invalidas");

            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }

    }
}
