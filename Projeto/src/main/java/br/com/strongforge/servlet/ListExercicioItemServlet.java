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

@WebServlet({"/listarTodosExercicios", "/admin/listarTodosExercicios"})
public class ListExercicioItemServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String listaId = req.getParameter("id");


        System.out.println(listaId);



        List<Exercicio> exercicios = new ExercicioDao().findAllExercicio();


        req.setAttribute("id", listaId);
        req.setAttribute("exercicios", exercicios);

        req.getRequestDispatcher("adicionarItemLista.jsp").forward(req, resp);
    }
    }


