package com.misiojab.sitra;

import com.misiojab.sitra.Issue.Issue;
import com.misiojab.sitra.Issue.IssueService;
import com.misiojab.sitra.Login.LoginService;
import com.misiojab.sitra.Utils.ThrowException;

import java.nio.file.Paths;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.RandomAccess;

public class MainService {

    private static final MainService INSTANCE = MainService.getInstance();

    private final IssueService issueService;
    private final LoginService loginService;

    private MainService() {
        this.loginService = new LoginService(this);
        this.issueService = new IssueService(this);
    }



    public void initialize() {
        // loginService.init();
        //issueService.initialize();
    }

    public static MainService getInstance() {
        if (INSTANCE != null) {
            return INSTANCE;
        }

        try {
            System.out.println("working dir: " + Paths.get(".").toAbsolutePath());
            System.out.println("Driver: " + Class.forName(AppConfig.DATABASE_DRIVER));

            MainService mainService = new MainService();

            mainService.prepareStatement("""
                    CREATE TABLE IF NOT EXISTS feature
                    (
                        id           INT NOT NULL AUTO_INCREMENT
                            primary key,
                        Feature_name varchar(50) not null,
                        Project      varchar(50) not null,
                        constraint IX_Feature
                            unique (Feature_name)
                    );
                    """, PreparedStatement::execute);

            mainService.prepareStatement("""
                    CREATE TABLE IF NOT EXISTS issue
                    (
                        Category     varchar(50) null,
                        Name         varchar(50) not null,
                        Priority     varchar(50) not null,
                        Feature      varchar(50) not null,
                        Status       varchar(50) not null,
                        Assigned_to  varchar(50) null,
                        Description  varchar(50) null,
                        Opened_time  datetime    null,
                        Last_update  datetime    null,
                        Project_name varchar(50) not null,
                        Sprint_id    int         not null,
                        constraint FK_Issue_Category
                            foreign key (Category) references category (Category_name),
                        constraint FK_Issue_Feature
                            foreign key (Feature) references feature (Feature_name),
                        constraint FK_Issue_Sprint
                            foreign key (Sprint_id) references sprint (id),
                        constraint FK_Issue_Status
                            foreign key (Status) references status (Status_name),
                        constraint FK_Issue_User
                            foreign key (Assigned_to) references user (username))
                    """, PreparedStatement::execute);

            mainService.prepareStatement("""
                    CREATE TABLE IF NOT EXISTS project
                    (
                        id            int         not null
                            primary key,
                        Project_name  varchar(50) not null,
                        Assigned_team varchar(50) null,
                        constraint FK_Project_Team
                            foreign key (Assigned_team) references team (Team_name)
                    );
                    """, PreparedStatement::execute);
/*
            mainService.prepareStatement("""
                    CREATE TABLE IF NOT EXISTS issue(
                    
                    """, PreparedStatement::execute);
*/


            mainService.initialize();
            return mainService;
        } catch (Exception e) {
            throw new RuntimeException("nie tworzy sie main service", e);
        }

    }

    public <R> R prepareStatement(String sql, ThrowException<PreparedStatement, R, SQLException> request) throws SQLException {
        PreparedStatement preparedStatement = null;
        try {
            Class.forName(AppConfig.DATABASE_DRIVER);

            Connection connection = DriverManager.getConnection(AppConfig.DATABASE_URI + "/" + AppConfig.DATABASE, AppConfig.USER, AppConfig.PASSWORD);
            preparedStatement = connection.prepareStatement(sql);

        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        return request.execute(preparedStatement);
    }

    public IssueService getIssueService() {
        return issueService;
    }

    public LoginService getLoginService(){
        return loginService;
    }

}
