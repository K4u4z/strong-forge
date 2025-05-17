package br.com.strongforge.servlet;

import br.com.strongforge.model.Exercicio;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cadastrarExerciciosLista")
public class AdicionarExercicios extends HttpServlet {

    List<Exercicio> exercicios = new ArrayList<Exercicio>();

      /* for(Exercicio exercicio : exercicios) {

        listaDao.cadastrarExerciciosLista(, exercicio.getId());

    }*/

}
