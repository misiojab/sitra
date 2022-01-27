package com.misiojab.sitra.Login;

import com.misiojab.sitra.AppConfig;
import com.misiojab.sitra.MainService;

import java.sql.*;
import java.util.Optional;


public final class LoginService {

    private final MainService mainService;

    public LoginService(MainService mainService) {
        this.mainService = mainService;
    }

    public void createUser(Long id, String username, String password, String role, String team) throws SQLException {
        Connection connection = DriverManager.getConnection(AppConfig.DATABASE_URI + "/" + AppConfig.DATABASE, AppConfig.USER, AppConfig.PASSWORD);
        PreparedStatement preparedStatement = connection.prepareStatement("""
                INSERT INTO user (id, username, password, userrole, team)
                VALUES(?, ?, ?, ?, ?)
                """);
        preparedStatement.setLong(1, id);
        preparedStatement.setString(2, username);
        preparedStatement.setString(3, password);
        preparedStatement.setString(4, role);
        preparedStatement.setString(5, team);
    }

    public static User userLogin(String username, String password) throws SQLException {
        Connection connection = DriverManager.getConnection(AppConfig.DATABASE_URI + "/" + AppConfig.DATABASE, AppConfig.USER, AppConfig.PASSWORD);
        User user = null;

        PreparedStatement preparedStatement = connection.prepareStatement("""
        SELECT * from user WHERE username = ? AND password = ?
        """);
        preparedStatement.setString(1, username);
        preparedStatement.setString(2, password);

        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            user = new User();
            user.setId(resultSet.getLong("id"));
            user.setUsername(resultSet.getString("username"));
            user.setPassword(resultSet.getString("password"));
            user.setRole(resultSet.getString("userrole"));
            user.setTeam(resultSet.getString("team"));
        }

        return user;
    }

    public Optional<User> findUser (String username, String encryptedPassword) throws SQLException {
        Connection connection = DriverManager.getConnection(AppConfig.DATABASE_URI + "/" + AppConfig.DATABASE, AppConfig.USER, AppConfig.PASSWORD);
        PreparedStatement preparedStatement = connection.prepareStatement("""
                SELECT * FROM user WHERE username = ? AND password=?
                """);

            preparedStatement.setString(1, username);
            preparedStatement.setString(2, encryptedPassword);

            try (ResultSet resultSet = preparedStatement.executeQuery()){
                if (resultSet.next()) {
                    return Optional.of(toUser(resultSet));
                } else {
                    return Optional.empty();
                }
            }
        }


    private User toUser(ResultSet result) throws SQLException {
        return new User(
                result.getLong(1),
                result.getString(2),
                result.getString(3),
                result.getString(4),
                result.getString(5)
        );
    }

    public void initialize() throws SQLException {
    }
}