package br.com.strongforge.dao;

import br.com.strongforge.config.ConnectionPoolConfig;
import br.com.strongforge.model.Exercicio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ExercicioDao {
    public void createExercicio(Exercicio exercicio){
        String SQL = "INSERT INTO EXERCICIO (NOME,AGRUPAMENTO,NIVEL,DESCRICAO,IMAGE,VIDEO) VALUES (?,?,?,?,?,?)";

        try{
            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1,exercicio.getNome());
            preparedStatement.setString(2, exercicio.getAgrupamento());
            preparedStatement.setString(3, exercicio.getNivel());
            preparedStatement.setString(4, exercicio.getDescricao());
            preparedStatement.setString(5, exercicio.getImage());
            preparedStatement.setString(6, exercicio.getVideo());
            preparedStatement.execute();

            System.out.println("Parâmetro inserido com sucesso");

            connection.close();

        }catch(Exception e){
            System.out.println("Erro na conexão do banco");
            System.out.println("Error"+ e.getMessage());
        }


    }

    public List<Exercicio> findAllExercicio() {
        String SQL = "SELECT * FROM EXERCICIO";


        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<Exercicio> exercicios = new ArrayList<>();

            while (resultSet.next()) {

                String exercicioId = resultSet.getString("id");
                String exercicioName = resultSet.getString("nome");
                String exercicioAgrup = resultSet.getString("agrupamento");
                String exercicioNivel = resultSet.getString("nivel");
                String exercicioDescricao = resultSet.getString("descricao");
                String exercicioImage = resultSet.getString("image");
                String exercicioVideo = resultSet.getString("video");

                Exercicio exercicio = new Exercicio(exercicioId,exercicioName,exercicioAgrup,exercicioNivel,exercicioDescricao,exercicioImage,exercicioVideo);

                exercicios.add(exercicio);

            }

            System.out.println("sucesso ao selecionar * exercicio");

            connection.close();

            return exercicios;

        } catch (Exception e) {

            System.out.println("Falha ao se conectar com o banco");
            System.out.println("Error" + e.getMessage());

            return Collections.emptyList();

        }

    }
    public void updateExercicio(Exercicio exercicio){
        String SQL = "UPDATE EXERCICIO SET NOME = ? WHERE ID = ?";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, exercicio.getNome());
            preparedStatement.setString(2, exercicio.getId());
            preparedStatement.execute();

            System.out.println("success em atualizar o exercicio");

            connection.close();

        } catch (Exception e) {

            System.out.println("falha na conexão com o banco");
            System.out.println("Error: " + e.getMessage());

        }


    }

    public void deleteExercicioById(String exercicioId){
        String SQL = "DELETE EXERCICIO WHERE ID = ?";


        try {

            Connection connection = ConnectionPoolConfig.getConnection();


            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, exercicioId);
            preparedStatement.execute();

            System.out.println("success ao deletar o exercicio pelo ID " + exercicioId);

            connection.close();

        } catch (Exception e) {

            System.out.println("falha ao conectar com o banco");

        }
    }
    public Exercicio detalhesExercicioById(String exercicioId) {
        String SQL = "SELECT * FROM EXERCICIO WHERE ID = ?";

        try {
            Connection connection = ConnectionPoolConfig.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, exercicioId);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String id = resultSet.getString("id");
                String nome = resultSet.getString("nome");
                String agrupamento = resultSet.getString("agrupamento");
                String nivel = resultSet.getString("nivel");
                String descricao = resultSet.getString("descricao");
                String image = resultSet.getString("image");
                String video = resultSet.getString("video");

                Exercicio exercicio = new Exercicio(id, nome, agrupamento, nivel,
                        descricao, image, video);

                connection.close();
            } else {
                connection.close();
            }

        } catch(Exception e) {
            System.out.println("Falha ao se conectar com o banco");
            System.out.println("Erro: " + e.getMessage());
        }
        return null;
    }

}
