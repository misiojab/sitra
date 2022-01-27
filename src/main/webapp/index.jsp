<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bugtracker</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
    <script src="script.js" rel="script"></script>


    <style>
    </style>

    <!-- Custom styles for this -->
    <link href="styles/style.css" rel="stylesheet">


</head>
<body>
<%
    Object username = request.getSession().getAttribute("authorised");
    System.out.println(username);
    boolean isAuthenticated = username != null;




%>


<% if (!isAuthenticated){ %>

<%@ include file="login.jsp"%>

<% } %>



<% if (isAuthenticated) { %>

<!-- HEADER -->
 <%@ include file="header.jsp"%>

<!-- SIDEBAR -->
<%@ include file="sidebar.jsp"%>

<!-- CONTENT -->
<div class="wrapper">
<div class="issuesView visible">
    <%@ include file="issues.jsp"%>
</div>
<div class="projectsView">
    <%@include file="projects.jsp"%>
</div>
</div>

<% } %>

</body>
</html>
