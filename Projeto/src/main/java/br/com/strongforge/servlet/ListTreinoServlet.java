package br.com.strongforge.servlet;

import br.com.strongforge.dao.ListaDao;
import br.com.strongforge.model.Lista;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet({"/findAllLista"})
public class ListTreinoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Lista> listas = new ListaDao().findAllLista();

        req.setAttribute("listas", listas);

        req.getRequestDispatcher("treino.jsp").forward(req,resp);
    }
}
