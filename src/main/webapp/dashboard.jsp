<%--
  Created by IntelliJ IDEA.
  User: misio
  Date: 21.01.2022
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.misiojab.sitra.Issue.Issue" %>
<%@ page import="com.misiojab.sitra.Issue.IssueService" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.misiojab.sitra.Project.Project" %>
<%@ page import="com.misiojab.sitra.Project.ProjectService" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Content</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <style>
    </style>

    <!-- Custom styles for this -->
    <link href="styles/style.css" rel="stylesheet">
    <link href="styles/table-style.css" rel="stylesheet">
</head>
<body>

<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

    <div class=" d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Dashboard</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
        </div>
    </div>

    <h4 class="mb-3">My issues</h4>

    <div>
        <div class="row">
        <%
            List userIssues = IssueService.userIssues((String) request.getSession().getAttribute("authorised"));
            Iterator<Issue> userIssueIterator = userIssues.iterator();

            while (userIssueIterator.hasNext()) {
                Issue userIssueI = userIssueIterator.next();

        %>
            <div class="col-sm-2">
        <div class="card">

            <div class="card-body">
                <h5 class="card-subtitle"><%=userIssueI.getName()%></h5>
                <h6 class="card-subtitle mb-2 text-muted"></h6>
            </div>
            <div class="card-footer">
                <small class="text-muted">small text</small>
            </div>
        </div>
            </div>
        <%
            }
        %>

        </div>
    </div>
    <div class="table-responsive">
        <table class="table table-striped table-sm">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Issue</th>
                <th scope="col"></th>
                <th scope="col">Status</th>
                <th scope="col">Assigned_to</th>
                <th scope="col">Opened</th>
                <th scope="col">Due to</th>
                <th scope="col">Description</th>
                <th scope="col">Project</th>
                <th scope="col">Sprint</th>
                <th scope="col">Actions</th>

            </tr>
            </thead>
            <tbody>
            <%

            %>
            <tr>
                <th scope="row"></th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>

            </tr>
            <%  %>
            </tbody>
        </table>
    </div>
</main>

</body>
</html>
