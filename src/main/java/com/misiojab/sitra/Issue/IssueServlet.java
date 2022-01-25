package com.misiojab.sitra.Issue;

import com.misiojab.sitra.MainService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;

import static java.lang.Long.getLong;

@WebServlet(name = "IssueServlet", value = "/issue")
public class IssueServlet extends HttpServlet {

    private final IssueService issueService = new IssueService(MainService.getInstance());

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
        request.getRequestDispatcher("index.jsp").forward(request, response);

        long id = Long.parseLong(request.getParameter("id"));

        if (id >0 ) {
            Issue issue = new Issue();
            issue = IssueService.findById(id);
            request.setAttribute("issue", issue);
        }
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException{
        Timestamp now = new Timestamp(System.currentTimeMillis());

        Issue issue = new Issue();
        issue.setName(request.getParameter("name"));
        issue.setCategory(request.getParameter("category"));
        issue.setPriority(request.getParameter("priority"));
        issue.setFeature(request.getParameter("feature"));
        issue.setStatus(request.getParameter("status"));
        issue.setAssignedTo(request.getParameter("username"));
        issue.setDescription(request.getParameter("description"));
        issue.setProjectName(request.getParameter("project"));
        issue.setSprintId(Integer.parseInt(request.getParameter("sprint")));
        issue.setDueDate(now);
        issue.setOpenedTime(now);
        issue.setLastUpdate(now);
        issue.setId(Integer.parseInt(request.getParameter("id")));

        try {
            IssueService.CreateIssue(issue);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



}
