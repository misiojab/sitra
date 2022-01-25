package com.misiojab.sitra.Issue;

import com.misiojab.sitra.AppConfig;
import com.misiojab.sitra.MainService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class IssueService {

    private static MainService mainService;

    public IssueService(MainService mainService) {
        this.mainService = mainService;
    }

    public static void CreateIssue(Issue issue) throws SQLException {
        Timestamp now = new Timestamp(System.currentTimeMillis());

        mainService.prepareStatement("""
                INSERT INTO issue
                (
                Category, Name, Priority,
                Feature, Status, Assigned_to,
                Description, Opened_time, Last_update,
                Project_name, Sprint_id, Due_date, id
                )
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?
                );
                """, statement -> {
            statement.setString(1, issue.getCategory());
            statement.setString(2, issue.getName());
            statement.setString(3, issue.getPriority());
            statement.setString(4, issue.getFeature());
            statement.setString(5, issue.getStatus());
            statement.setString(6, issue.getAssignedTo());
            statement.setString(7, issue.getDescription());
            statement.setTimestamp(8, now);
            statement.setTimestamp(9, now);
            statement.setString(10, issue.getProjectName());
            statement.setInt(11, (int) issue.getSprintId());
            statement.setTimestamp(12, issue.getDueDate());
            statement.setLong(13, nextIdKey());

            return statement.execute();

        });
    }

    public static long nextIdKey() throws SQLException {
        long key = 0;
        Connection connection = DriverManager.getConnection(AppConfig.DATABASE_URI + "/" + AppConfig.DATABASE, AppConfig.USER, AppConfig.PASSWORD);
        PreparedStatement preparedStatement = connection.prepareStatement("select Max(id) from issue");
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            key = resultSet.getLong(1);
        }

        return key++;
    }

    public static List issueList() throws SQLException {

        ArrayList list = new ArrayList();
        Connection connection = DriverManager.getConnection(AppConfig.DATABASE_URI + "/" + AppConfig.DATABASE, AppConfig.USER, AppConfig.PASSWORD);
        PreparedStatement preparedStatement = connection.prepareStatement("""
            SELECT * FROM issue ORDER BY status DESC, priority;
            """);

        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            Issue issue = new Issue();

            issue.setCategory(resultSet.getString("Category"));
            issue.setName(resultSet.getString("Name"));
            issue.setPriority(resultSet.getString("Priority"));
            issue.setFeature(resultSet.getString("Feature"));
            issue.setStatus(resultSet.getString("Status"));
            issue.setAssignedTo(resultSet.getString("Assigned_to"));
            issue.setDescription(resultSet.getString("Description"));
            issue.setOpenedTime(resultSet.getTimestamp("Opened_time"));
            issue.setLastUpdate(resultSet.getTimestamp("Last_update"));
            issue.setProjectName(resultSet.getString("Project_name"));
            issue.setSprintId(resultSet.getInt("Sprint_id"));
            issue.setId(resultSet.getLong("id"));

            list.add(issue);
        }

        return list;
    }

    public static Issue findById(long id) {
        Connection connection;
        Issue issue = null;
        try {
            connection = DriverManager.getConnection(AppConfig.DATABASE_URI + "/" + AppConfig.DATABASE, AppConfig.USER, AppConfig.PASSWORD);
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM issue WHERE id=?");
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                issue = new Issue();
                System.out.println("ID: "+resultSet.getLong("id"));
                issue.setCategory(resultSet.getString("Category"));
                issue.setName(resultSet.getString("Name"));
                issue.setPriority(resultSet.getString("Priority"));
                issue.setFeature(resultSet.getString("Feature"));
                issue.setStatus(resultSet.getString("Status"));
                issue.setAssignedTo(resultSet.getString("Assigned_to"));
                issue.setDescription(resultSet.getString("Description"));
                issue.setOpenedTime(resultSet.getTimestamp("Opened_time"));
                issue.setLastUpdate(resultSet.getTimestamp("Last_update"));
                issue.setProjectName(resultSet.getString("Project_name"));
                issue.setSprintId(resultSet.getInt("Sprint_id"));
                issue.setId(resultSet.getLong("id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return issue;
    }
}
