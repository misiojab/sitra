package com.misiojab.sitra.Login;

import com.misiojab.sitra.AppConfig;
import com.misiojab.sitra.MainService;

import java.sql.*;


public final class LoginService {

    private final MainService mainService;

    public LoginService(MainService mainService) {
        this.mainService = mainService;
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
            user.setRole(resultSet.getString("role"));
            user.setTeam(resultSet.getString("team"));
        }

        return user;
    }

}