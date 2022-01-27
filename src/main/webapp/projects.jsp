<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.misiojab.sitra.Project.Project" %>
<%@ page import="com.misiojab.sitra.Project.ProjectService" %>
<%@ page import="com.misiojab.sitra.Team.Team" %>
<%@ page import="com.misiojab.sitra.Team.TeamService" %>
<%--
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

    <div>
            <h4 class="mb-3">Add new project / edit project</h4>

            <form class="needs-validation" action="${pageContext.request.contextPath}/project" method="post" novalidate>
                <div class="row g-3">

                    <jsp:useBean id="project" class="com.misiojab.sitra.Project.Project" scope="request"></jsp:useBean>

                    <div class="col-sm-5">
                        <label for="project" class="form-label">Project name</label>
                        <input name="project" type="text" class="form-control" id="project" placeholder="Choose something nice" value="<%=project.getProjectName()%>" required>
                        <div class="invalid-feedback">
                            Valid name is required.
                        </div>
                    </div>

                    <div class="col-md-3">
                        <label for="team" class="form-label">Team</label>
                        <select name="team" class="form-select" id="team" required>
                            <option value="<%=project.getAssignedTeam()%>">Choose...</option>
                            <%

                                List teamListOption = TeamService.teamList();
                                Iterator<Team> teamIterator = teamListOption.iterator();

                                while (teamIterator.hasNext()) {
                                    Team team = teamIterator.next();
                            %>

                            <option><%=team.getTeamName()%></option>
                            <% } %>
                        </select>
                        <div class="invalid-feedback">
                            Project required
                        </div>
                    </div>

                <br>
                <button class="w-25 btn btn-outline-danger btn-sm align-items-end" type="reset">Cancel</button>
                <button class="w-25 btn btn-primary btn-sm" type="submit">Add project</button>
            </form>
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
                    Project projectI = (Project) projectIterator.next();
            %>
            <tr>
                <th scope="row"><%=indexProject++%></th>
                <td><%=projectI.getProjectName()%></td>
                <td><%=projectI.getAssignedTeam()%></td>


            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</main>

</body>
</html>
