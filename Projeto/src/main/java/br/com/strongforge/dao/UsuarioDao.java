package br.com.strongforge.dao;

import br.com.strongforge.model.Usuario;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class UsuarioDao {

    public void createUsuario(Usuario user){
        String SQL = "INSERT INTO USUARIO (NOME,EMAIL,SENHA) VALUES (?,?,?)";

        try{
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test","sa","sa");


            System.out.println("Sucesso na conexão do banco");

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
}
