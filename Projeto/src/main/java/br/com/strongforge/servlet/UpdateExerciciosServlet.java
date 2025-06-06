package br.com.strongforge.servlet;

import br.com.strongforge.dao.ExercicioDao;
import br.com.strongforge.model.Exercicio;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.*;

import static org.apache.commons.fileupload.servlet.ServletFileUpload.isMultipartContent;

@WebServlet({"/updateExercicio"})
public class UpdateExerciciosServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        Map<String, String> parameters = uploadImage(req);
        String exercicioId = parameters.get("exercicio-id");

        if (exercicioId == null || exercicioId.isBlank()) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID do exercício é obrigatório para atualização");
            return;
        }

        Exercicio exercicio = new Exercicio(
                exercicioId,
                parameters.get("exercicio-name"),
                parameters.get("exercicio-agrupamento"),
                parameters.get("exercicio-nivel"),
                parameters.get("exercicio-descricao"),
                parameters.get("image"),
                parameters.get("exercicio-video")
        );

        ExercicioDao exercicioDao = new ExercicioDao();
        exercicioDao.updateExercicio(exercicio);
        System.out.println("Atualizando exercício existente com ID: " + exercicioId);

        resp.sendRedirect("/findAllExercicio");
    }


    private Map<String, String> uploadImage(HttpServletRequest httpServletRequest) {
        Map<String, String> requestParameters = new HashMap<>();

        if (isMultipartContent(httpServletRequest)) {
            try {
                DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
                List<FileItem> fileItems = new ServletFileUpload(diskFileItemFactory).parseRequest(httpServletRequest);

                for (FileItem fileItem : fileItems) {
                    checkFieldType(fileItem, requestParameters);
                }
            } catch (Exception ex) {
                requestParameters.put("image", "img/default-exercicio.jpg");
            }
        }
        return requestParameters;
    }

    private void checkFieldType(FileItem item, Map requestParameters) throws Exception {
        if (item.isFormField()) {
            requestParameters.put(item.getFieldName(), item.getString());
        } else {
            String fileName = processUploadedFile(item);
            requestParameters.put("image", "img/".concat(fileName));
        }
    }

    private String processUploadedFile(FileItem fileItem) throws Exception {
        Long currentTime = new Date().getTime();
        String fileName = currentTime.toString().concat("-").concat(fileItem.getName().replace(" ", ""));
        String filePath = this.getServletContext().getRealPath("img").concat(File.separator).concat(fileName);
        fileItem.write(new File(filePath));
        return fileName;
    }
}