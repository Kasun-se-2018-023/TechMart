package com.icbt.TechMart.operation.dataRepositoryOperations.repositoryOperations;

import com.icbt.TechMart.model.dataRepository.DataRepositoryFactory;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;

public class RetrieveDataForHomePage implements RepositoryOperation{
    private Statement statement;
    private ResultSet resultSet;
    private final Connection connection;

    public RetrieveDataForHomePage(){
         connection = new DataRepositoryFactory("MySQL").getConnection();
    }

    @Override
    public ResultSet getResults() {
        try{
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM items ORDER BY rating DESC LIMIT 12");
        }catch (SQLException e){
            System.out.println(Arrays.toString(e.getStackTrace()));
        }

        return resultSet;
    }
}
