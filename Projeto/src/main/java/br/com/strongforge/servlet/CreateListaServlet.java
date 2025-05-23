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

import java.util.Random;
import java.util.UUID;


@WebServlet("/createLista")
public class CreateListaServlet  extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

// Gera um novo ID se não existir (evita enviar ID vazio)



        Random random = new Random();
        int numericId = random.nextInt(Integer.MAX_VALUE);
        String listaId = String.valueOf(numericId);


        String listaName = req.getParameter("lista-nome");
        String listaData = req.getParameter("data-lista");
        String listaDia = req.getParameter("dia-lista");
        // Cria a lista com o ID (novo ou existente)
        Lista lista = new Lista(listaId, listaName, listaData,listaDia);

        // Salva no banco
        ListaDao listaDao = new ListaDao();
        listaDao.createLista(lista);

        // Redireciona para a próxima página com o ID
        resp.sendRedirect("/listarTodosExercicios?id=" + listaId);




    }
}
