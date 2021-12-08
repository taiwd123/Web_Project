<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/21/2021
  Time: 4:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Error 404 | Hyper - Responsive Bootstrap 5 Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
    <meta content="Coderthemes" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="../assets/images/title.ico">

    <!-- App css -->
    <link href="<c:url value = "../assets/css/icons.min.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value = "../assets/css/app.min.css"/>" rel="stylesheet" type="text/css" id="light-style">
    <link href="<c:url value = "../assets/css/app-dark.min.css"/>" rel="stylesheet" type="text/css" id="dark-style">

</head>

<body class="loading authentication-bg" data-layout-config='{"leftSideBarTheme":"dark","layoutBoxed":false, "leftSidebarCondensed":false, "leftSidebarScrollable":false,"darkMode":false, "showRightSidebarOnStart": true}'>

<div class="account-pages pt-2 pt-sm-5 pb-4 pb-sm-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xxl-4 col-lg-5">
                <div class="card">
                    <!-- Logo -->
                    <div class="card-header pt-4 pb-4 text-center bg-primary">
                        <a href="<c:url value = "/home/home.jsp"/>">
                            <span><img src="<c:url value = "../assets/images/logo.png"/>" alt="" height="18"></span>
                        </a>
                    </div>

                    <div class="card-body p-4">
                        <div class="text-center">
                            <h1 class="text-error">4<i class="mdi mdi-emoticon-sad"></i>4</h1>
                            <h4 class="text-uppercase text-danger mt-3">Page Not Found</h4>
                            <p class="text-muted mt-3">It's looking like you may have taken a wrong turn. Don't worry... it
                                happens to the best of us. Here's a
                                little tip that might help you get back on track.</p>

                            <a class="btn btn-info mt-3" href="<c:url value = "/home/home.jsp"/>"><i class="mdi mdi-reply"></i> Return Home</a>
                        </div>
                    </div> <!-- end card-body-->
                </div>
                <!-- end card -->
            </div> <!-- end col -->
        </div>
        <!-- end row -->
    </div>
    <!-- end container -->
</div>
<!-- end page -->

<footer class="footer footer-alt">
    Community HCM University of Technology and Education
</footer>
<!-- bundle -->
<script src="<c:url value = "../assets/js/vendor.min.js"/>"></script>
<script src="<c:url value = "../assets/js/app.min.js"/>"></script>

</body>
</html>

