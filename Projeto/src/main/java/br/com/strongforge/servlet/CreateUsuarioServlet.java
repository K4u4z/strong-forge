package br.com.strongforge.servlet;
import br.com.strongforge.dao.UsuarioDao;
import br.com.strongforge.model.Usuario;
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
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.apache.commons.fileupload.servlet.ServletFileUpload.isMultipartContent;

@WebServlet("/createUser")
public class CreateUsuarioServlet  extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, String> formParameters = uploadImage(req); // Processa o upload primeiro

        String userId = formParameters.get("id");
        String userName = formParameters.get("user-name");
        String userEmail = formParameters.get("user-email");
        String userSenha = formParameters.get("user-senha");
        String userTipo = formParameters.get("user-tipo");

        if("PERSONAL".equalsIgnoreCase(userTipo)){
            String userContato = formParameters.get("personal-contato");
            String userEspecialidade = formParameters.get("personal-especialidade");
            String userDescricao = formParameters.get("personal-descricao");

            String userimage = formParameters.get("personal-image") != null ?
                    formParameters.get("personal-image") : "img/default-personal.jpg";

            Usuario usuario2 = new Usuario(userId, userName, userEmail, userSenha,
                    userTipo, userContato, userDescricao,
                    userEspecialidade, userimage);
            UsuarioDao usuarioDao = new UsuarioDao();

            if (userId == null || userId.isBlank()) {

                usuarioDao.createUsuario(usuario2);

            } else {

                usuarioDao.updateUsuario(usuario2);
            }
        }else{
            Usuario usuario = new Usuario(userId,userName,userEmail,userSenha,userTipo);


            UsuarioDao usuarioDao = new UsuarioDao();

            if (userId == null || userId.isBlank()) {

                usuarioDao.createUsuario(usuario);

            } else {

                usuarioDao.updateUsuario(usuario);
            }
        }





        resp.sendRedirect("login.jsp");


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

                requestParameters.put("img", "img/default-personal.jpg");

            }

        }

        return requestParameters;

    }

    private void checkFieldType(FileItem item, Map requestParameters) throws Exception {

        if (item.isFormField()) {

            requestParameters.put(item.getFieldName(), item.getString());

        } else {

            String fileName = processUploadedFile(item);
            requestParameters.put("personal-image", "img/".concat(fileName));

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




