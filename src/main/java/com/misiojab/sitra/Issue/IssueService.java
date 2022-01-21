package com.misiojab.sitra.Issue;

import com.misiojab.sitra.AppConfig;
import com.misiojab.sitra.MainService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class IssueService {

    private final MainService mainService;

    public IssueService(MainService mainService) {
        this.mainService = mainService;
    }

    public void CreateIssue(String name, String category, String priority, String feature, String status,
                            String assigned_to, String description, String project, int sprint) throws SQLException {
        Timestamp now = new Timestamp(System.currentTimeMillis());

        mainService.prepareStatement("""
            INSERT INTO issue
            (
            Category, Name, Priority,
            Feature, Status, Assigned_to,
            Description, Opened_time, Last_update,
            Project_name, Sprint_id
            )
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?
            );
            """, statement ->{
            statement.setString(1, category);
            statement.setString(2, name);
            statement.setString(3, priority);
            statement.setString(4, feature);
            statement.setString(5, status);
            statement.setString(6, assigned_to);
            statement.setString(7, description);
            statement.setTimestamp(8, now);
            statement.setTimestamp(9, now);
            statement.setString(10, project);
            statement.setInt(11, sprint);

            return statement.execute();
        });
    }

    public List<Issue> findAllIsuesByProject (String project) throws SQLException {
        return mainService.prepareStatement("""
        SELECT * FROM issue 
        WHERE Project_name = ? 
        ORDER BY Opened_time DESC
        """,statement -> {
                    try {
                        statement.setString(1, project);
                        ResultSet resultSet = statement.executeQuery();
                        return resultToArrayList(resultSet);
                    } finally {
                    }
        });
    }

    private List<Issue> resultToArrayList (ResultSet resultSet) throws SQLException {
        List<Issue> issues = new ArrayList<>();

        while (resultSet.next()) {
            issues.add(new Issue(
                    resultSet.getString(1),
                    resultSet.getString(2),
                    resultSet.getString(3),
                    resultSet.getString(4),
                    resultSet.getString(5),
                    resultSet.getString(6),
                    resultSet.getString(7),
                    resultSet.getTimestamp(8),
                    resultSet.getTimestamp(9),
                    resultSet.getString(10),
                    resultSet.getInt(11)
            ));
        }
        return issues;
    }

    public static List issueList() throws SQLException{

        ArrayList list = new ArrayList();
        Connection connection = DriverManager.getConnection(AppConfig.DATABASE_URI + "/" + AppConfig.DATABASE, AppConfig.USER, AppConfig.PASSWORD);
        PreparedStatement preparedStatement = connection.prepareStatement("""
            SELECT * FROM issue
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

            list.add(issue);
        }

        return list;
    }

}
