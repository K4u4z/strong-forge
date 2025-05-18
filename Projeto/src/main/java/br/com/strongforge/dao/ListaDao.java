package br.com.strongforge.dao;

import br.com.strongforge.config.ConnectionPoolConfig;
import br.com.strongforge.model.Exercicio;
import br.com.strongforge.model.Lista;
import br.com.strongforge.model.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ListaDao {

    public void createLista(Lista list) {
        String SQL = "INSERT INTO LISTA (ID,NOME,DATA) VALUES (?,?,?)";

        try {
            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1,list.getId());
            preparedStatement.setString(2, list.getNome());
            preparedStatement.setString(3, list.getData());
            preparedStatement.execute();

            System.out.println("Parâmetro inserido com sucesso");

            connection.close();

        } catch (Exception e) {
            System.out.println("Erro na conexão do banco");
        }


    }


    public List<Lista> findAllLista() {
        String SQL = "SELECT * FROM LISTA";


        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<Lista> list = new ArrayList<>();

            while (resultSet.next()) {

                String listaId = resultSet.getString("id");
                String listaName = resultSet.getString("nome");
                String listaEmail = resultSet.getString("data");


                Lista lista = new Lista(listaId, listaName, listaEmail);

                list.add(lista);

            }

            System.out.println("sucesso ao selecionar * usuario");

            connection.close();

            return list;

        } catch (Exception e) {

            System.out.println("Falha ao se conectar com o banco");

            return Collections.emptyList();

        }

    }


    public void deleteListaById(String listId) {
        String SQL = "DELETE LISTA WHERE ID = ?";


        try {

            Connection connection = ConnectionPoolConfig.getConnection();


            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, listId);
            preparedStatement.execute();

            System.out.println("success ao deletar o lista pelo ID " + listId);

            connection.close();

        } catch (Exception e) {

            System.out.println("falha ao conectar com o banco");

        }
    }

    public Lista detalhesListaById(String listaId) {
        String SQL = "SELECT \n" +
                "    L.id AS lista_id,\n" +
                "    L.nome AS nome_lista,\n" +
                "    E.id AS exercicio_id,\n" +
                "    E.nome AS nome_exercicio,\n" +
                "    E.agrupamento,\n" +
                "    E.nivel,\n" +
                "    E.descricao,\n" +
                "    E.image,\n" +
                "    E.video\n" +
                "FROM \n" +
                "    Lista L\n" +
                "INNER JOIN LISTA_EXERCICIO_ITEM LE ON L.id = LE.lista_id\n" +
                "INNER JOIN Exercicio E ON LE.exercicio_id = E.id\n" +
                "WHERE L.id = ?";

        try {
            Connection connection = ConnectionPoolConfig.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, listaId);

            ResultSet resultSet = preparedStatement.executeQuery();

            Lista lista = null;
            List<Exercicio> exercicios = new ArrayList<>();

            while (resultSet.next()) {
                if (lista == null) {
                    lista = new Lista(
                            resultSet.getString("lista_id"),
                            resultSet.getString("nome_lista")
                    );
                }

                Exercicio exercicio = new Exercicio(
                        resultSet.getString("exercicio_id"),
                        resultSet.getString("nome_exercicio"),
                        resultSet.getString("agrupamento"),
                        resultSet.getString("nivel"),
                        resultSet.getString("descricao"),
                        resultSet.getString("image"),
                        resultSet.getString("video")
                );
                exercicios.add(exercicio);
            }

            if (lista != null) {
                lista.setExercicios(exercicios);
            }

            connection.close();
            return lista;

        } catch(Exception e) {
            System.out.println("Falha ao se conectar com o banco");
            System.out.println("Erro: " + e.getMessage());
            return null;
        }
    }

    /* public void cadastraTreino() {

        List<Exercicio> exercicios new ArrayList<String>();

        for (Exercicio exercicio: exercicios) {

            cadastrarExerciciosLista(1, exercicio.getId());

        }*/




    public void cadastrarExerciciosLista(String idLista, List<String> idExercicios) {
        String SQL = "INSERT INTO LISTA_EXERCICIO_ITEM (lista_id, exercicio_id) VALUES (?, ?)";

        try (Connection connection = ConnectionPoolConfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SQL)) {

            for (String idExercicio : idExercicios) {
                preparedStatement.setString(1, idLista);
                preparedStatement.setString(2, idExercicio);
                preparedStatement.addBatch();
            }

            preparedStatement.executeBatch();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}














