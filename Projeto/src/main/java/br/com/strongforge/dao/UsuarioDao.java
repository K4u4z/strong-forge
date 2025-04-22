package br.com.strongforge.dao;

import br.com.strongforge.config.ConnectionPoolConfig;
import br.com.strongforge.model.Usuario;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class UsuarioDao {

    public void createUsuario(Usuario user){
        String SQL = "INSERT INTO USUARIO (NOME,EMAIL,SENHA) VALUES (?,?,?)";

        try{
            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1,user.getNome());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getSenha());
            preparedStatement.execute();

            System.out.println("Parâmetro inserido com sucesso");

            connection.close();

        }catch(Exception e){
            System.out.println("Erro na conexão do banco");
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

                Usuario usuario = new Usuario(usuarioId,usuarioName,usuarioEmail,usuarioSenha);

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
    public void updateUsuario(Usuario usuario){
        String SQL = "UPDATE USUARIO SET NOME = ? WHERE ID = ?";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, usuario.getNome());
            preparedStatement.setString(2, usuario.getId());
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

            System.out.println("success ao deletar o carro pelo ID " + userId);

            connection.close();

        } catch (Exception e) {

            System.out.println("falha ao conectar com o banco");

        }
    }

    public boolean VerifyCredentials(Usuario usuario) {
        String SQL = "SELECT * FROM USUARIO WHERE EMAIL = ?";

        try {
            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, usuario.getEmail());
            ResultSet resultSet = preparedStatement.executeQuery();

            System.out.println("Sucesso ao selecionar o email");

            while (resultSet.next()) {

                String senha = resultSet.getString("user-senha");

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
