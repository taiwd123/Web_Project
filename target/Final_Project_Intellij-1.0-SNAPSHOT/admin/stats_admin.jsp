<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/21/2021
  Time: 2:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Stats_Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description">
    <meta content="Coderthemes" name="author">
    <!-- App favicon -->
    <link rel="shortcut icon" href="../assets/images/title.ico">
    <!-- App css -->
    <link href="<c:url value = "../assets/css/icons.min.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value = "../assets/css/app.min.css"/>" rel="stylesheet" type="text/css" id="light-style">
    <link href="<c:url value = "../assets/css/app-dark.min.css"/>" rel="stylesheet" type="text/css" id="dark-style">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>

<body class="loading"
      data-layout-config='{"leftSideBarTheme":"dark","layoutBoxed":false, "leftSidebarCondensed":false, "leftSidebarScrollable":false,"darkMode":false, "showRightSidebarOnStart": true}'>
<!-- Begin page -->
<div class="wrapper">
    <!-- ========== Left Sidebar Start ========== -->
    <div class="leftside-menu">

        <!-- LOGO -->
        <a href="<c:url value="/admin-home"/>" class="logo text-center logo-light">
                    <span class="logo-lg">
                        <img src="<c:url value = "../assets/images/logo.png"/>" alt="" height="16">
                    </span>
            <span class="logo-sm">
                        <img src="<c:url value = "../assets/images/logo_sm.png"/>" alt="" height="16">
                    </span>
        </a>

        <!-- LOGO -->
        <a href="<c:url value="/admin-home"/>" class="logo text-center logo-dark">
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
                    <a href="<c:url value = "/admin-home"/>" class="side-nav-link">
                        <%--                <a href="<c:url value = "apps-calendar.jsp"/>" class="side-nav-link">--%>
                        <i class="uil-graph-bar"></i>
                        <span> Stats </span>
                    </a>
                </li>

                <li class="side-nav-item">
                    <a data-bs-toggle="collapse" href="#sidebarEcommerce" aria-expanded="false"
                       aria-controls="sidebarEcommerce" class="side-nav-link">
                        <i class="uil-layer-group"></i>
                        <span> Manage </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <div class="collapse" id="sidebarEcommerce">
                        <ul class="side-nav-second-level">
                            <li>

                                <a href="<c:url value = "/admin-manager-file"/>">Courses</a>
                            </li>
                            <li>
                                <a href="<c:url value = "/admin/stats-doanh-thu"/>">Revenue</a>
                                <%--                            <a href="<c:url value = "apps-ecommerce-products-details.jsp"/>">Users</a>--%>
                            </li>
                            <li>
                                <a href="<c:url value = "#"/>">Users</a>
                                <%--                            <a href="<c:url value = "apps-ecommerce-products-details.jsp"/>">Users</a>--%>
                            </li>
                        </ul>
                    </div>
                </li>

                <li class="side-nav-item">
                    <a href="<c:url value = "/admin-profile"/>" class="side-nav-link">
                        <i class="uil-user"></i>
                        <span> My account </span>
                    </a>
                </li>

            </ul>

            <!-- End Sidebar -->

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
            <%--<div class="navbar-custom">
                <ul class="list-unstyled topbar-menu float-end mb-0">
                    <li class="dropdown notification-list d-lg-none">
                        <a class="nav-link dropdown-toggle arrow-none" data-bs-toggle="dropdown" href="#" role="button"
                           aria-haspopup="false" aria-expanded="false">
                            <i class="dripicons-search noti-icon"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-animated dropdown-lg p-0">
                            <form class="p-3">
                                <input type="text" class="form-control" placeholder="Search ..."
                                       aria-label="Recipient's username">
                            </form>
                        </div>
                    </li>


                    <li class="dropdown notification-list">
                        <a class="nav-link dropdown-toggle nav-user arrow-none me-0" data-bs-toggle="dropdown" href="#"
                           role="button" aria-haspopup="false" aria-expanded="false">
                                    <span class="account-user-avatar">
                                        <img src="../assets/images/users/avatar-1.jpg" alt="user-image"
                                             class="rounded-circle">
                                    </span><span>
                                        <span class="account-user-name">${USERMODEL.fullname}</span>
                                        <span class="account-position">Admin</span>
                                    </span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end dropdown-menu-animated topbar-dropdown-menu profile-dropdown">
                            <!-- item-->
                            <div class=" dropdown-header noti-title">
                                <h6 class="text-overflow m-0">Welcome !</h6>
                            </div>

                            <!-- item-->
                            <a href="/profile-admin" class="dropdown-item notify-item">
                                <i class="mdi mdi-account-circle me-1"></i>
                                <span>My Account</span>
                            </a>


                            <!-- item-->
                            <a href="<c:url value="/view-login?action=logout"/>" class="dropdown-item notify-item">
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
                            <input type="text" class="form-control dropdown-toggle" placeholder="Search..."
                                   id="top-search">
                            <span class="mdi mdi-magnify search-icon"></span>
                            <button class="input-group-text btn-primary" type="submit">Search</button>
                        </div>
                    </form>
                </div>
            </div>--%>
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
                                        <span class="account-user-name">${USERMODEL.fullname}</span>
                                        <span class="account-position">Admin</span>
                                    </span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end dropdown-menu-animated topbar-dropdown-menu profile-dropdown">
                            <!-- item-->
                            <div class=" dropdown-header noti-title">
                                <h6 class="text-overflow m-0">Welcome !</h6>
                            </div>

                            <!-- item-->
                            <a href="/admin-profile" class="dropdown-item notify-item">
                                <i class="mdi mdi-account-circle me-1"></i>
                                <span>My Account</span>
                            </a>


                            <!-- item-->
                            <a href="<c:url value="/view-login?action=logout"/>" class="dropdown-item notify-item">
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
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0"><%--
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Hyper</a></li>--%>
                                    <li class="breadcrumb-item"><a href="">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Projects</li>
                                </ol>
                            </div>
                            <h4 class="page-title">Projects</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-12">
                        <div class="card widget-inline">
                            <div class="card-body p-0">
                                <div class="row g-0">
                                    <div class="col-sm-6 col-xl-3">
                                        <div class="card shadow-none m-0">
                                            <div class="card-body text-center">
                                                <i class="dripicons-briefcase text-muted" style="font-size: 24px;"></i>
                                                <h3><span>${totalCourse}</span></h3>
                                                <p class="text-muted font-15 mb-0">Total Courses</p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 col-xl-3">
                                        <div class="card shadow-none m-0 border-start">
                                            <div class="card-body text-center">
                                                <i class="dripicons-checklist text-muted" style="font-size: 24px;"></i>
                                                <h3><span>${totalExam}</span></h3>
                                                <p class="text-muted font-15 mb-0">Total Exams</p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 col-xl-3">
                                        <div class="card shadow-none m-0 border-start">
                                            <div class="card-body text-center">
                                                <i class="dripicons-article text-muted" style="font-size: 24px;"></i>
                                                <h3><span>${totalQuestion}</span></h3>
                                                <p class="text-muted font-15 mb-0">Total Questions</p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 col-xl-3">
                                        <div class="card shadow-none m-0 border-start">
                                            <div class="card-body text-center">
                                                <i class="dripicons-user-group text-muted" style="font-size: 24px;"></i>
                                                <h3><span>${totalStudents}</span></h3>
                                                <p class="text-muted font-15 mb-0">Students</p>
                                            </div>
                                        </div>
                                    </div>


                                </div> <!-- end row -->
                            </div>
                        </div> <!-- end card-box-->
                    </div> <!-- end col-->
                </div>
                <!-- end row-->

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title mb-4">Stats</h4>

                                <div dir="ltr">
                                    <div class="mt-3 chartjs-chart" >
                                        <%--                                        <canvas id="task-area-chart" data-bgcolor="#727cf5" data-bordercolor="#727cf5"></canvas>--%>
                                        <canvas id="chart-result" > </canvas>
                                    </div>
                                </div>

                            </div> <!-- end card body-->
                        </div> <!-- end card -->
                    </div><!-- end col-->
                </div>
                <!-- end row-->

            </div> <!-- container -->

        </div> <!-- content -->

        <!-- Footer Start -->
        <footer class="footer">
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


<!-- Right Sidebar -->


<!-- <div class="rightbar-overlay"></div> -->
<!-- /End-bar -->

<!-- bundle -->

<script src="<c:url value = "../assets/js/vendor.min.js"/>"></script>
<script src="<c:url value = "../assets/js/app.min.js"/>"></script>

<!-- third party js -->
<script src="<c:url value = "../assets/js/vendor/Chart.bundle.min.js"/>"></script>
<!-- third party js ends -->

<!-- demo app -->
<script src="<c:url value = "../assets/js/pages/demo.dashboard-projects.js"/>"></script>
<!-- end demo js-->

<script>
    function generateColor() {
        let r = parseInt(Math.random()*255).toString()
        let g = parseInt(Math.random()*255).toString()
        let b = parseInt(Math.random()*255).toString()
        return 'rgba(' + r +',' + g + ',' + b
    }

    function statsChart(id, labels = [], info = []){
        const backgroundcolors = []
        const bordercolors = []
        for (let i = 0; i < info.length; i++){
            let tempcolor = generateColor()
            backgroundcolors.push(tempcolor + ', 0.2)')
            bordercolors.push(tempcolor + ')')
            console.log(tempcolor + ', 0.2)')
        }

        const data = {
            labels: labels,
            datasets: [{
                label: 'THỐNG KÊ SỐ LƯỢNG HỌC SINH ĐĂNG KÍ THEO MÔN',
                data: info,
                backgroundColor: backgroundcolors,
                borderColor: bordercolors,
                borderWidth: 1
            }]
        };

        const config = {
            type: 'bar',
            data: data,
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            },
        };

        let ctx = document.getElementById(id).getContext("2d")
        new Chart(ctx, config)
    }
</script>

<script>
    let courselabels =[], courseInfo = [];
    <c:forEach items="${course.listResult}" var="item">
        courselabels.push("${item.courseName.toString()}")
        courseInfo.push(${item.countRegister})
    </c:forEach>

    window.onload = function () {
        statsChart("chart-result", courselabels, courseInfo)
    }
</script>

</body>
</html>
