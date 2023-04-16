package com.example.user_manager.repository;

import com.example.user_manager.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ISUserRepositoryImpl implements ISUserRepository {
    public static final String FIND_ALL = "select * from user";
    public static final String INSERT_USER = "insert into user(`name`,birthday,email,address) value(?,?,?,?)";
    public static final String FIND_BY_ID = "select * from user where id = ?";
    public static final String UPDATE_USER_ID = "update user set name=?, birthday=?, email=?, address=? where id = ?";
    public static final String DELETE_FROM_USER_WHERE_ID = "delete from user where id=?";
    public static final String SORT_USER_NAME = "select * from user order by name";

    @Override
    public List<User> findAll() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<User> userList = new ArrayList<>();
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SORT_USER_NAME);
                resultSet = statement.executeQuery();
                User user = null;
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String birthday = String.valueOf(resultSet.getDate("birthday"));
                    String email = resultSet.getString("email");
                    String address = resultSet.getString("address");

                    user = new User(id, name, birthday, email, address);
                    userList.add(user);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                DBConnection.close();
            }
        }
        return userList;
    }

    @Override
    public List<User> search(String name) {
        List<User> list = new ArrayList<>(findAll());
        List<User> search = new ArrayList<>();
        for (User user: list){
            if (user.getName().toLowerCase().contains(name.toLowerCase())){
                search.add(user);
            }
        }
        return search;
    }

    @Override
    public void save(User user) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(INSERT_USER);
                statement.setString(1, user.getName());
                statement.setDate(2, java.sql.Date.valueOf(user.getBirthday()));
                statement.setString(3, user.getEmail());
                statement.setString(4, user.getAddress());
                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }

    @Override
    public User findById(int id) {
        User user = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try (Connection connection = DBConnection.getConnection()) {
            statement = connection.prepareStatement(FIND_BY_ID);
            statement.setInt(1,id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String birthday = String.valueOf(resultSet.getDate("birthday"));
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                user = new User(id, name, birthday, email, address);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                statement.close();
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            DBConnection.close();
        }
        return user;
    }

    @Override
    public void update(int id, User user) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(UPDATE_USER_ID);
                statement.setString(1, user.getName());
                statement.setDate(2, java.sql.Date.valueOf(user.getBirthday()));
                statement.setString(3, user.getEmail());
                statement.setString(4, user.getAddress());
                statement.setInt(5,id);
                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }

    @Override
    public void remove(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(DELETE_FROM_USER_WHERE_ID);
                statement.setInt(1,id);
                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }
}
