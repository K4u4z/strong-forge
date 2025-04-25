package br.com.strongforge.config;

import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.Connection;
import java.sql.SQLException;

public class ConnectionPoolConfig {

    private ConnectionPoolConfig(){
        getDataSource();
    }

    private static BasicDataSource dataSource;

    private static BasicDataSource getDataSource() {

        if(dataSource == null){
            dataSource = new BasicDataSource();
            dataSource.setUrl("jdbc:h2:~/test");
            dataSource.setUsername("sa");
            dataSource.setPassword("sa");
            dataSource.setMinIdle(5);
            dataSource.setMaxIdle(10);
            dataSource.setMaxTotal(50);

            System.out.println("Nova conexão pool criada com sucesso ");
        }
        return dataSource;
    }

    public static Connection getConnection() throws SQLException {
        return getDataSource().getConnection();
    }

}
