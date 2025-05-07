package br.com.strongforge.servlet;

import br.com.strongforge.dao.ExercicioDao;
import br.com.strongforge.model.Exercicio;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/detalhesExercicioById")
public class DetalhesExercicioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String exercId = req.getParameter("id");
            Exercicio exercicio = new ExercicioDao().detalhesExercicioById(exercId);

            if (exercicio != null) {
                req.setAttribute("exercicio", exercicio);
                req.getRequestDispatcher("detalhesExercicios.jsp").forward(req, resp);
            } else {
                // Exercício não encontrado
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Exercício não encontrado");
            }
        } catch (NumberFormatException e) {
            // ID inválido
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de exercício inválido");
        }
    }


    }



