<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bugtracker</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <style>
    </style>

    <!-- Custom styles for this -->
    <link href="styles/style.css" rel="stylesheet">
</head>
<body>
<%
    Object username = session.getAttribute("authorised");
    boolean isAuthenticated = username != null;
%>

<!-- HEADER -->
 <%@ include file="header.jsp"%>

<!-- SIDEBAR -->
<%@ include file="sidebar.jsp"%>

<!-- CONTENT -->
<%@ include file="issues.jsp"%>
<%@include file="projects.jsp"%>

</body>
</html>
