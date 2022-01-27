package com.misiojab.sitra.Project;

import com.misiojab.sitra.Login.LoginService;
import com.misiojab.sitra.Login.User;
import com.misiojab.sitra.MainService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ProjectServlet", value = "/project")
public class ProjectServlet extends HttpServlet {

    private final ProjectService projectService = new ProjectService(MainService.getInstance());


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("Project_name");
        String team = request.getParameter("Assigned_team");


        try {
            ProjectService.CreateProject(name, team);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name =(request.getParameter("project"));
        String team = (request.getParameter("team"));

        try {
            ProjectService.CreateProject(name, team);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
