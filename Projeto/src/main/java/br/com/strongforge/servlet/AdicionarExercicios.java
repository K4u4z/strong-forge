package br.com.strongforge.servlet;

import br.com.strongforge.dao.ListaDao;
import br.com.strongforge.model.Exercicio;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet("/cadastrarExerciciosLista")
public class AdicionarExercicios extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String listaId = req.getParameter("id");
        String[] exerciciosSelecionados = req.getParameterValues("exerciciosSelecionados");

        List<String> idsExercicios = new ArrayList<>();
        if (exerciciosSelecionados != null) {
            idsExercicios = Arrays.asList(exerciciosSelecionados);
        }

        ListaDao listaDAO = new ListaDao();
        listaDAO.cadastrarExerciciosLista(listaId, idsExercicios);

        resp.sendRedirect("listas.jsp");
    }
}
