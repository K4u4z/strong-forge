package br.com.strongforge.servlet;

import br.com.strongforge.dao.ExercicioDao;
import br.com.strongforge.model.Exercicio;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet({"/findAllExercicioAdmin"})
public class ListExercicioAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Exercicio> exercicios = new ExercicioDao().findAllExercicioAdmin();

        req.setAttribute("exercicios", exercicios);

        req.getRequestDispatcher("adminExercicio.jsp").forward(req,resp);
    }
}
