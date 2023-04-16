package com.example.user_manager.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String USER_NAME = "root";
    private static final String PASSWORD = "12345678";
    private static final String HOST = "localhost";
    private static final String DATABASE = "user_manager";
    private static final String PORT = "3306";

    private static Connection connection;

    public static Connection getConnection () {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://"+HOST+":"+PORT+"/"+DATABASE, USER_NAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public static void close(){
        try {
            if(connection != null){
                connection.close();
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
