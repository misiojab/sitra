<%@ page import="com.misiojab.sitra.Issue.Issue" %>
<%@ page import="com.misiojab.sitra.Issue.IssueService" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.misiojab.sitra.Project.Project" %>
<%@ page import="com.misiojab.sitra.Project.ProjectService" %>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <!-- Custom styles for this -->
    <link href="styles/style.css" rel="stylesheet">
    <link href="styles/table-style.css" rel="stylesheet">
    <script src="script.js" rel="script"></script>

</head>
<body>

<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

    <div class=" d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Issues</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
        </div>
    </div>

    <div>

        <div id="addIssueView" class="collapse card">
            <div class="card-header">
                <h4 class="mb-3">Add new issue / Edit Issue</h4>
            </div>
            <div class="card-body">
                <form class="needs-validation" action="${pageContext.request.contextPath}/issue" method="post" novalidate>
                    <div class="row g-3">

                        <jsp:useBean id="issue" class="com.misiojab.sitra.Issue.Issue" scope="request"></jsp:useBean>

                        <div class="col-md-1">
                            <label for="id" class="form-label">id</label>
                            <input name="id" type="number" value="<%=issue.getId()%>" class="form-control" id="id" placeholder="" readonly>
                            <div class="invalid-feedback">
                                id required!
                            </div>
                        </div>

                        <div class="col-sm-5">
                            <label for="issuename" class="form-label">Issue name</label>
                            <input name="name" type="text" class="form-control" id="issuename" placeholder="Choose something nice" value="<%=issue.getName()%>" required>
                            <div class="invalid-feedback">
                                Valid name is required.
                            </div>
                        </div>

                        <div class="col-md-3">
                            <label for="project" class="form-label">Project</label>
                            <select name="project" class="form-select" id="project" required>
                                <option value="<%=issue.getProjectName()%>">Choose...</option>
                                <%

                                    List projectListOption = ProjectService.projectList();
                                    Iterator<Project> projectOptionIterator = projectListOption.iterator();

                                    while (projectOptionIterator.hasNext()) {
                                        Project project = projectOptionIterator.next();
                                %>

                                <option><%=project.getProjectName()%></option>
                                <% } %>
                            </select>
                            <div class="invalid-feedback">
                                Project required
                            </div>
                        </div>

                        <div class="col-md-1">
                            <label for="sprint" class="form-label">Sprint id</label>
                            <input name="sprint" type="number" value="<%=issue.getSprintId()%>" class="form-control" id="sprint" placeholder="" required>
                            <div class="invalid-feedback">
                                Sprint id required!
                            </div>
                        </div>

                        <div class="col-10">
                            <label for="description" class="form-label">Description <span class="text-muted">(Optional)</span></label>
                            <input name="description" type="text" class="form-control" id="description"  value="<%=issue.getDescription()%>" placeholder="Write something more about the issue...">
                        </div>

                        <div class="col-md-3">
                            <label for="priority" class="form-label">Priority</label>
                            <select name="priority" class="form-select" id="priority" required>
                                <option value="<%=issue.getPriority()%>">Choose...</option>
                                <option class="text-danger">Critical</option>
                                <option class="text-danger">High</option>
                                <option class="text-warning">Medium</option>
                                <option class="text-success">Low</option>
                                <option class="text-info">Optional</option>
                            </select>
                            <div class="invalid-feedback">
                                Please select priority
                            </div>
                        </div>



                        <div class="col-md-3">
                            <label for="category" class="form-label">Category</label>
                            <select name="category" class="form-select" id="category" required>
                                <option value="<%=issue.getCategory()%>">Choose...</option>
                                <option >no category</option>
                                <option >enhancement</option>
                                <option >critical error</option>
                                <option >cosmetic</option>
                                <option >bug</option>
                                <option >performance</option>
                                <option >documentation</option>
                                <option >new feature</option>
                            </select>
                            <div class="invalid-feedback">
                                Please select category
                            </div>
                        </div>

                        <div class="col-md-4">
                            <label for="status" class="form-label">Status</label>
                            <select name="status" class="form-select" id="status" required>
                                <option value="<%=issue.getStatus()%>">Choose...</option>
                                <option>To do</option>
                                <option>In progress</option>
                                <option>Done</option>
                                <option>Waiting</option>
                            </select>
                            <div class="invalid-feedback">
                                Please select status
                            </div>
                        </div>

                        <div class="col-sm-3">
                            <label for="startdate" class="form-label">Start date</label>
                            <input name="name" type="date" class="form-control" id="startdate" placeholder="Choose something nice" value="<%=issue.getStartDate()%>" required>
                            <div class="invalid-feedback">
                                Valid name is required.
                            </div>
                        </div>


                        <div class="col-sm-3">
                            <label for="duedate" class="form-label">Due date</label>
                            <input name="name" type="date" class="form-control" id="duedate" placeholder="Choose something nice" value="<%=issue.getDueDate()%>" required>
                            <div class="invalid-feedback">
                                Valid name is required.
                            </div>
                        </div>

                        <div class="col-4">
                            <label for="assign" class="form-label">Assign to:</label>
                            <div class="input-group has-validation">
                                <span class="input-group-text">@</span>
                                <input name="username" value="<%=issue.getAssignedTo()%>" type="text" class="form-control" id="assign" placeholder="Username" required>
                                <div class="invalid-feedback">
                                    Username is required.
                                </div>
                            </div>
                        </div>



                    </div>

                    <br>
                    <button class="w-25 btn btn-outline-danger btn-sm align-items-end" type="reset">Cancel</button>
                    <button class="w-25 btn btn-primary btn-sm" type="submit">Add issue</button>
                </form>
            </div>
        </div>

    </div>
    <br>
    <br>
    <div class="container">
        <div class="row row-cols-sm-5">
            <div class="col"></div>
            <div class="col"></div>
            <div class="col"></div>
            <div class="col"></div>
            <div class="col">
                <button class="btn-sm btn btn-outline-dark" data-bs-toggle="collapse" data-bs-target="#addIssueView">+ Add Issue</button>
            </div>
        </div>
    </div>
    <br>
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
                int indexIssue = 1;
                List<Issue> listIssue = IssueService.issueList();
                Iterator<Issue> issueIterator = listIssue.iterator();

                while (issueIterator.hasNext()) {
                    Issue issueI = issueIterator.next();
            %>
            <tr>
                <th scope="row"><%=indexIssue++%></th>
                <td><%=issueI.getName()%></td>
                <td><div class="priority-cell priority-<%=issueI.getPriority()%>"><%=issueI.getPriority()%></div></td>
                <td><div class="status-cell status-<%=issueI.getStatus().replaceAll("\\s+","")%>"><%=issueI.getStatus()%></div></td>
                <td><%=issueI.getAssignedTo()%></td>
                <td><%=issueI.getOpenedTime()%></td>
                <td><%=issueI.getDueDate()%></td>
                <td><%=issueI.getDescription()%></td>
                <td><%=issueI.getProjectName()%></td>
                <td><%=issueI.getSprintId()%></td>
                <td>
                    <div class="dropdown">
                        <button type="button" id="dropdownMenuButton<%=indexIssue%>" class="btn btn-sm btn-light" data-bs-toggle="dropdown" aria-expanded="false">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots-vertical" viewBox="0 0 16 16">
                                <path d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
                            </svg>
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton<%=indexIssue%>">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/issue?id=<%=issueI.getId()%>">edit</a></li>
                            <li><a class="dropdown-item text-danger" href="#">delete</a></li>

                        </ul>
                    </div>
                </td>

            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</main>

</body>
</html>
