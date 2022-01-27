package com.misiojab.sitra.Team;

import com.misiojab.sitra.AppConfig;
import com.misiojab.sitra.MainService;
import com.misiojab.sitra.Project.Project;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TeamService {

    private final MainService mainService;

    public TeamService(MainService mainService) {
        this.mainService = mainService;
    }


    public static List teamList() throws SQLException {

        ArrayList list = new ArrayList();
        Connection connection = DriverManager.getConnection(AppConfig.DATABASE_URI + "/" + AppConfig.DATABASE, AppConfig.USER, AppConfig.PASSWORD);
        PreparedStatement preparedStatement = connection.prepareStatement("""
            SELECT * FROM team
            """);

        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            Team team = new Team();

            team.setId(resultSet.getLong("id"));
            team.setTeamName(resultSet.getString("Team_name"));

            list.add(team);
        }

        return list;
    }

    public void CreateTeam(String id, String name) throws SQLException {
        mainService.prepareStatement("""
            INSERT INTO team
            (
            id, Team_name
            )
            VALUES (?, ?
            );
            """, statement ->{
            statement.setString(1, id);
            statement.setString(2, name);

            return statement.execute();
        });
    }
}
