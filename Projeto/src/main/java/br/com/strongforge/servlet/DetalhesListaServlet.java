package br.com.strongforge.servlet;

import br.com.strongforge.dao.ExercicioDao;
import br.com.strongforge.dao.ListaDao;
import br.com.strongforge.model.Exercicio;
import br.com.strongforge.model.Lista;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/detalhesListaById"})
public class DetalhesListaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String listaId = req.getParameter("id");
        if (listaId == null || listaId.isEmpty()) {
            resp.sendRedirect("listas.jsp");
            return;
        }

        Lista lista = new ListaDao().detalhesListaById(listaId);

        if (lista == null) {
            resp.sendRedirect("listas.jsp");
            return;
        }

        req.setAttribute("lista", lista);
        req.getRequestDispatcher("detalhesLista.jsp").forward(req, resp);
    }
}
