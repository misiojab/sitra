<%--
  Created by IntelliJ IDEA.
  User: misio
  Date: 26.01.2022
  Time: 05:00
  To change this template use File | Settings | File Templates.
--%>

<%@page import="com.misiojab.sitra.Login.User" %>
<%@page import="com.misiojab.sitra.Login.LoginServlet" %>
<html>
<head>
    <title>Bugtracker - Sign in!</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/styles/login.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Urbanist' rel='stylesheet'>
    
    <style>
        svg {
            font-family: Urbanist, serif;
        }
    </style>

</head>
<body class="text-center">



<main class="form-signin">
    <div class="d-flex justify-content-center">
        <svg width="300" height="200" xmlns="http://www.w3.org/2000/svg">
            <g>
                <title>Layer 1</title>
                <path id="svg_4" d="m32.61108,32.31138c75.64295,-65.42506 236.62262,70.81032 248.884,24.03009c12.26137,-46.78023 -130.14696,-67.28255 -181.11208,65.5193c-50.96512,132.80184 -143.41487,-24.12432 -67.77192,-89.54938l0,-0.00001z" opacity="NaN" stroke-width="0" fill="#56aaff" stroke="#000"></path>
                <text fill="#000000" stroke="#000" stroke-width="0" x="96.94289" y="115.55263" id="svg_1" font-size="60" font-family="'Urbanist'" text-anchor="start" xml:space="preserve" font-weight="bold">Tracker</text>
                <text fill="#ffffff" stroke="#000" stroke-width="0" x="5" y="114.5" id="svg_2" font-size="60" font-family="'Urbanist'" text-anchor="start" xml:space="preserve" font-weight="bold">Bug</text>
            </g>

        </svg>
    </div>
    <form action="${pageContext.request.contextPath}/login" method="get">

        <h1 class="h3 mb-3 fw-normal">Hello</h1>

        <div class="form-floating">
            <input type="text" name="username" class="form-control" id="username" placeholder="your username">
            <label for="username">Username</label>
        </div>

        <div class="form-floating">
            <input type="password" name="password" class="form-control" id="password" placeholder="password">
            <label for="password">Password</label>
        </div>

        <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
        <p class="mt-5 mb-3 text-muted">misiojab: 2022</p>
    </form>
</main>

</body>
</html>
