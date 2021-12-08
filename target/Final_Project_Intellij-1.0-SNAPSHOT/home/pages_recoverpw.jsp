<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/21/2021
  Time: 4:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Recover Password</title>
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
    <c:if test="${not empty message}">
        <c:if test="${alert.equals('success')}">
            <div id="success" class="alert alert-success alert-dismissible bg-success text-white border-0 fade show text-center" style="z-index: 999; position: fixed; width: auto; right: 2%; top: 5%" role="alert">
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                <strong>Success - </strong> ${message}
            </div>
        </c:if>
        <c:if test="${alert.equals('error')}">
            <div id="error" class="alert alert-danger alert-dismissible bg-danger text-white border-0 fade show text-center" style="z-index: 999; position: fixed; width: auto; right: 2%; top: 5%;" role="alert">
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                <strong>Error - </strong> ${message}
            </div>
        </c:if>
    </c:if>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xxl-4 col-lg-5">
                <div class="card">
                    <!-- Logo -->
                    <div class="card-header pt-4 pb-4 text-center bg-primary">
                        <a href="<c:url value = "/"/>">
                            <span><img src="<c:url value = "../assets/images/logo.png"/>" alt="" height="18"></span>
                        </a>
                    </div>

                    <div class="card-body p-4">

                        <div class="text-center w-75 m-auto">
                            <h4 class="text-dark-50 text-center mt-0 fw-bold">Reset Password</h4>
                            <p class="text-muted mb-4">Enter your email address and we'll send you an email with instructions to reset your password.</p>
                        </div>

                        <form action="/recover-password" method="post">
                            <div class="mb-3">
                                <label for="emailaddress" class="form-label">Email address</label>
                                <input name="email" class="form-control" type="email" id="emailaddress" required="" placeholder="Enter your email">
                            </div>

                            <div class="mb-0 text-center">
                                <input name="action" value="recover" type="hidden">
                                <button class="btn btn-primary" type="submit">Reset Password</button>
                            </div>
                        </form>
                    </div> <!-- end card-body-->
                </div>
                <!-- end card -->

                <div class="row mt-3">
                    <div class="col-12 text-center">

                        <p class="text-muted">Back to <a href="<c:url value = "/view-login?action=login"/>" class="text-muted ms-1"><b>Log In</b></a></p>
                    </div> <!-- end col -->
                </div>
                <!-- end row -->

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
<script>
    $("#success").fadeOut(5000);
</script>
<script>
    $("#error").fadeOut(5000);
</script>
</body>
</html>

