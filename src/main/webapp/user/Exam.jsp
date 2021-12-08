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
    <title>Exams</title>
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
        .car-hover:hover {
            transform: translateY(-4px) translateX(4px);
            box-shadow: rgba(0, 0, 0, 0.1);
        }
    </style>


</head>

<body class="loading"
      data-layout-config='{"leftSideBarTheme":"dark","layoutBoxed":false, "leftSidebarCondensed":false, "leftSidebarScrollable":false,"darkMode":false, "showRightSidebarOnStart": false}'>
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
                <li class="side-nav-item menuitem-active">
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
                            <h4 class="page-title">Exams</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row mb-2">
                    <div class="col-sm-4">
                        <a href="<c:out value="/user-home"/>" class="btn btn-danger btn-rounded mb-3"><i
                                class="uil-book-reader"></i> My Courses</a>
                        <a href="<c:out value="/document?courseID=${courseId}"/>" class="btn btn-danger btn-rounded mb-3"><i
                                class="uil-book-reader"></i> Course's Library</a>
                    </div>
                </div>
                <!-- end row-->

                <div class="row">
                    <c:forEach var="item" items="${exam.listResult}">
                        <div class="col-md-6 col-xxl-3">
                            <!-- project card -->
                            <div class="card d-block car-hover">
                                <div class="card-body">

                                    <!-- project title-->
                                    <h4 class="mt-0 text-title">
                                            ${item.examName}
                                    </h4>
                                    <c:if test="${empty item.score}">
                                        <div class="badge bg-secondary  mb-3">Unfinished</div>
                                    </c:if>
                                    <c:if test="${not empty item.score}">
                                        <div class="badge bg-success mb-3">Finished</div>
                                    </c:if>


                                    <!-- project detail-->
                                    <p class="mb-1" style="display: flex; justify-content: space-between;">
                                    <span class="pe-2 text-nowrap mb-2 d-inline-block">
                                        <i class="mdi mdi-format-list-checks text-muted"></i>
                                        <b>${item.countCorrectQuestion}/${item.totalQuestion}</b> Correct
                                    </span>
                                        <span class="text-nowrap mb-2 d-inline-block">
                                        <i class="uil uil-heart-alt text-muted"></i>
                                            <c:if test="${empty item.score}">
                                                <b>0</b> Points
                                            </c:if>
                                            <c:if test="${not empty item.score}">
                                                <b>${item.score}</b> Points
                                            </c:if>

                                    </span>
                                    </p>
                                    <div style="display: flex; justify-content: space-between;">
                                        <a href="<c:out value="/user-view-question?examID=${item.id}&type=practise&page=1&maxPageItem=5&sortName=questionNo&sortBy=asc"/>"
                                           type="button" class="btn btn-success"
                                           style="min-width: 110px;">Exam</a>
                                        <c:if test="${empty item.score}">
                                            <a type="button" class="btn btn-secondary" style="min-width: 110px;"
                                               disabled>
                                                Review
                                            </a>
                                        </c:if>
                                        <c:if test="${not empty item.score}">
                                            <a type="button" class="btn btn-secondary" style="min-width: 110px;"
                                               href="<c:out value="/user-view-question?examID=${item.id}&type=preview&page=1&maxPageItem=5&sortName=questionNo&sortBy=asc"/>">
                                                Review
                                            </a>
                                        </c:if>
                                    </div>

                                </div> <!-- end card-body-->
                            </div> <!-- end card-->

                        </div> <!-- end col -->

                    </c:forEach>
                </div>

                <!-- end row-->

            </div> <!-- container -->
        </div> <!-- content -->

        <!-- Footer Start -->
        <footer class=" footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <script>
                            document.write(new Date().getFullYear())
                        </script>
                        © FIT - Ho Chi Minh University of Technology and Education
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
<script src="../assets/js/TuViet/disableBTN.js"></script>
<%--<script>--%>
<%--    handleDisable({--%>
<%--        parent: ".card .card-body",--%>
<%--        childStatus: ".badge",--%>
<%--        statusName: {--%>
<%--            UnFinished: 'Unfinished',--%>
<%--            Finished: 'Finished'--%>
<%--        },--%>
<%--        childBtn: ".btn-secondary",--%>
<%--        childBtnClassName: {--%>
<%--            Success: 'bg-success',--%>
<%--            Secondary: 'bg-secondary',--%>
<%--        },--%>
<%--        childBtnSuccess: '.btn-success'--%>
<%--    });--%>
<%--</script>--%>
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