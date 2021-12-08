<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%--<c:url value = ""/>--%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Profile Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description">
    <meta content="Coderthemes" name="author">
    <!-- App favicon -->
    <link rel="shortcut icon" href="../assets/images/title.ico">
    <!-- third party css -->
    <link href="<c:url value = "/assets/css/vendor/jquery-jvectormap-1.2.2.css"/>" rel="stylesheet" type="text/css">
    <!-- third party css end -->

    <!-- App css -->
    <link href="<c:url value = "/assets/css/icons.min.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value = "/assets/css/app.min.css"/>" rel="stylesheet" type="text/css" id="light-style">
    <link href="<c:url value = "/assets/css/app-dark.min.css"/>" rel="stylesheet" type="text/css" id="dark-style">
    <link href="<c:url value = "/assets/css/profile.css"/>" rel="stylesheet" type="text/css">
</head>
<body class="loading" data-layout-config='{"leftSideBarTheme":"dark","layoutBoxed":false, "leftSidebarCondensed":false, "leftSidebarScrollable":false,"darkMode":false, "showRightSidebarOnStart": true}'>
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
        <!-- ---------------------------------------------------------------------------------------------------------------------------- -->

        <!-- Start Content-->
        <div class="container-fluid">
            <c:if test="${not empty message}">
                <c:if test="${alert.equals('success')}">
                    <div id="success" class="alert alert-success alert-dismissible bg-success text-white border-0 fade show text-center" style="z-index: 999; position: fixed; width: auto; right: 0;" role="alert">
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        <strong>Success - </strong> ${message}
                    </div>
                </c:if>
                <c:if test="${alert.equals('error')}">
                    <div id="error" class="alert alert-danger alert-dismissible bg-danger text-white border-0 fade show text-center" style="z-index: 999; position: fixed; width: auto; right: 0;" role="alert">
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        <strong>Error - </strong> ${message}
                    </div>
                </c:if>
            </c:if>

            <div class="row">
                <div class="col-12">
                    <div class="page-title-box">
                        <div class="page-title-right">
                            <ol class="breadcrumb m-0"><%--
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Hyper</a></li>--%>
                                <li class="breadcrumb-item"><a href="<c:url value="/admin-home"/> ">Dashboard</a></li>
                                <li class="breadcrumb-item active">My Profile</li>
                            </ol>
                        </div>
                        <h4 class="page-title">My profile</h4>
                    </div>
                </div>
            </div>



            <div class="row" >
                <div class="col-lg-3">
                    <div class="card card-profile">
                        <div class="card-body card-body-img">
                            <!-- Avatar Extra Large -->
                            <form id="submit-avatar" action="/admin-profile" method="post" class="needs-validation" novalidate>
                                <div class="mt-3 text-center">
                                    <c:if test="${USERMODEL.getUrlAvatar() != null}">
                                        <img id="upload-img" src="${USERMODEL.getUrlAvatar()}" alt="shreyu" class="img-thumbnail avatar-xl rounded-circle" style="width: 200px; height:200px" />
                                    </c:if>
                                    <c:if test="${USERMODEL.getUrlAvatar() == null}">
                                        <img id="upload-img" src="<c:url value = "../assets/images/users/avatar-1.jpg"/>" alt="shreyu" class="img-thumbnail avatar-xl rounded-circle" style="width: 200px; height:200px"/>
                                    </c:if>
                                    <h4>${USERMODEL.getFullname()}</h4>
                                    <div id="div-upload" class="upload-image file btn btn-primary btn-sm mt-1">
                                        Upload
                                        <input class = "input-image" id = "fileupload" accept=".jpg, .jpeg, .png"  type="file">
                                        <input id="urlAvatar" name="urlAvatar" style="display: none" value="">
                                        <input name="action" type="hidden" value="update-avatar">
                                        <!-- <input id="fileUploader"  type="file"/> -->
                                    </div>
                                    <button type="button" id="send" class="btn btn-primary btn-sm mt-1">Save</button>
                                </div>
                            </form>
                        </div> <!-- end card-body-->
                    </div> <!-- end card-->

                </div> <!-- end col-->
                <div class="col-lg-9">
                    <div class="card card-profile">
                        <div class="card-body">
                            <form action="/admin-profile" method="post" class="needs-validation" novalidate>
                                <div class="mb-3">
                                    <label for="fullname" class="form-label">Name</label>
                                    <input name="fullname" id="fullname" type="text" class="form-control" placeholder="Full Name" value="${USERMODEL.getFullname()}" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                                <div class="mb-3 position-relative">
                                    <label for="birthday" class="form-label">Birthdate</label>
                                    <input name="birthday" id="birthday" type="text" class="form-control" value = "${USERMODEL.getBirthday().format(DateTimeFormatter.ofPattern('MM/dd/yyyy'))}" data-provide="datepicker" data-date-container="#datepicker1" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="gender" class="form-label">Gender</label>
                                    <select name="gender" class="form-select" id="gender">
                                        <c:if test="${USERMODEL.getGender().equals('Male') || USERMODEL.getGender() == null}">
                                            <option selected>Male</option>
                                            <option>Female</option>
                                        </c:if>
                                        <c:if test="${USERMODEL.getGender().equals('Female')}">
                                            <option>Male</option>
                                            <option selected>Female</option>
                                        </c:if>

                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label for="phone" class="form-label">Phone</label>
                                    <input name="phone" id="phone" type="text" class="form-control" placeholder="Phone" value="${USERMODEL.getPhone()}" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <input name="email" id="email" type="email" class="form-control" aria-describedby="emailHelp" placeholder="Email"  value="${USERMODEL.getEmail()}" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>

                                <div class="text-center row">
                                    <div class="row-cols-5">
                                        <small id="emailHelp" class="form-text text-muted">Chúng tôi cam kết sẽ không chia sẻ thông tin của bạn đến bất cứ ai.</small><br><br>
                                        <input name="action" type="hidden" value="update-info">
                                        <button class="btn btn-primary"  type="submit">Edit</button>

                                    </div>
                                </div>
                            </form>
                        </div> <!-- end card-body-->
                    </div> <!-- end card-->
                </div> <!-- end col-->
            </div>


            <div class="row">
                <div style="height: 24px;"></div>
            </div>

            <div class="row text-center" >
                <div class="col-12">
                    <div class="page-title-box">
                        <h4 class="page-title">Change password</h4>
                    </div>
                </div>
            </div>

            <form class="needs-validation" action="/admin-profile" method="post" novalidate>
                <div class="row">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4">
                        <div class="card ">
                            <div class="card-body">
                                <div class="mb-3 position-relative" id="datepicker1">
                                    <label  class="form-label" for="old-password">Password</label>
                                    <input type="password" class="form-control" value = "" name="old-password" id="old-password" required>

                                </div>

                                <div class="mb-3">
                                    <label for="newpassword" class="form-label">New passowrd</label>
                                    <input id="newpassword" type="password" class="form-control" value = "" name="new-password" required>
                                </div>

                                <div class="mb-3">
                                    <label for="confirm-password" class="form-label">Confirm password</label>
                                    <input type="password" class="form-control" id="confirm-password"  name="confirm-password" required>

                                </div>

                                <div class="mb-3">
                                    <div class="form-check d-inline-block">
                                        <input type="checkbox" class="form-check-input" name="confirmBox" id="confirm-box"required>
                                        <label class="form-check-label" for="confirm-box">I agree change my password</label>
                                    </div>
                                </div>


                                <div class="text-center row">
                                    <div class="row-cols-8">
                                        <input type="hidden" name="action" value="update-password">
                                        <button class="btn btn-primary"  type="submit">Edit</button>
                                    </div>
                                </div>
                            </div> <!-- end card-body -->
                        </div> <!-- end card-->
                    </div> <!-- end col -->
                </div>
            </form>

        </div>
        <!-- container -->
        <!-- -------------------------------------------------------------------------------------------------------------------------- -->
    </div>
    <!-- content -->

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

<!-- bundle -->
<script src="<c:url value = "../assets/js/vendor.min.js"/>"></script>
<script src="<c:url value = "../assets/js/app.min.js"/>"></script>

<!-- third party js -->
<script src="<c:url value = "../assets/js/vendor/apexcharts.min.js"/>"></script>
<script src="<c:url value = "../assets/js/vendor/jquery-jvectormap-1.2.2.min.js"/>"></script>
<script src="<c:url value = "../assets/js/vendor/jquery-jvectormap-world-mill-en.js"/>"></script>
<!-- third party js ends -->

<!-- demo app -->
<script src="<c:url value = "../assets/js/pages/demo.dashboard.js"/>"></script>
<!-- end demo js-->

<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/7.13.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/7.13.1/firebase-storage.js"></script>


<script>
    $(function(){
        $("#fileupload").change(function(event) {
            var x = URL.createObjectURL(event.target.files[0]);
            $("#upload-img").attr("src",x);
            console.log(event);
        });
    })
</script>
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

    var files = [];
    document.getElementById("fileupload").addEventListener("change", function(e) {
        files = e.target.files;
        for (let i = 0; i < files.length; i++) {
            console.log(files[i]);
        }
    });

    document.getElementById("send").addEventListener("click", function() {
        //checks if files are selected
        if (files.length != 0) {
            //Loops through all the selected files
            for (let i = 0; i < files.length; i++) {
                //create a storage reference
                var storage = firebase.storage().ref(files[i].name);

                //upload file
                var upload = storage.put(files[i]);

                //var storageRef = firebase.storage().ref(imageName);
                var uploadTask = storage.put(files[i]);
                //update progress bar
                upload.on(
                    "state_changed",
                    function progress(snapshot) {

                    },

                    function error(e) {
                        alert(e);
                    },

                    function () {
                        uploadTask.snapshot.ref
                            .getDownloadURL()
                            .then(async function (downloadURL) {
                                document.getElementById("urlAvatar").value = downloadURL;
                                // alert(downloadURL);
                                $("#submit-avatar").submit();
                            });
                    },
                );
            }
        } else {
            location.href = "<c:url value="/admin-profile?message=no_photo_selected&alert=error"/>";
        }
    });

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
</body>
</html>