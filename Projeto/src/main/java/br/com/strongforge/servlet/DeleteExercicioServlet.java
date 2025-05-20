package br.com.strongforge.servlet;

import br.com.strongforge.dao.ExercicioDao;
import br.com.strongforge.dao.UsuarioDao;
import br.com.strongforge.model.Exercicio;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.http.HttpClient;

@WebServlet("/delete-exercicio")
public class DeleteExercicioServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String exercId = req.getParameter("id");

        new ExercicioDao().deleteExercicioById(exercId);

        resp.sendRedirect("/findAllExercicioAdmin");


    }
}
