package br.com.strongforge.servlet;

import br.com.strongforge.dao.ExercicioDao;
import br.com.strongforge.model.Exercicio;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/listarTodosExerciciosm")
public class CarregarExerciciosParaListaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String listaId = req.getParameter("id");

        ExercicioDao exercicioDao = new ExercicioDao();
        List<Exercicio> exercicios = exercicioDao.listarTodosExercicios();

        req.setAttribute("exercicios", exercicios);
        req.setAttribute("id", listaId);

        req.getRequestDispatcher("adicionarItemLista.jsp").forward(req,resp);
    }
}