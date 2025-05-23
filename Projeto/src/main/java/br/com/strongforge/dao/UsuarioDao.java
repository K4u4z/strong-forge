package br.com.strongforge.dao;

import br.com.strongforge.config.ConnectionPoolConfig;
import br.com.strongforge.model.Exercicio;
import br.com.strongforge.model.Lista;
import br.com.strongforge.model.Usuario;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class UsuarioDao {

    public void createUsuario(Usuario user) {
        Connection connection = null;
        PreparedStatement usuarioStmt = null;
        PreparedStatement personalStmt = null;

        try {
            connection = ConnectionPoolConfig.getConnection();
            connection.setAutoCommit(false);


            String usuarioSQL = "INSERT INTO USUARIO (NOME, EMAIL, SENHA, TIPO) VALUES (?, ?, ?, ?)";
            usuarioStmt = connection.prepareStatement(usuarioSQL, Statement.RETURN_GENERATED_KEYS);

            usuarioStmt.setString(1, user.getNome());
            usuarioStmt.setString(2, user.getEmail());
            usuarioStmt.setString(3, user.getSenha());
            usuarioStmt.setString(4, user.getTipoUsuario());

            int affectedRows = usuarioStmt.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Falha ao criar usuário, nenhuma linha afetada.");
            }

            if ("PERSONAL".equalsIgnoreCase(user.getTipoUsuario())) {
                ResultSet generatedKeys = usuarioStmt.getGeneratedKeys();

                if (generatedKeys.next()) {
                    int userId = generatedKeys.getInt(1);

                    String personalSQL = "INSERT INTO PERSONAL (ID_USUARIO, CONTATO, ESPECIALIDADE, DESCRICAO,IMAGE) VALUES (?, ?, ?, ?,?)";
                    personalStmt = connection.prepareStatement(personalSQL);

                    personalStmt.setInt(1, userId);
                    personalStmt.setString(2, user.getContato());
                    personalStmt.setString(3, user.getEspecialidade());
                    personalStmt.setString(4, user.getDescricao());
                    personalStmt.setString(5,user.getImage());

                    personalStmt.executeUpdate(); // Adicionado a execução
                }
            }

            connection.commit(); // Confirma a transação
            System.out.println("Usuário criado com sucesso");

        } catch (Exception e) {
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException ex) {
                    System.out.println("Erro ao reverter transação: " + ex.getMessage());
                }
            }
            System.out.println("Erro ao criar usuário: " + e.getMessage());
            throw new RuntimeException("Erro ao criar usuário", e);
        } finally {
            try {
                if (personalStmt != null) personalStmt.close();
                if (usuarioStmt != null) usuarioStmt.close();
                if (connection != null) {
                    connection.setAutoCommit(true); // Restaura auto-commit
                    connection.close();
                }
            } catch (SQLException e) {
                System.out.println("Erro ao fechar recursos: " + e.getMessage());
            }
        }
    }

    public List<Usuario> findAllUsuario() {
        String SQL = "SELECT * FROM USUARIO";


        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<Usuario> usuarios = new ArrayList<>();

            while (resultSet.next()) {

                String usuarioId = resultSet.getString("id");
                String usuarioName = resultSet.getString("nome");
                String usuarioEmail = resultSet.getString("email");
                String usuarioSenha = resultSet.getString("senha");
                String usuarioTipo = resultSet.getString("tipo");

                Usuario usuario = new Usuario(usuarioId,usuarioName,usuarioEmail,usuarioSenha,usuarioTipo);

                usuarios.add(usuario);

            }

            System.out.println("sucesso ao selecionar * usuario");

            connection.close();

            return usuarios;

        } catch (Exception e) {

            System.out.println("Falha ao se conectar com o banco");

            return Collections.emptyList();

        }

    }
    public List<Usuario> findAllPersonal() {
        String SQL = "SELECT u.*, p.CONTATO, p.ESPECIALIDADE, p.DESCRICAO, p.IMAGE " +
                "FROM USUARIO u " +
                "LEFT JOIN PERSONAL p ON u.ID = p.ID_USUARIO " +
                "WHERE u.TIPO = 'PERSONAL'";

        try (Connection connection = ConnectionPoolConfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SQL)) {

            ResultSet resultSet = preparedStatement.executeQuery();
            List<Usuario> personais = new ArrayList<>();

            while (resultSet.next()) {
                Usuario usuario = new Usuario(
                        resultSet.getString("id"),
                        resultSet.getString("nome"),
                        resultSet.getString("email"),
                        resultSet.getString("senha"),
                        resultSet.getString("tipo"),
                        resultSet.getString("contato"),
                        resultSet.getString("especialidade"),
                        resultSet.getString("descricao"),
                        resultSet.getString("image")
                );
                personais.add(usuario);
            }

            System.out.println("Sucesso ao buscar personais. Total: " + personais.size());
            return personais;

        } catch (Exception e) {
            System.out.println("Falha ao buscar personais: " + e.getMessage());
            e.printStackTrace(); // Adicionar para debug
            return Collections.emptyList();
        }
    }

    public Usuario detalhesPersonalById(String personalId) {
        String SQL = "SELECT \n" +
                "    U.id, \n" +
                "    U.nome, \n" +
                "    U.email, \n" +
                "    U.senha, \n" +
                "    U.tipo, \n" +
                "    P.contato, \n" +
                "    P.especialidade, \n" +
                "    P.descricao, \n" +
                "    P.image\n" +
                "FROM \n" +
                "    usuario U\n" +
                "LEFT JOIN personal P ON U.id = P.id_usuario\n" +
                "WHERE U.id = ? AND U.tipo = 'PERSONAL'";

        try {
            Connection connection = ConnectionPoolConfig.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, personalId);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                Usuario personal = new Usuario(
                        resultSet.getString("id"),
                        resultSet.getString("nome"),
                        resultSet.getString("email"),
                        resultSet.getString("senha"),
                        resultSet.getString("tipo"),
                        resultSet.getString("contato"),
                        resultSet.getString("especialidade"),
                        resultSet.getString("descricao"),
                        resultSet.getString("image")
                );

                connection.close();
                return personal;
            } else {
                connection.close();
                return null; // Personal não encontrado
            }

        } catch(Exception e) {
            System.out.println("Falha ao se conectar com o banco");
            System.out.println("Erro: " + e.getMessage());
            return null;
        }
    }

    public void updateUsuario(Usuario usuario){
        String SQL = "UPDATE USUARIO SET NOME = ?, EMAIL = ?, SENHA = ?, TIPO = ? WHERE ID = ?";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, usuario.getNome());
            preparedStatement.setString(2, usuario.getEmail());
            preparedStatement.setString(3, usuario.getSenha());
            preparedStatement.setString(4, usuario.getTipoUsuario());
            preparedStatement.setString(5, usuario.getId());
            preparedStatement.execute();

            System.out.println("success em atualizar o usuario");

            connection.close();

        } catch (Exception e) {

            System.out.println("falha na conexão com o banco");
            System.out.println("Error: " + e.getMessage());

        }


    }

    public void deleteUsuarioById(String userId){
        String SQL = "DELETE USUARIO WHERE ID = ?";


        try {

            Connection connection = ConnectionPoolConfig.getConnection();


            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, userId);
            preparedStatement.execute();

            System.out.println("success ao deletar o usuario pelo ID " + userId);

            connection.close();

        } catch (Exception e) {

            System.out.println("falha ao conectar com o banco");

        }
    }

    public boolean verifyCredentials(Usuario usuario) {
        String SQL = "SELECT * FROM USUARIO WHERE EMAIL = ?";

        try {
            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, usuario.getEmail());
            ResultSet resultSet = preparedStatement.executeQuery();

            System.out.println("Sucesso ao selecionar o email");

            while (resultSet.next()) {

                String senha = resultSet.getString("senha");

                if (senha.equals(usuario.getSenha())) {

                    return true;

                }

            }
            connection.close();
            return false;

        } catch (Exception e) {
            System.out.println("Error" + e.getMessage());
            return false;
        }


    }


}
