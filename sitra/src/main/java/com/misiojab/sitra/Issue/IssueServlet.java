package com.misiojab.sitra.Issue;

import com.misiojab.sitra.MainService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.sql.SQLException;

@WebServlet(name = "IssueServlet", value = "/api/issue")
public class IssueServlet extends HttpServlet {

    private final IssueService issueService = new IssueService(MainService.getInstance());

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        HttpSession session = request.getSession();

        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String priority = request.getParameter("priority");
        String feature = request.getParameter("feature");
        String status = request.getParameter("status");
        String assigned_to = request.getParameter("assigned");
        String description = request.getParameter("description");
        String project = request.getParameter("project");
        int sprint = Integer.parseInt(request.getParameter("sprint"));

        try {
            issueService.CreateIssue(name, category, priority, feature, status, assigned_to, description, project, sprint);
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }
}
