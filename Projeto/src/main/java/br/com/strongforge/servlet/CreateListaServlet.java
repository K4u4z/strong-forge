package br.com.strongforge.servlet;
import br.com.strongforge.dao.ListaDao;
import br.com.strongforge.dao.UsuarioDao;
import br.com.strongforge.model.Lista;
import br.com.strongforge.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/createLista")
public class CreateListaServlet  extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String listaId = req.getParameter("id");
        String listaName = req.getParameter("lista-name");
        String listaData = req.getParameter("lista-data");


        System.out.println(listaId);
        System.out.println(listaName);
        System.out.println(listaData);

        Lista lista = new Lista(listaId,listaName,listaData);


        ListaDao listaDao = new ListaDao();




        resp.sendRedirect("lista.jsp");


    }
}
