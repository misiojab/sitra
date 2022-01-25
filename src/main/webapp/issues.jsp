<%@ page import="com.misiojab.sitra.Issue.Issue" %>
<%@ page import="com.misiojab.sitra.Issue.IssueService" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %><%--
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
    <link href="styles/table-style.css" rel="stylesheet">
</head>
<body>

<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Issues</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
        </div>
    </div>

    <div>
        <div class="">
            <h4 class="mb-3">Add new issue / Edit Issue</h4>

            <jsp:useBean id="issue" class="com.misiojab.sitra.Issue.Issue" scope="request"></jsp:useBean>

            <form class="needs-validation" action="${pageContext.request.contextPath}/api/issue" method="post" novalidate>
                <div class="row g-3">

                    <div class="col-sm-4">
                        <label for="issuename" class="form-label">Issue name</label>
                        <input name="name" type="text" class="form-control" id="issuename" placeholder="Choose something nice" value="<%=issue.getName()%>" required>
                        <div class="invalid-feedback">
                            Valid name is required.
                        </div>
                    </div>

                    <div class="col-md-5">
                        <label for="project" class="form-label">Project</label>
                        <select name="project" class="form-select" id="project" required>
                            <option value="<%=issue.getProjectName()%>">Choose...</option>
                            <%
                                int indexProjectOption = 1;
                                List<Project> projectListOption = ProjectService.projectList();
                                Iterator projectOptionIterator = projectListOption.iterator();

                                while (projectOptionIterator.hasNext()) {
                                    Project project = (Project) projectOptionIterator.next();
                            %>

                            <option><%=project.getProjectName()%></option>
                            <% } %>
                        </select>
                        <div class="invalid-feedback">
                            Project required
                        </div>
                    </div>

                    <div class="col-8">
                        <label for="description" class="form-label">Description <span class="text-muted">(Optional)</span></label>
                        <input name="description" type="text" class="form-control" id="description"  value="<%=issue.getDescription()%>" placeholder="Write something more about the issue...">
                    </div>

                    <div class="col-md-4">
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

                    <div class="col-md-4">
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

                    <div class="col-6">
                        <label for="assign" class="form-label">Assign to:</label>
                        <div class="input-group has-validation">
                            <span class="input-group-text">@</span>
                            <input name="username" value="<%=issue.getAssignedTo()%>" type="text" class="form-control" id="assign" placeholder="Username" required>
                            <div class="invalid-feedback">
                                Username is required.
                            </div>
                        </div>
                    </div>
z
                    <div class="col-md-2">
                        <label for="sprint" class="form-label">Sprint id</label>
                        <input name="sprint" type="number" value="<%=issue.getSprintId()%>" class="form-control" id="sprint" placeholder="" required>
                        <div class="invalid-feedback">
                            Sprint id required!
                        </div>
                    </div>
                </div>

                <button class="w-25 btn btn-outline-danger btn-sm align-items-end" type="submit">Cancel</button>
                <button class="w-25 btn btn-primary btn-sm" type="submit">Add issue</button>
            </form>
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
                int indexIssue = 1;
                List<Issue> listIssue = IssueService.issueList();
                Iterator issueIterator = listIssue.iterator();

                while (issueIterator.hasNext()) {
                    Issue issue = (Issue) issueIterator.next();
            %>
            <tr>
                <th scope="row"><%=indexIssue++%></th>
                <td><%=issue.getName()%></td>
                <td><div class="priority-cell priority-<%=issue.getPriority()%>"><%=issue.getPriority()%></div></td>
                <td><div class="status-cell status-<%=issue.getStatus().replaceAll("\\s+","")%>"><%=issue.getStatus()%></div></td>
                <td><%=issue.getAssignedTo()%></td>
                <td><%=issue.getOpenedTime()%></td>
                <td><%=issue.getDueDate()%></td>
                <td><%=issue.getDescription()%></td>
                <td><%=issue.getProjectName()%></td>
                <td><%=issue.getSprintId()%></td>
                <td><%=issue.getLastUpdate()%></td>

            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</main>

</body>
</html>
<%!
    private Object getString(String name) {
    }
%>