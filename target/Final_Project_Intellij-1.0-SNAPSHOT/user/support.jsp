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
    <title>Support</title>
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

                <li class="side-nav-item">
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
                <br>
                <!-- start page title -->
                <div class="row">
                    <div class="col-sm-4">
                        <a href="<c:out value="/user-home"/> " class="btn btn-danger btn-rounded mb-3"><i class="mdi mdi-plus"></i> Back to your courses</a>
                    </div>
                    <div class="col-12">
                        <div class="page-title-box">
                            <h4 class="page-title">Support</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->
                <div>
                    <div style="text-align: center">
                        <h1>E-School</h1>
                    </div>
                    <br>
                    <div  style="display: flex; justify-content: center;">
                        <div style="width: 60%">
                            <p style="text-align: justify">Welcome to our website E-School. This website is built by Group 01. It's for students, it gives them chances and environment to train themselves with many courses, tests and documents
                                If you are student, this website is good for you. We not only give you environment for studying but also we support you to use this website easier. You can read guide below to understand the website.
                                You can send mail us by sending message through chat box at the homepage.
                            </p>
                        </div>
                    </div>


                    <div style="text-align: center">
                        <img src="<c:url value = "/assets/images/support/chatbox.png"/>" alt="Home page">
                    </div>
                    <div style="margin-left: 150px">
                        <h1>1. Homepage</h1>
                    </div>
                    <div style="display: flex; justify-content: center;">
                        <div style="width: 60%">
                            <p style="text-align: justify">This is the homepage of our website. You can see Login button, chat box.</p>
                            <p style="text-align: justify">You can click Sign In to log in your account with username, password.</p>
                            <p style="text-align: justify">If you want to contact us for supporting or you have some good ideas for us. You can chat at chat box</p>
                        </div>
                    </div>
                    <div style="text-align: center">
                        <img src="<c:url value="/assets/images/support/home.png"/>" width="500px" alt="Home page">
                    </div>
                    <div style="margin-left: 150px">
                        <h1>2. Login</h1>
                    </div>
                    <div style="display: flex; justify-content: center;">
                        <div style="width: 60%">
                            <p style="text-align: justify">This is log in page you have to use username and password to access your account</p>
                            <p style="text-align: justify">If you don't have account, you click sign up to register new account. You fill in your full name, email, username, password and you accept the term and conditions.
                                Then you click Sign Up. Your account will be created.
                            </p>
                        </div>
                    </div>
                    <div style="text-align: center">
                        <img src="<c:url value="/assets/images/support/register_account.png"/>" width="500px" alt="Register">
                    </div>
                    <div style="display: flex; justify-content: center;">
                        <div style="width: 60%">
                            <p style="text-align: justify">You have account then you fill your username, password. Click sign in, you can use account and access your user page.</p>
                        </div>
                    </div>
                    <div style="text-align: center">
                        <img src="<c:url value="/assets/images/support/login.png"/>" width="500px" alt="Login">
                    </div>
                    <div style="margin-left: 150px">
                        <h1>3. Your courses</h1>
                    </div>
                    <div style="display: flex; justify-content: center;">
                        <div style="width: 60%">
                            <p style="text-align: justify">This page you can see all courses you registered. We have a filter on page to check which courses are finished or not easily.</p>
                            <p style="text-align: justify">The image below you can see all your courses.</p>
                        </div>
                    </div>
                    <div style="text-align: center">
                        <img src="<c:url value="/assets/images/support/all_courses.png"/>" width="500px" alt="All_Courses">
                    </div>
                    <div style="display: flex; justify-content: center;">
                        <div style="width: 60%">
                            <p style="text-align: justify">When you click unfinished, the page will appear your courses which you haven't finished.</p>
                        </div>
                    </div>
                    <div style="text-align: center">
                        <img src="<c:url value="/assets/images/support/unfinish_course.png"/>" width="500px" alt="Unfinished_Course">
                    </div>
                    <div style="display: flex; justify-content: center;">
                        <div style="width: 60%">
                            <p style="text-align: justify">When you click finished, the page will appear your courses which you have finished.</p>
                        </div>
                    </div>
                    <div style="text-align: center">
                        <img src="<c:url value="/assets/images/support/finish_courses.png"/>" width="500px" alt="Finished_Course">
                    </div>
                    <div style="margin-left: 150px">
                        <h1>4. Register courses</h1>
                    </div>
                    <div style="display: flex; justify-content: center;">
                        <div style="width: 60%">
                            <p style="text-align: justify">If you want to register new courses. You can click Add Course at homepage of user page (The red button)
                                or click Courses at left side-bar to go to page that you register new courses</p>
                        </div>
                    </div>
                    <div style="text-align: center">
                        <img src="<c:url value="/assets/images/support/all_courses_forcus.png"/>" width="500px" alt="Register_Course_Button">
                    </div>
                    <div style="display: flex; justify-content: center;">
                        <div style="width: 60%">
                            <p style="text-align: justify">In this page you register a new course by clicking "Register" button (The green buttons) then your course
                                you registered will have in your cart. Your cart will appear a number.
                                The number let you know how many courses have in your cart.</p>
                        </div>
                    </div>
                    <div style="text-align: center">
                        <img src="<c:url value="/assets/images/support/cart_number.png"/>" width="500px" alt="Cart_Number_Course_Button">
                    </div>
                    <div style="display: flex; justify-content: center;">
                        <div style="width: 60%">
                            <p style="text-align: justify">In the cart you can add more courses or delete a course and you can see total
                                money you have to pay if you buy all courses in your cart
                                . To access your courses in your cart.
                                You have to pay for it. You can pay by PayPal or Credit Cards</p>
                        </div>

                    </div>
                    <div style="text-align: center">
                        <img src="<c:url value="/assets/images/support/paypal.png"/>" width="500px" alt="PayPal_Button">
                    </div>
                    <div style="margin-left: 150px">
                        <h1>5. Test</h1>
                    </div>
                    <div style="display: flex; justify-content: center;">
                        <div style="width: 60%">
                            <p style="text-align: justify">In your courses that you registered have some tests for you. With tests you can train yourself. You can study some more knowledge.
                                They help you more confident in your test in class or university exam.</p>
                            <p style="text-align: justify">To do tests you click your course you've got. And then there are many tests, you want to test
                                you click "Exam" button so you access the test and you click "Submit" button to finish your test.
                                After that the page will appear your score and number of your correct answer in your test.
                                And your test is finished. You can do it many times</p>
                        </div>
                    </div>
                    <div style="text-align: center">
                        <img src="<c:url value="/assets/images/support/test.png"/>" width="500px" alt="Test_Button">
                    </div>
                    <br>
                    <div style="display: flex; justify-content: center;">
                        <div style="width: 60%">
                            <p style="text-align: justify">This is test page. There are 50 questions you have to do. You can click next or back to go
                                to question you want. If you finish, you click Submit to finish.</p>
                        </div>
                    </div>
                    <div style="text-align: center">
                        <img src="<c:url value="/assets/images/support/practise.png"/>" width="500px" alt="practise">
                    </div>
                    <br>
                    <br>
                    <div style="text-align: center">
                        <img src="<c:url value="/assets/images/support/pratise_submit.png"/>" width="500px" alt="Submit_Button">
                    </div>
                    <br>
                    <div style="display: flex; justify-content: center;">
                        <div style="width: 60%">
                            <p style="text-align: justify">After the test, this is your result.</p>
                        </div>
                    </div>
                    <div style="text-align: center">
                        <img src="<c:url value="/assets/images/support/result.png"/>" width="500px" alt="Result">
                    </div>
                    <div style="display: flex; justify-content: center;">
                        <div style="width: 60%">
                            <p style="text-align: justify">If you want to see all question have in test you finished. You click "Review" button.
                                It will show all question you want, it will let you know that which answer is correct,
                                which is not correct and answer of the question you want.</p>
                        </div>
                    </div>
                    <div style="text-align: center">
                        <img src="<c:url value="/assets/images/support/reviews.png"/>" width="500px" alt="Reviews">
                    </div>
                    <div style="margin-left: 150px">
                        <h1>6. Edit profile</h1>
                    </div>
                    <div style="display: flex; justify-content: center;">
                        <div style="width: 60%">
                            <p style="text-align: justify">You want to edit your profile? That's okay. Click "My account" at the left side-bar.
                                Then it will appear your information and your username, password.</p>
                            <p style="text-align: justify">You modified your infomation then click "Edit" button and finish.</p>
                        </div>
                    </div>
                    <div style="text-align: center">
                        <img src="<c:url value="/assets/images/support/profile.png"/>" width="500px" alt="profile">
                    </div>
                    <br>
                    <div style="text-align: center">
                        <img src="<c:url value="/assets/images/support/edit_pass.png"/>" width="500px" alt="edit_pass">
                    </div>
                    <div style="margin-left: 150px">
                        <h1>7. Logout</h1>
                    </div>
                    <div style="display: flex; justify-content: center;">
                        <div style="width: 60%">
                            <p style="text-align: justify">If you want to log out your account you click Log out button.</p>
                        </div>
                    </div>
                    <div style="text-align: center">
                        <img src="<c:url value="/assets/images/support/logout.png"/>" width="500px" alt="Logout">
                    </div>
                    <br>
                    <!-- end row-->

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