<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>File Manager</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description">
    <meta content="Coderthemes" name="author">
    <!-- App favicon -->
    <link rel="shortcut icon" href="../assets/images/title.ico">

    <!-- App css -->
    <link href="../assets/css/icons.min.css" rel="stylesheet" type="text/css">
    <link href="../assets/css/app.min.css" rel="stylesheet" type="text/css" id="light-style">
    <link href="../assets/css/app-dark.min.css" rel="stylesheet" type="text/css" id="dark-style">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-bootstrap-4@5.0.7/bootstrap-4.min.css" type="text/css">

    <style>
        table {
            table-layout: fixed;
        }
        th, td {
            text-align: center;
            padding: 5px 10px;
        }
        thead {
            background: #f9f9f9;
            display: table;
            width: 100%;
            width: calc(100% - 18px);
        }
        tbody {
            height: 260px;
            overflow: auto;
            display: block;
            width: 100%;
        }
        tr {
            display: table;
            width: 100%;
            table-layout: fixed;
        }
        .active{
            display: block;
        }
        @media only screen and (min-width: 920px) {
            .btn-upfile{
                right: 0;
                top: 160px;
                display: flex;
                position: absolute;
            }
            .container-file{
                transform: translate(50%, 200px);
            }
        }
        @media only screen and (min-width: 750px) and (max-width: 919px){
            .container-file{
                transform: translate(50%, 120px);
            }
            .btn-upfile{
                /*                right: 0;
                                top: 160px;*/
                display: flex;
                /*position: absolute;*/
            }
        }
        @media screen and (max-width: 749px) {
            .container-file{
                transform: translate(4%, 120px);
                width: 450px;
            }
        }
    </style>

</head>

<body class="loading" data-layout-config='{"leftSideBarTheme":"dark","layoutBoxed":false, "leftSidebarCondensed":false, "leftSidebarScrollable":false,"darkMode":false, "showRightSidebarOnStart": false}'>
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
        <a href="<c:url value="../index.jsp"/>" class="logo text-center logo-dark">
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
                    <a href="<c:url value = "/admin-home"/>" class="side-nav-link">
                        <%--                <a href="<c:url value = "apps-calendar.jsp"/>" class="side-nav-link">--%>
                        <i class="uil-graph-bar"></i>
                        <span> Stats </span>
                    </a>
                </li>

                <li class="side-nav-item">
                    <a data-bs-toggle="collapse" href="#sidebarEcommerce" aria-expanded="false" aria-controls="sidebarEcommerce" class="side-nav-link">
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
                <c:if test="${not empty messageResponse}">
                    <c:if test="${alert.equals('success')}">
                        <div id="success" class="alert alert-success alert-dismissible bg-success text-white border-0 fade show text-center" style="z-index: 999; position: fixed; width: auto; right: 0;" role="alert">
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            <strong>Success - </strong> ${messageResponse}
                        </div>
                    </c:if>
                    <c:if test="${alert.equals('danger')}">
                        <div id="error" class="alert alert-danger alert-dismissible bg-danger text-white border-0 fade show text-center" style="z-index: 999; position: fixed; width: auto; right: 0;" role="alert">
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            <strong>Error - </strong> ${messageResponse}
                        </div>
                    </c:if>
                </c:if>
                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <h4 class="page-title">File Manager</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">

                    <!-- Right Sidebar -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <!-- End Left sidebar -->
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="app-search">
                                        <form>
                                            <div class="mb-2 position-relative">
                                                <input type="text" class="form-control" placeholder="Search files...">
                                                <span class="mdi mdi-magnify search-icon"></span>
                                            </div>
                                        </form>
                                    </div>
                                    <div>
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb mb-0">
                                                <li class="breadcrumb-item"><a href="<c:url value="/admin-home"/> ">Dashboard</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">Manager Courses</li>
                                            </ol>
                                        </nav>
                                    </div>
                                </div>

                                <div class="mt-3">
                                    <div class="page-title-box" style="display: flex; align-items: center">
                                        <h4 class="page-title">Courses</h4>
                                        <button  class="btn btn-success Add-course" style="margin-left: 8px"><i class="uil uil-scenery me-1"></i>Add Course</button>
                                    </div>
                                    <table class="table table-striped table-centered mb-0">
                                        <thead>
                                        <tr>
                                            <th>Course ID</th>
                                            <th>Course Name</th>
                                            <th>Description</th>
                                            <th>Price</th>
                                            <%--<th>Update</th>
                                            <th>Admin Name</th>--%>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${list}" var="item">
                                            <tr>
                                                <td>${item.id}</td>
                                                <td class="table-user">
                                                    <div class="row align-items-center" style="justify-content: center">
                                                        <div class="col-auto">
                                                            <img src="${item.courseImage}" alt=""  class="img-fluid avatar-sm">
                                                            <span>${item.courseName}</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>${item.description}</td>
                                                <td>${item.price}</td>
                                                <td class="table-action" style="display: flex;justify-content: center">
                                                    <div class="rightbar-overlay " id ="update-course${item.id}" onclick="hiddenForm('#update-course${item.id}')" style=" background-color: rgba(0,0,0,0.05); opacity: 1;">
                                                        <div class="course-upload col-md-4" style="position: fixed;transform: translate(50%, 0); color: #6c757d; background-color: #FFF;padding: 40px 0; border-radius: 4px;">
                                                            <form class="needs-validation col-md-6" novalidate style="transform: translate(50%, 0);" method="post" action="/admin-manager-file?action=updateCourse">
                                                                <input type="hidden" name="id" value="${item.id}">
                                                                <div class="mb-0">
                                                                    <label class="form-label" for="validationCustom03" style="float:left;">Course Name</label>
                                                                    <input type="text" class="form-control" id="validationCustom03" value="${item.courseName}" placeholder="Course Name" required name = "courseName">
                                                                    <div class="valid-feedback">
                                                                        Looks good!
                                                                    </div>
                                                                </div>
                                                                <div class="mb-0">
                                                                    <label class="form-label" for="validationCustom04" style="margin-top: 16px;float:left;">Description</label>
                                                                    <input type="text" class="form-control" id="validationCustom04"value="${item.description}" placeholder="Description" required name="description">
                                                                    <div class="valid-feedback">
                                                                        Looks good!
                                                                    </div>
                                                                </div>
                                                                <div class="mb-0">
                                                                    <label class="form-label" for="validationCustom05" style="margin-top: 16px;float:left;">Price</label>
                                                                    <input type="text" class="form-control" id="validationCustom05"value="${item.price}" placeholder="Price" required name="price">
                                                                    <div class="valid-feedback">
                                                                        Looks good!
                                                                    </div>
                                                                </div>
                                                                <div style="margin-top: 16px; display: flex; align-items: flex-start;flex-direction: column">
                                                                    <label class="form-label" for="validationCustom02">Course Image: </label>
                                                                    <div id="update-image-grid${item.id}" >
                                                                    </div>
                                                                    <div style="display: flex; justify-content: center; align-items: center">
                                                                        <button type="button" class="btn btn-success btn-sm update-swalDefaultSuccess"
                                                                                onclick="upload('update-urlImage${item.id}')" id ="update-send${item.id}">Upload</button>
                                                                        <input type="file" id="update-file-uploader${item.id}" onclick="savefiles('update-file-uploader${item.id}')" accept=".jpg, .jpeg, .png" style="margin: 16px 8px;">
                                                                    </div>
                                                                    <input type="hidden" id="update-urlImage${item.id}" name ="courseImage" value="${item.courseImage}">

                                                                </div>
                                                                <div class="mb-0" style="display: flex">
                                                                    <button type="button" id = "update-cancel-course${item.id}" onclick="hiddenCancel('#update-course${item.id}','#update-image-grid${item.id}')" class="btn btn-danger" style="margin-right: 4px;min-width: 100px">Cancel</button>
                                                                    <button class="btn btn-success" type="submit" style="min-width: 100px;">Submit</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <button type="button" class="action-icon update-course${item.id}" style="border-radius: 50%; margin-right: 8px" onclick="addActive('#update-course${item.id}')"><i class="mdi mdi-pencil"></i></button>
                                                    <form action="/admin-manager-file?action=deleteCourse" method="post">
                                                        <input type="hidden" name="id" value="${item.id}">
                                                        <input type="hidden" name="courseName" value="${item.courseName}">
                                                        <input type="hidden" name="courseImage" value="${item.courseImage}">
                                                        <input type="hidden" name="description" value="${item.description}">
                                                        <button type="submit" class="action-icon" style="border-radius: 50%"><i class="mdi mdi-delete"></i></button>
                                                    </form>

                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="mt-3">
                                    <div class="page-title-box" style="display:flex; align-items: center">
                                        <h4 class="page-title">File Exam</h4>
                                        <button  class="btn btn-success Add-exam" style="margin-left: 8px"><i class="mdi mdi-file-plus-outline me-1"></i>Add Exam</button>
                                    </div>
                                    <table class="table table-striped table-centered mb-0">
                                        <thead>
                                        <tr>
                                            <th>File ID</th>
                                            <th>Course Name</th>
                                            <th>Exam Name</th>
                                            <th>Action</th>
                                            <th>File Check</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${requestScope.listExam}" var="exam">
                                            <tr>
                                                <td>${exam.id}</td>
                                                <td>${exam.course.courseName}</td>
                                                <td>
                                                        ${exam.examName}
                                                </td>

                                                <td class="table-action" style="display: flex; justify-content: center">
                                                    <div class="rightbar-overlay" id ="file${exam.id}" onclick="hiddenForm('#file${exam.id}')" style=" background-color: rgba(0,0,0,0.05); opacity: 1;">
                                                        <div class="course-upload col-md-4" style="position: fixed;transform: translate(50%, 50%); color: #6c757d; background-color: #FFF;padding: 40px 0; border-radius: 4px;">
                                                            <form class="needs-validation col-md-6" novalidate enctype="multipart/form-data" style="transform: translate(50%, 0);" method="post" action="/QuestionController?action=insertFile">
                                                                <div style="margin-top: 16px; display: flex; align-items: flex-start;flex-direction: column">
                                                                    <label class="form-label">Insert Exam: </label>
                                                                    <div style="display: flex; justify-content: center; align-items: center">
                                                                        <input type="file" name="file-exam" id="upload-file${exam.id}"  accept=".xlsx" style="margin: 16px 0;">
                                                                    </div>
                                                                </div>
                                                                <input type="hidden" name="id" value="${exam.id}">
                                                                <input type="hidden" name="examName" value="${exam.examName}">
                                                                <input type="hidden" name="courseID" value="${exam.course.id}">
                                                                <input type="hidden" name="fileCheck" value="true">
                                                                <div class="mb-0" style="display: flex">
                                                                    <button type="button" id = "cancel-file${exam.id}" onclick="hiddenCancel('#file${exam.id}','#upload-file${exam.id}')" class="btn btn-danger" style="margin-right: 4px;min-width: 100px">Cancel</button>
                                                                    <button class="btn btn-success" type="submit" style="min-width: 100px;">Submit</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <button type="button" class="action-icon insert-file" onclick="addActive('#file${exam.id}')"  style="border-radius: 50%; margin-right: 4px" ><i class="mdi mdi-plus"></i></button>
                                                    <form action="/QuestionController?action=deleteFile" method="post">
                                                        <input type="hidden" name="id" value="${exam.id}">
                                                        <input type="hidden" name="examName" value="${exam.examName}">
                                                        <input type="hidden" name="courseID" value="${exam.course.id}">
                                                        <input type="hidden" name="fileCheck" value="${exam.fileCheck}">
                                                        <button type="submit" class="action-icon" style="border-radius: 50%;margin-left: 4px"><i class="mdi mdi-delete"></i></button>
                                                    </form>
                                                </td>
                                                <td>
                                                    <c:if test="${exam.fileCheck.trim() == 'true'}">
                                                        <i class="action-icon uil  uil-file-check"></i>
                                                    </c:if>
                                                    <c:if test="${exam.fileCheck.trim() == 'false'}">
                                                        <i class="action-icon uil  uil-file-times"></i>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                        </tbody>
                                    </table>

                                </div> <!-- end .mt-3-->
                                <div class="mt-3">
                                    <div class="page-title-box" style="display:flex; align-items: center">
                                        <h4 class="page-title">Documents</h4>
                                        <button  class="btn btn-success Add-document" style="margin-left: 8px"><i class="mdi mdi-file-plus-outline me-1"></i>Add Document</button>
                                    </div>
                                    <table class="table table-striped table-centered mb-0">
                                        <thead>
                                        <tr>
                                            <th>Document ID</th>
                                            <th>Document Name</th>
                                            <th>Course Name</th>
                                            <th>Document Link</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${requestScope.listDocument}" var="document">
                                            <tr>
                                                <td>${document.id}</td>
                                                <td>${document.documentName}</td>
                                                <td>
                                                        ${document.course.courseName}
                                                </td>
                                                <td>${document.documentLink}</td>
                                                <td class="table-action">
                                                    <div class="rightbar-overlay" id ="update-document${document.id}" onclick="hiddenForm('#update-document${document.id}')" style=" background-color: rgba(0,0,0,0.05); opacity: 1;">
                                                        <div class="course-upload col-md-4" style="position: fixed;transform: translate(50%, 0); color: #6c757d; background-color: #FFF;padding: 40px 0; border-radius: 4px;">
                                                            <form class="needs-validation col-md-6" novalidate style="transform: translate(50%, 0);" method="post" action="/admin-manager-file?action=updateDocument">
                                                                <input type="hidden" name="id" value="${document.id}">
                                                                <div class="mb-0">
                                                                    <label class="form-label" for="validationCustom08" style="float:left;">Document Name</label>
                                                                    <input type="text" class="form-control" id="validationCustom08" value="${document.documentName}" placeholder="Document Name" required name = "documentName">
                                                                    <div class="valid-feedback">
                                                                        Looks good!
                                                                    </div>
                                                                </div>
                                                                <div class="mb-0">
                                                                    <label class="form-label" for="validationCustom09" style="margin-top: 16px;float:left;">Course Name</label>
                                                                    <input type="text" class="form-control" id="validationCustom09"value="${document.course.courseName}" placeholder="Course Name" required name="courseName">
                                                                    <div class="valid-feedback">
                                                                        Looks good!
                                                                    </div>
                                                                </div>
                                                                <div class="mb-0">
                                                                    <label class="form-label" for="validationCustom010" style="margin-top: 16px;float:left;">Document Link</label>
                                                                    <input type="text" class="form-control" id="validationCustom010"value="${document.documentLink}" placeholder="Document Link" required name="documentLink">
                                                                    <div class="valid-feedback">
                                                                        Looks good!
                                                                    </div>
                                                                </div>
                                                                <div class="mb-0">
                                                                    <select name="courseID" required style="border-radius: 3px; width: 100%; height: 36px;margin: 16px 0">
                                                                        <option value="" selected disabled hidden>Choose Course</option>
                                                                        <c:forEach items="${list}" var="item">
                                                                            <option value="${item.id}" style="border-radius: 3px; max-height: 38px">${item.courseName}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                                <div class="mb-0" style="display: flex">
                                                                    <button type="button" id = "update-cancel-course${document.id}"
                                                                            onclick="hiddenCancel('#update-document${document.id}')"
                                                                            class="btn btn-danger" style="margin-right: 4px;min-width: 100px">Cancel</button>
                                                                    <button class="btn btn-success" type="submit" style="min-width: 100px;">Submit</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <button type="button" class="action-icon" style="border-radius: 50%; margin-bottom: 4px" onclick="addActive('#update-document${document.id}')"><i class="mdi mdi-pencil"></i></button>
                                                    <form action="/admin-manager-file?action=deleteDocument" method="post">
                                                        <input type="hidden" name="id" value="${document.id}">
                                                        <input type="hidden" name="documentName" value="${document.documentName}">
                                                        <input type="hidden" name="courseName" value="${document.course.courseName}">
                                                        <input type="hidden" name="documentLink" value="${document.documentLink}">
                                                        <button type="submit" class="action-icon" style="border-radius: 50%; margin-top: 4px"><i class="mdi mdi-delete"></i></button>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div> <!-- end .mt-3-->
                            </div>
                            <!-- end card-body -->
                            <div class="clearfix"></div>
                        </div> <!-- end card-box -->

                    </div> <!-- end Col -->
                </div><!-- End row -->

            </div> <!-- container -->

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

    </div>

    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->


</div>
<!-- END wrapper -->


<!-- Right Sidebar -->
<div class="end-bar">

    <div class="rightbar-title">
        <a href="javascript:void(0);" class="end-bar-toggle float-end">
            <i class="dripicons-cross noti-icon"></i>
        </a>
        <h5 class="m-0">Settings</h5>
    </div>

    <div class="rightbar-content h-100" data-simplebar="">

        <div class="p-3">
            <div class="alert alert-warning" role="alert">
                <strong>Customize </strong> the overall color scheme, sidebar menu, etc.
            </div>

            <!-- Settings -->
            <h5 class="mt-3">Color Scheme</h5>
            <hr class="mt-1">

            <div class="form-check form-switch mb-1">
                <input class="form-check-input" type="checkbox" name="color-scheme-mode" value="light" id="light-mode-check" checked="">
                <label class="form-check-label" for="light-mode-check">Light Mode</label>
            </div>

            <div class="form-check form-switch mb-1">
                <input class="form-check-input" type="checkbox" name="color-scheme-mode" value="dark" id="dark-mode-check">
                <label class="form-check-label" for="dark-mode-check">Dark Mode</label>
            </div>


            <!-- Width -->
            <h5 class="mt-4">Width</h5>
            <hr class="mt-1">
            <div class="form-check form-switch mb-1">
                <input class="form-check-input" type="checkbox" name="width" value="fluid" id="fluid-check" checked="">
                <label class="form-check-label" for="fluid-check">Fluid</label>
            </div>

            <div class="form-check form-switch mb-1">
                <input class="form-check-input" type="checkbox" name="width" value="boxed" id="boxed-check">
                <label class="form-check-label" for="boxed-check">Boxed</label>
            </div>


            <!-- Left Sidebar-->
            <h5 class="mt-4">Left Sidebar</h5>
            <hr class="mt-1">
            <div class="form-check form-switch mb-1">
                <input class="form-check-input" type="checkbox" name="theme" value="default" id="default-check">
                <label class="form-check-label" for="default-check">Default</label>
            </div>

            <div class="form-check form-switch mb-1">
                <input class="form-check-input" type="checkbox" name="theme" value="light" id="light-check" checked="">
                <label class="form-check-label" for="light-check">Light</label>
            </div>

            <div class="form-check form-switch mb-3">
                <input class="form-check-input" type="checkbox" name="theme" value="dark" id="dark-check">
                <label class="form-check-label" for="dark-check">Dark</label>
            </div>

            <div class="form-check form-switch mb-1">
                <input class="form-check-input" type="checkbox" name="compact" value="fixed" id="fixed-check" checked="">
                <label class="form-check-label" for="fixed-check">Fixed</label>
            </div>

            <div class="form-check form-switch mb-1">
                <input class="form-check-input" type="checkbox" name="compact" value="condensed" id="condensed-check">
                <label class="form-check-label" for="condensed-check">Condensed</label>
            </div>

            <div class="form-check form-switch mb-1">
                <input class="form-check-input" type="checkbox" name="compact" value="scrollable" id="scrollable-check">
                <label class="form-check-label" for="scrollable-check">Scrollable</label>
            </div>

            <div class="d-grid mt-4">
                <button class="btn btn-primary" id="resetBtn">Reset to Default</button>

                <a href="../../product/hyper-responsive-admin-dashboard-template/index.htm" class="btn btn-danger mt-3" target="_blank"><i class="mdi mdi-basket me-1"></i> Purchase Now</a>
            </div>
        </div> <!-- end padding-->

    </div>
</div>


<!-- =====================course============================= -->
<div class="rightbar-overlay " id ="course" onclick="hiddenForm('#course')" style=" background-color: rgba(0,0,0,0.5); opacity: 1;">
    <div class="course-upload col-md-4" style="position: fixed;transform: translate(100%, 100px); color: #6c757d; background-color: #FFF;padding: 40px 0; border-radius: 4px;">
        <form class="needs-validation col-md-6" novalidate style="transform: translate(50%, 0);" method="post" action="/admin-manager-file?action=insertCourse">
            <div class="mb-0">
                <label class="form-label" for="validationCustom01">Course Name</label>
                <input type="text" class="form-control" id="validationCustom01" placeholder="Course Name" required name = "courseName">
                <div class="valid-feedback">
                    Looks good!
                </div>
            </div>
            <div class="mb-0">
                <label class="form-label" for="validationCustom02" style="margin-top: 16px;">Description</label>
                <input type="text" class="form-control" id="validationCustom02" placeholder="Description" required name="description">
                <div class="valid-feedback">
                    Looks good!
                </div>
            </div>
            <div class="mb-0">
                <label class="form-label" for="validationCustom10" style="margin-top: 16px;">Price</label>
                <input type="text" class="form-control" id="validationCustom10" placeholder="Price" required name="price">
                <div class="valid-feedback">
                    Looks good!
                </div>
            </div>
            <div style="margin-top: 16px; ">
                <label class="form-label" for="validationCustom02">Course Image: </label>
                <div id="image-grid" >
                </div>
                <div style="display: flex; justify-content: center; align-items: center">
                    <button type="button" class="btn btn-success btn-sm swalDefaultSuccess" id ="send">Upload</button>
                    <input type="file" id="file-uploader" accept=".jpg, .jpeg, .png" style="margin: 16px 8px;">
                </div>
                <input type="hidden" id="urlImage" name ="courseImage" value="">

            </div>
            <div class="mb-0">
                <button type="button" id = "cancel-course" class="btn btn-danger" style="margin-right: 8px;min-width: 120px">Cancel</button>
                <button class="btn btn-success" type="submit" style="min-width: 120px;">Submit form</button>
            </div>
        </form>
    </div>
</div>

<!-- =====================EXAM============================= -->
<div class="rightbar-overlay " id ="exam" onclick="hiddenForm('#exam')" style=" background-color: rgba(0,0,0,0.5); opacity: 1;">
    <div class="course-upload col-md-4" style="position: fixed;transform: translate(100%, 200px); color: #6c757d; background-color: #FFF;padding: 40px 0; border-radius: 4px;">
        <form class="needs-validation col-md-6" novalidate style="transform: translate(50%, 0);" method="post" action="/admin-manager-file?action=insertExam">
            <div class="mb-0">
                <label class="form-label" for="validationCustom5">Exam Name</label>
                <input type="text" class="form-control" id="validationCustom5" placeholder="Exam Name" required name = "examName">
                <div class="valid-feedback">
                    Looks good!
                </div>
            </div>
            <div class="mb-0">
                <select name="courseID" id = "" required style="border-radius: 3px; width: 100%; height: 36px;margin: 16px 0">
                    <option value="" selected disabled hidden>Choose Course</option>
                    <c:forEach items="${list}" var="item">
                        <option value="${item.id}" style="border-radius: 3px; max-height: 38px">${item.courseName}</option>
                    </c:forEach>
                </select>
            </div>
            <input type="hidden" name="fileCheck" value="false">
            <div class="mb-0">
                <button type="button" id = "cancel-exam" class="btn btn-danger" style="margin-right: 8px;min-width: 120px">Cancel</button>
                <button class="btn btn-success" type="submit" style="min-width: 120px;">Submit form</button>
            </div>
        </form>
    </div>
</div>
<!-- =====================Document============================= -->
<div class="rightbar-overlay " id ="document" onclick="hiddenForm('#document')" style=" background-color: rgba(0,0,0,0.5); opacity: 1;">
    <div class="course-upload col-md-4" style="position: fixed;transform: translate(100%, 50%); color: #6c757d; background-color: #FFF;padding: 40px 0; border-radius: 4px;">
        <form class="needs-validation col-md-6" novalidate style="transform: translate(50%, 0);" method="post" action="/admin-manager-file?action=insertDocument">
            <div class="mb-0">
                <label class="form-label" for="validationCustom06">Document Name</label>
                <input type="text" class="form-control" id="validationCustom06" placeholder="Document Name" required name = "documentName">
                <div class="valid-feedback">
                    Looks good!
                </div>
            </div>
            <div class="mb-0">
                <label class="form-label" for="validationCustom07" style="margin-top: 16px;">Document Link</label>
                <input type="text" class="form-control" id="validationCustom07" placeholder="Document link" required name="documentLink">
                <div class="valid-feedback">
                    Looks good!
                </div>
            </div>
            <div class="mb-0">
                <select name="courseID" required style="border-radius: 3px; width: 100%; height: 36px;margin: 16px 0">
                    <option value="" selected disabled hidden>Choose Course</option>
                    <c:forEach items="${list}" var="item">
                        <option value="${item.id}" style="border-radius: 3px; max-height: 38px">${item.courseName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-0">
                <button type="button" id = "cancel-document" class="btn btn-danger" style="margin-right: 8px;min-width: 120px">Cancel</button>
                <button class="btn btn-success" type="submit" style="min-width: 120px;">Submit form</button>
            </div>
        </form>
    </div>
</div>

<!-- /End-bar -->
<script src="../assets/js/TuViet/handlerInForm.js"></script>
<script src="../assets/js/TuViet/upFirebase.js"></script>
<script src="../assets/js/TuViet/handler.js"></script>
<script src="../assets/js/TuViet/loadImage.js"></script>
<script src="../assets/js/TuViet/notification.js"></script>
<script src="../assets/js/sweetalert/sweetalert2.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
    handle('.Add-course', '#course');
    // handle('.insert-file', '#file');
    handle('.Add-exam', '#exam');
    handle('.Add-document','#document')
    Cancel('#cancel-course', '#course','#image-grid');
    // Cancel('#cancel-file', '#file','#file-previews')
    Cancel('#cancel-exam','#exam')
    Cancel('#cancel-document','#document')
</script>
<script>
    loadImage('file-uploader','image-grid');
</script>
<script>
    thongBao('.swalDefaultSuccess');
    thongBao('.update-swalDefaultSuccess');
</script>

<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/7.13.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/7.13.1/firebase-storage.js"></script>

<!--    Firebase     -->
<script>
    // Your web app's Firebase configuration
    var firebaseConfig = {
        apiKey: "AIzaSyCwkMP895Ak3eTpUQ8VmGHEW8xpvE62fIg",
        authDomain: "project-web-e7691.firebaseapp.com",
        projectId: "project-web-e7691",
        storageBucket: "project-web-e7691.appspot.com",
        messagingSenderId: "933906876365",
        appId: "1:933906876365:web:eb658f73c17ab55676e684"
    };
    // Initialize Firebase
    firebase.initializeApp(firebaseConfig);
</script>

<script>
    uploadFirebase('file-uploader', 'send','urlImage')
    // uploadFirebase('update-file-uploader', 'update-send','update-urlImage')
</script>

<script>
    $(function() {
        var Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000
        });
        $('.swalDefaultSuccess').click(function() {
            setTimeout(function(){
                Toast.fire({
                    icon: 'success',
                    title: 'Tải hình ảnh lên thành công'
                })
            }, 1000);
        });
        $('#urlAvatar').change(function() {
            Toast.fire({
                icon: 'success',
                title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
            })
        })
    });
</script>
<script>
    $("#success").fadeOut(5000);
</script>
<script>
    $("#error").fadeOut(5000);
</script>



<!-- bundle -->
<script src="../assets/js/vendor.min.js"></script>
<script src="../assets/js/app.min.js"></script>
<!-- plugin js -->
<script src="../assets/js/vendor/dropzone.min.js"></script>
<!-- init js -->
<script src="../assets/js/ui/component.fileupload.js"></script>

</body>

</html>