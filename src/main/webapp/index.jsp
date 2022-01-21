<%@ page import="com.misiojab.sitra.Issue.IssueServlet" %>
<%@ page import="java.util.List" %>
<%@ page import="com.misiojab.sitra.Issue.IssueService" %>
<%@ page import="com.misiojab.sitra.Issue.Issue" %>
<%@ page import="javax.swing.text.html.HTMLDocument" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bugtracker</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>

    <!-- Custom styles for this -->
    <link href="dashboard.css" rel="stylesheet">
</head>
<body>
<%
    Object username = session.getAttribute("authorised");
    boolean isAuthenticated = username != null;
%>

<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
    <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">Bugtracker</a>
    <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
    <div class="navbar-nav">
        <div class="nav-item text-nowrap">
            <% if(isAuthenticated){%>
                <a class="nav-link px-3" href="#">Sign out</a>
            <% } %>
        </div>
    </div>
</header>

<div class="container-fluid">
    <div class="row">
        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
            <div class="position-sticky pt-3">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">
                            <span data-feather="home"></span>
                            Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <span data-feather="file"></span>
                            Orders
                        </a>
                    </li>

                </ul>

                <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                    <span>Saved reports</span>
                    <a class="link-secondary" href="#" aria-label="Add a new report">
                        <span data-feather="plus-circle"></span>
                    </a>
                </h6>
                <ul class="nav flex-column mb-2">
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <span data-feather="file-text"></span>
                            Current month
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <span data-feather="file-text"></span>
                            Last quarter
                        </a>
                    </li>

                </ul>
            </div>
        </nav>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">Dashboard</h1>
                <div class="btn-toolbar mb-2 mb-md-0">
                </div>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Name</th>
                        <th scope="col">Priority</th>
                        <th scope="col">Feature</th>
                        <th scope="col">Status</th>
                        <th scope="col">Assigned_to</th>
                        <th scope="col">Description</th>
                        <th scope="col">Opened</th>
                        <th scope="col">Updated</th>
                        <th scope="col">Project</th>
                        <th scope="col">Sprint</th>

                    </tr>
                    </thead>
                    <tbody>
                    <%
                        int index = 1;
                        List <Issue> list = IssueService.issueList();
                        Iterator iterator = list.iterator();

                        while (iterator.hasNext()) {
                        Issue issue = (Issue) iterator.next();
                    %>
                    <tr>
                        <th scope="row"><%=index++%></th>
                        <td><%=issue.getName()%></td>
                        <td><%=issue.getPriority()%></td>
                        <td><%=issue.getFeature()%></td>
                        <td><%=issue.getStatus()%></td>
                        <td><%=issue.getAssignedTo()%></td>
                        <td><%=issue.getDescription()%></td>
                        <td><%=issue.getOpenedTime()%></td>
                        <td><%=issue.getLastUpdate()%></td>
                        <td><%=issue.getProjectName()%></td>
                        <td><%=issue.getSprintId()%></td>

                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</div>


</body>
</html>
