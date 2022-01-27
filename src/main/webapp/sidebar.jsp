<%--
  Created by IntelliJ IDEA.
  User: misio
  Date: 21.01.2022
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bugtracker</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="script.js" rel="script"></script>



    <!-- Custom styles for this -->
    <link href="styles/style.css" rel="stylesheet">

</head>
<body>

<div class="container-fluid">
    <div class="row">
        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
            <div class="position-sticky pt-3">
                <ul class="nav flex-column">

                    <li class="nav-item" id="dashboardView">
                        <a class="nav-link">
                            <span data-feather="home"></span>
                            Dashboard
                        </a>
                    </li>

                    <li class="nav-item" id="issuesView">
                        <a class="nav-link active">
                            <span data-feather="home"></span>
                            Issues
                        </a>
                    </li>
                    <li class="nav-item" id="projectsView">
                        <a class="nav-link">
                            <span data-feather="file"></span>
                            Projects
                        </a>
                    </li>

                </ul>

                <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                    <span>Settings</span>
                    <a class="link-secondary" href="#" aria-label="Add a new report">
                        <span data-feather="plus-circle"></span>
                    </a>
                </h6>
                <ul class="nav flex-column mb-2">
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <span data-feather="file-text"></span>
                            not functional
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <span data-feather="file-text"></span>
                            not functional
                        </a>
                    </li>

                </ul>
            </div>
        </nav>
    </div>
</div>

<script>


</script>

</body>
</html>
