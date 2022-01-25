package com.misiojab.sitra.Project;

import com.misiojab.sitra.AppConfig;

import com.misiojab.sitra.MainService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProjectService {

    private final MainService mainService;

    public ProjectService(MainService mainService) {
        this.mainService = mainService;
    }

    public void CreateProject(String name, String team) throws SQLException {

        mainService.prepareStatement("""
            INSERT INTO issue
            (
            Project_name, Assigned_team
            )
            VALUES (?, ?
            );
            """, statement ->{
            statement.setString(1, name);
            statement.setString(2, team);

            return statement.execute();
        });
    }

    private List<Project> resultToArrayList (ResultSet resultSet) throws SQLException {
        List<Project> projects = new ArrayList<>();

        while (resultSet.next()) {
            projects.add(new Project(
                    resultSet.getString(1),
                    resultSet.getString(2)
            ));
        }
        return projects;
    }

    public static List projectList() throws SQLException{

        ArrayList list = new ArrayList();
        Connection connection = DriverManager.getConnection(AppConfig.DATABASE_URI + "/" + AppConfig.DATABASE, AppConfig.USER, AppConfig.PASSWORD);
        PreparedStatement preparedStatement = connection.prepareStatement("""
            SELECT * FROM project
            """);

        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            Project project = new Project();

            project.setProjectName(resultSet.getString("Project_name"));
            project.setAssignedTeam(resultSet.getString("Assigned_team"));

            list.add(project);
        }

        return list;
    }

}
