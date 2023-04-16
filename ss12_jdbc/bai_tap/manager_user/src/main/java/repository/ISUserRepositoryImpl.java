package repository;

import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ISUserRepositoryImpl implements ISUserRepository{
    public static final String FIND_ALL = "select * from user";
    private static List<User> userList = new ArrayList<>();
    @Override
    public List<User> findAll() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if (connection == null){
            try {
                statement = connection.prepareStatement(FIND_ALL);
                resultSet = statement.executeQuery();

                User user = null;
                while (resultSet.next()){
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    Date birthday = resultSet.getDate("birthday");
                    String email = resultSet.getString("email");
                    String address = resultSet.getString("address");

                    user = new User(id,name,birthday,email,address);
                    userList.add(user);
                }
            }catch (SQLException e){
                e.printStackTrace();
            }finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                DBConnection.close();
            }
        }
        return null;
    }

    @Override
    public void save(User user) {

    }

    @Override
    public User findById(int id) {
        return null;
    }

    @Override
    public void update(int id, User user) {

    }

    @Override
    public void remove(int id) {

    }
}
