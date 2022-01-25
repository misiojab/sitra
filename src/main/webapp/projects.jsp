<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.misiojab.sitra.Project.Project" %>
<%@ page import="com.misiojab.sitra.Project.ProjectService" %><%--
  Created by IntelliJ IDEA.
  User: misio
  Date: 21.01.2022
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Content</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <style>
    </style>

    <!-- Custom styles for this -->
    <link href="styles/style.css" rel="stylesheet">
</head>
<body>

<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Projects</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
        </div>
    </div>

    <div class="table-responsive">
        <table class="table table-striped table-sm">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Project</th>
                <th scope="col">Assigned team</th>

            </tr>
            </thead>
            <tbody>
            <%
                int indexProject = 1;
                List<Project> projectList = ProjectService.projectList();
                Iterator projectIterator = projectList.iterator();

                while (projectIterator.hasNext()) {
                    Project project = (Project) projectIterator.next();
            %>
            <tr>
                <th scope="row"><%=indexProject++%></th>
                <td><%=project.getProjectName()%></td>
                <td><%=project.getAssignedTeam()%></td>


            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</main>

</body>
</html>
