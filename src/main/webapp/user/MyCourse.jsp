<%--
  Created by IntelliJ IDEA.
  User: teo20
  Date: 10/20/2021
  Time: 9:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>My Course</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description">
    <meta content="Coderthemes" name="author">
    <!-- App favicon -->
    <link rel="shortcut icon" href="../assets/images/title.ico">
    <!-- third party css -->
    <link href="../assets/css/vendor/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css">
    <!-- third party css end -->

    <!-- App css -->
    <link href="../assets/css/icons.min.css" rel="stylesheet" type="text/css">
    <link href="../assets/css/app.min.css" rel="stylesheet" type="text/css" id="light-style">
    <link href="../assets/css/app-dark.min.css" rel="stylesheet" type="text/css" id="dark-style">
    <style>
        .car-hover:hover{
            transform: translateY(-4px) translateX(4px);
            box-shadow: rgba(0,0,0,0.1);
        }
        .none-active{
            display: none !important;
        }
    </style>


</head>

<body class="loading" data-layout-config='{"leftSideBarTheme":"dark","layoutBoxed":false, "leftSidebarCondensed":false, "leftSidebarScrollable":false,"darkMode":false, "showRightSidebarOnStart": false}'>
<!-- Begin page -->
<div class="wrapper">
    <!-- ========== Left Sidebar Start ========== -->
    <div class="leftside-menu">

        <!-- LOGO -->
        <a href="<c:url value = "/user-home"/>" class="logo text-center logo-light">
                    <span class="logo-lg">
                        <img src="<c:url value = "/assets/images/logo.png"/>" alt="" height="16">
                    </span>
            <span class="logo-sm">
                        <img src="<c:url value = "../assets/images/logo_sm.png"/>" alt="" height="16">
                    </span>
        </a>

        <!-- LOGO -->
        <a href="<c:url value = "user-home"/>" class="logo text-center logo-dark">
                    <span class="logo-lg">
                        <img src="<c:url value = "../assets/images/logo-dark.png"/>" alt="" height="16">
                    </span>
            <span class="logo-sm">
                        <img src="<c:url value = "../assets/images/logo_sm_dark.png"/>" alt="" height="16">
                    </span>
        </a>

        <div class="h-100" id="leftside-menu-container" data-simplebar="">

            <!--- Sidemenu -->
            <ul class="side-nav">
                <li class="side-nav-item">
                    <a href="<c:url value = "/user-home"/>" class="side-nav-link">
                        <i class="uil-book-reader"></i>
                        <span> My Courses </span>
                    </a>
                </li>

                <li class="side-nav-item">
                    <a href="<c:url value = "/user-add-course"/>" class="side-nav-link">
                        <i class=" uil-parcel"></i>
                        <span>  Courses </span>
                    </a>
                </li>

                <li class="side-nav-item ">
                    <a href="<c:url value = "/profile-user"/>" class="side-nav-link ">
                        <i class=" uil-user"></i>
                        <span> My account</span>
                    </a>
                </li>
                <li class="side-nav-item">
                    <a data-bs-toggle="collapse" href="#sidebarEcommerce" aria-expanded="false" aria-controls="sidebarEcommerce" class="side-nav-link">
                        <i class="uil-layer-group"></i>
                        <span> Support </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <div class="collapse" id="sidebarEcommerce">
                        <ul class="side-nav-second-level">
                            <li class="side-nav-item">
                                <a href="<c:url value = "/support"/>" class="side-nav-link">
                                    <i class="uil-book-reader"></i>
                                    <span> How to use this website </span>
                                </a>
                            </li>

                            <li class="side-nav-item">
                                <a href="<c:url value = "/faq-support"/>" class="side-nav-link">
                                    <i class=" uil-parcel"></i>
                                    <span>  FAQ </span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>

            <div class="clearfix"></div>

        </div>
        <!-- Sidebar -left -->

    </div>
    <!-- Left Sidebar End -->

    <!-- ============================================================== -->
    <!-- Start Page Content here -->
    <!-- ============================================================== -->

    <div class="content-page">
        <div class="content">
            <!-- Topbar Start -->
            <div class="navbar-custom">
                <ul class="list-unstyled topbar-menu float-end mb-0">
                    <li class="dropdown notification-list d-lg-none">
                        <a class="nav-link dropdown-toggle arrow-none" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                            <i class="dripicons-search noti-icon"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-animated dropdown-lg p-0">
                            <form class="p-3">
                                <input type="text" class="form-control" placeholder="Search ..." aria-label="Recipient's username">
                            </form>
                        </div>
                    </li>

                    <li class="dropdown notification-list">
                        <a class="nav-link dropdown-toggle arrow-none" href="/ListCartController" role="button" aria-haspopup="false"
                           aria-expanded="false">
                            <i class="dripicons-cart noti-icon"> <span id="cartCounter" style="font-style: initial;
    background-color: #777;
    position: absolute;
    bottom: 33px;
display: inline-block;
    padding: 0.1em 0.2em;
    font-size: 0.6em;
    font-weight: 700;
    line-height: 1;
    color: #ffff;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    border-radius: 0.25rem;"><c:if test="${CARTKEY != null}">${CARTKEY.size()}</c:if>
                            <c:if test="${CARTKEY == null}"> 0</c:if></span></i>

                        </a>
                    </li>


                    <li class="dropdown notification-list">
                        <a class="nav-link dropdown-toggle nav-user arrow-none me-0" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                    <span class="account-user-avatar">
                                        <c:if test="${USERMODEL.getUrlAvatar() != null}">
                                            <img src="${USERMODEL.getUrlAvatar()}" alt="user-image" class="rounded-circle">
                                        </c:if>
                                        <c:if test="${USERMODEL.getUrlAvatar() == null}">
                                            <img src="<c:url value = "../assets/images/users/avatar-1.jpg"/>" alt="user-image" class="rounded-circle">
                                        </c:if>
                                    </span>
                            <span>
                                        <span class="account-user-name">${USERMODEL.getFullname()}</span>
                                        <span class="account-position">Student</span>
                                    </span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end dropdown-menu-animated topbar-dropdown-menu profile-dropdown">
                            <!-- item-->
                            <div class=" dropdown-header noti-title">
                                <h6 class="text-overflow m-0">Welcome !</h6>
                            </div>

                            <!-- item-->
                            <a href="<c:url value="/profile-user"/>" class="dropdown-item notify-item">
                                <i class="mdi mdi-account-circle me-1"></i>
                                <span>My Account</span>
                            </a>

                            <!-- item-->
                            <a href="<c:url value="/view-logout?action=logout"/>" class="dropdown-item notify-item">
                                <i class="mdi mdi-logout me-1"></i>
                                <span>Logout</span>
                            </a>
                        </div>
                    </li>

                </ul>
                <button class="button-menu-mobile open-left">
                    <i class="mdi mdi-menu"></i>
                </button>
                <div class="app-search dropdown d-none d-lg-block">
                    <form>
                        <div class="input-group">
                            <input type="text" class="form-control dropdown-toggle" placeholder="Search..." id="top-search">
                            <span class="mdi mdi-magnify search-icon"></span>
                            <button class="input-group-text btn-primary" type="submit">Search</button>
                        </div>
                    </form>
                </div>
            </div>
            <!-- end Topbar -->

            <!-- Start Content-->
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <h4 class="page-title">My Courses</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-sm-4">
                        <a href="<c:out value="/user-add-course"/> " class="btn btn-danger btn-rounded mb-3"><i class="mdi mdi-plus"></i> Add Courses</a>
                    </div>
                    <div class="col-sm-8">
                        <div class="text-sm-end">
                            <div class="btn-group mb-3">
                                <button id="find-all" type="button" class="btn btn-primary">All</button>
                            </div>
                            <div class="btn-group mb-3 ms-1">
                                <button id = "find-unfinish" type="button" class="btn btn-light">Unfinished</button>
                                <button id = "find-finish" type="button" class="btn btn-light">Finished</button>
                            </div>
                        </div>
                    </div><!-- end col-->
                </div>
                <!-- end row-->

                <div class="row">

                    <c:forEach items="${requestScope.listCsUser}" var="cs">

                        <div class="col-md-6 col-xxl-3 course-check">
                            <!-- project card -->
                            <div class="card d-block car-hover">
                                <!-- project-thumbnail -->
                                <a href="<c:out value="/user-exam?courseId=${cs.id}"/> ">
                                    <c:if test="${cs.courseImage}">
                                        <img class="card-img-top" src="../assets/images/projects/project-1.jpg" alt="project image cap">
                                    </c:if>
                                    <c:if test="${cs.courseImage != null}">
                                        <img class="card-img-top" style="max-height: 200px" src="${cs.courseImage}" alt="project image cap">
                                    </c:if>

                                    <div class="card-img-overlay">
                                        <div id ="check${cs.id}" class="badge bg-secondary text-light p-1 status">Unfinished</div>
                                    </div>

                                    <div class="card-body position-relative">
                                        <!-- project title-->
                                        <h4 class="mt-0">
                                            <div class="text-title">
                                                    ${cs.courseName}
                                                <c:forEach items="${requestScope.countExam}" var="item">
                                                    <c:if test="${cs.id == item[0]}">
                                                        <c:set var="count" value="${item[1]}"/>
                                                        <c:set var="progress" value="${Math.round((item[2]/item[1])*100*100)/100}"/>
                                                        <span class="pe-2 text-nowrap" style="font-size: 12px">
                                                            <i class="mdi mdi-format-list-bulleted-type"></i>
                                                            <b>${count}</b> Exams
                                                        </span>
                                                        <script>
                                                            var check = ${progress};
                                                            if(check == 100){
                                                                var temp= document.getElementById("check${cs.id}");
                                                                temp.innerText = "Finished"
                                                                temp.classList.remove("bg-secondary");
                                                                temp.classList.add("bg-success");
                                                            }
                                                        </script>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </h4>


                                        <!-- project progress-->
                                        <p class="mb-2 fw-bold">Progress <span class="float-end">${progress}%</span></p>
                                        <div class="progress progress-sm">
                                            <div class="progress-bar" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: ${progress}%;">
                                            </div><!-- /.progress-bar -->
                                        </div><!-- /.progress -->
                                    </div> <!-- end card-body-->
                                </a>
                            </div> <!-- end card-->
                        </div> <!-- end col -->

                    </c:forEach>
                </div>
                <!-- end row--> <!-- container -->
            </div>
        </div> <!-- content -->

        <!-- Footer Start -->
        <footer class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <script>
                            document.write(new Date().getFullYear())
                        </script> © FIT - Ho Chi Minh University of Technology and Education
                    </div>
                    <div class="col-md-6">
                        <div class="text-md-end footer-links d-none d-md-block">
                            <a href="javascript: void(0);">Group 1</a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- end Footer -->

    </div>

    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->


</div>
<!-- END wrapper -->


<div class="rightbar-overlay"></div>
<!-- /End-bar -->

<!-- bundle -->
<script src="../assets/js/vendor.min.js"></script>
<script src="../assets/js/app.min.js"></script>


<!-------Filter Course --------->
<script>
    // find all
    var btnALl = document.getElementById("find-all");
    var btnUnfinished = document.getElementById("find-unfinish");
    var btnfinish = document.getElementById("find-finish")
    btnALl.onclick = function (){
        btnALl.classList.add("btn-primary")
        btnALl.classList.remove("btn-light")
        btnUnfinished.classList.remove("btn-primary")
        btnfinish.classList.remove("btn-primary")
        btnUnfinished.classList.add("btn-light")
        btnfinish.classList.add("btn-light")
        var containers = document.querySelectorAll(".course-check")
        containers.forEach(function (container){
            container.classList.remove("none-active");
        })
    }
    // find unfinished
    btnUnfinished.onclick = function (){
        btnUnfinished.classList.add("btn-primary")
        btnUnfinished.classList.remove("btn-light")
        btnALl.classList.remove("btn-primary")
        btnfinish.classList.remove("btn-primary")
        btnALl.classList.add("btn-light")
        btnfinish.classList.add("btn-light")
        var containers = document.querySelectorAll(".course-check")
        containers.forEach(function (container){
            var kt = container.querySelector(".status").innerText
            if(kt === "Finished"){
                console.log("ok")
                container.classList.add("none-active");
            }
            else {
                container.classList.remove("none-active")
            }
        })
    }
    // find finish
    btnfinish.onclick = function (){
        btnfinish.classList.add("btn-primary")
        btnfinish.classList.remove("btn-light")
        btnALl.classList.remove("btn-primary")
        btnUnfinished.classList.remove("btn-primary")
        btnALl.classList.add("btn-light")
        btnUnfinished.classList.add("btn-light")
        var containers = document.querySelectorAll(".course-check")
        containers.forEach(function (container){
            var kt = container.querySelector(".status").innerText
            if(kt === "Unfinished"){
                console.log("ok")
                container.classList.add("none-active")
            }
            else {
                container.classList.remove("none-active")
            }
        })
    }
</script>

<!-- third party js -->
<script src="../assets/js/vendor/apexcharts.min.js"></script>
<script src="../assets/js/vendor/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../assets/js/vendor/jquery-jvectormap-world-mill-en.js"></script>
<!-- third party js ends -->

<!-- demo app -->
<script src="../assets/js/pages/demo.dashboard.js"></script>
<!-- end demo js-->
</div>
</body>
</html>