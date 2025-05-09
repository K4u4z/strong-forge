package br.com.strongforge.servlet;

import br.com.strongforge.dao.ExercicioDao;
import br.com.strongforge.dao.UsuarioDao;
import br.com.strongforge.model.Exercicio;
import br.com.strongforge.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet({"/findAllExercicio", "/admin/findAllExercicio"})
public class ListExercicioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Exercicio> exercicios = new ExercicioDao().findAllExercicio();

        req.setAttribute("exercicios", exercicios);

        req.getRequestDispatcher("exercicios.jsp").forward(req,resp);
    }
}
