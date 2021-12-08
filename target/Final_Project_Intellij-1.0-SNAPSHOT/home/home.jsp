<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 10/21/2021
  Time: 10:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-school</title>
    <!-- Start of Async Drift Code -->
    <!-- App favicon -->
    <link rel="shortcut icon" href="../assets/images/title.ico">
    <script>
        "use strict";
        !function () {
            var t = window.driftt = window.drift = window.driftt || [];
            if (!t.init) {
                if (t.invoked) return void (window.console && console.error && console.error("Drift snippet included twice."));
                t.invoked = !0, t.methods = ["identify", "config", "track", "reset", "debug", "show", "ping", "page", "hide", "off", "on"],
                    t.factory = function (e) {
                        return function () {
                            var n = Array.prototype.slice.call(arguments);
                            return n.unshift(e), t.push(n), t;
                        };
                    }, t.methods.forEach(function (e) {
                    t[e] = t.factory(e);
                }), t.load = function (t) {
                    var e = 3e5, n = Math.ceil(new Date() / e) * e, o = document.createElement("script");
                    o.type = "text/javascript", o.async = !0, o.crossorigin = "anonymous", o.src = "https://js.driftt.com/include/" + n + "/" + t + ".js";
                    var i = document.getElementsByTagName("script")[0];
                    i.parentNode.insertBefore(o, i);
                };
            }
        }();
        drift.SNIPPET_VERSION = '0.3.1';
        drift.load('wmz4u3g3tu75');
    </script>
    <!-- End of Async Drift Code -->

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="<c:url value = "/home/assets/css/style.css"/>">
    <link rel="stylesheet" href="<c:url value = "/home/assets/font/fontawesome-free-5.15.3-web/css/all.min.css"/>">
    <link rel="stylesheet" href="<c:url value = "/home/assets/css/owl.carousel.min.css"/>">
    <link rel="stylesheet" href="<c:url value = "/home/assets/css/owl.theme.default.min.css"/>">
</head>
<body>
<!--
===================
    NAVIGATION
===================
-->
<header class="nav-scroll fixed-top mh-xss-mobile-nav">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand" href="#">
                <img src="<c:url value = "/home/assets/images/logo.svg"/>" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#course">Course</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#others">Others</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#review">Review</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-btn" href="/view-login?action=login">Sign In</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</header>
<!--
==============
    HOME
==============
-->
<section class="header-section d-flex align-items-center">
    <div class="container">
        <div class="row">
            <div class="col-lg-5 col-md-12">
                <div class="header-details">
                    <h6>Are you ready to Learn?</h6>
                    <h1>Learn With fun <br> on <span>any schedule</span></h1>
                    <p>Build skills, get high scores in exam with courses, test online on our website.</p>
                    <a class="get-btn btn-get" href="/view-login?action=login">Get Started</a>
                </div>
            </div>
            <div class="col-lg-6 col-md-12 ml-auto">
                <div class="header-image">
                    <img src="<c:url value = "/home/assets/images/picture/header-image.png"/>" alt="" class="img-fluid">
                </div>
            </div>
        </div>
    </div>
</section>
<!--
==============
    Cards
==============
-->
<section class="cards-section sec-padding">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-lg-3 col-sm-6">
                <div class="cards-inner">

                    <img src="<c:url value = "/home/assets/images/icon/book.png"/>" alt="" class="img-fluid">
                    <h5>5+ Topic</h5>
                    <p>Learn Anythings</p>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 col-sm-6">
                <div class="cards-inner">
                    <img src="<c:url value = "/home/assets/images/icon/students-icon-2.png"/>" alt="" class="img-fluid">
                    <h5>1800+ Students</h5>
                    <p>Learn Anythings</p>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 col-sm-6">
                <div class="cards-inner">
                    <img src="<c:url value = "/home/assets/images/icon/paper.png"/>" alt="" class="img-fluid">
                    <h5>30+ Test Token</h5>
                    <p>Learn Anythings</p>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 col-sm-6">
                <div class="cards-inner">
                    <img src="<c:url value = "/home/assets/images/icon/student-icon.png"/>" alt="" class="img-fluid">


                    <p>Learn Anythings</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!--
==============
    Course
==============
-->
<section class="course-section sec-padding" id="course">
    <div class="container">
        <h2 class="text-center title-text">Online Courses</h2>
        <div class="card-deck">
            <div class="card">
                <img src="<c:url value = "/home/assets/images/picture/card-1.png"/>" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Math</h5>
                    <p class="card-text">Science</p>

                </div>
                <div class="card-footer">
                    <div class="d-flex justify-content-between">
                        <div class="date d-flex">
                            <img src="<c:url value = "/home/assets/images/icon/calendar.png"/>" alt="">
                            <h6>Start 20 April, 2021</h6>
                        </div>
                        <div class="date d-flex">
                            <img src="<c:url value = "/home/assets/images/icon/people.png"/>" alt="">
                            <h6>60 seats</h6>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <img src="<c:url value = "/home/assets/images/picture/card-2.png"/>" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Physics</h5>
                    <p class="card-text">Science</p>

                </div>
                <div class="card-footer">
                    <div class="d-flex justify-content-between">
                        <div class="date d-flex">
                            <img src="<c:url value = "/home/assets/images/icon/calendar.png"/>" alt="">
                            <h6>Start 20 April, 2021</h6>
                        </div>
                        <div class="date d-flex">
                            <img src="<c:url value = "/home/assets/images/icon/people.png"/>" alt="">
                            <h6>60 seats</h6>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <img src="<c:url value = "/home/assets/images/picture/card-3.png"/>" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Chemistry</h5>
                    <p class="card-text">Science</p>

                </div>
                <div class="card-footer">
                    <div class="d-flex justify-content-between">
                        <div class="date d-flex">
                            <img src="<c:url value = "/home/assets/images/icon/calendar.png"/>" alt="">
                            <h6>Start 20 April, 2021</h6>
                        </div>
                        <div class="date d-flex">
                            <img src="<c:url value = "/home/assets/images/icon/people.png"/>" alt="">
                            <h6>60 seats</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--
==============
    Video
==============
-->
<section class="video-section sec-padding" id="others">
    <div class="container">
        <div class="row">
            <div class="col-md-5 d-flex align-items-center">
                <div class="video-details">
                    <h2>Helping people grow their careers, every day!</h2>
                    <p>We can help you with a college exam
                        with the best results with dozens of courses, tests with answers completely free on our website.</p>
                    <!-- <button class="get-btn">Start Learning</button>  -->
                </div>
            </div>
            <div class="col-md-6 ml-auto">
                <div class="video-image">
                    <img src="<c:url value = "/home/assets/images/picture/stuednt-video.jpg"/>" alt=""
                         class="img-fluid">
                    <a href="https://www.youtube.com/watch?v=QuG6TSiSgaA" target="_blank">
                        <div class="video-icon">
                            <img src="<c:url value = "/home/assets/images/icon/play.png"/>" alt="">
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>
<!--
==============
    Top Reivew
==============
-->
<section class="testimonial-section sec-padding" id="review">
    <div class="container">
        <h2 class="text-center title-text">Top Review</h2>
        <div class="row">
            <div class="col-md-9 mx-auto pb-5">
                <div class="testimonial-inner d-lg-flex justify-content-between">
                    <img src="<c:url value = "/home/assets/images/picture/man.png"/>" alt="" class="img-fluid">
                    <p>There are many courses of E-School available, they are useful for me.
                        They helped me to learning knowledge, I have chances to train by myself
                        with many tests and courses in E-School.
                        So I am very confident in my upcoming university exam. I'll recommend this website to my friends.
                        Thanks a lot E-School.
                    </p>
                </div>
            </div>
        </div>

        <div class="owl-carousel owl-theme">
            <div class="item">
                <div class="top-review__user-item">
                    <div class="user-info">
                        <div class="user-info__avatar">
                            <img src="<c:url value = "/home/assets/images/picture/student1.jpg"/>" alt="avarta">
                        </div>

                        <div class="user-info__body">
                            <div>
                                <h4 class="user-info__body-name">Ân</h4>
                            </div>
                            <ul class="user-info__body-rank">
                                <li class="user-info__body-rank-star">
                                    <i class="fas fa-star"></i>
                                </li>
                                <li class="user-info__body-rank-star">
                                    <i class="fas fa-star"></i>
                                </li>
                                <li class="user-info__body-rank-star">
                                    <i class="fas fa-star"></i>
                                </li>
                                <li class="user-info__body-rank-star">
                                    <i class="fas fa-star"></i>
                                </li>
                                <li class="user-info__body-rank-star">
                                    <i class="fas fa-star"></i>
                                </li>
                            </ul>
                            <p class="user-info__body-comment">This website is useful for me. It helped me to pass the
                                college exam. Thanks!</p>
                            <h5 class="user-info__body-city">Đà Nẵng</h5>
                        </div>
                    </div>
                </div>
            </div>

            <div class="item">
                <div class="top-review__user-item">
                    <div class="user-info">
                        <div class="user-info__avatar">
                            <img src="<c:url value = "/home/assets/images/picture/student1.jpg"/>" alt="avarta">
                        </div>

                        <div class="user-info__body">
                            <div>
                                <h4 class="user-info__body-name">Tín</h4>
                            </div>
                            <ul class="user-info__body-rank">
                                <li class="user-info__body-rank-star">
                                    <i class="fas fa-star"></i>
                                </li>
                                <li class="user-info__body-rank-star">
                                    <i class="fas fa-star"></i>
                                </li>
                                <li class="user-info__body-rank-star">
                                    <i class="fas fa-star"></i>
                                </li>
                                <li class="user-info__body-rank-star">
                                    <i class="fas fa-star"></i>
                                </li>
                                <li class="user-info__body-rank-star">
                                    <i class="fas fa-star"></i>
                                </li>
                            </ul>
                            <p class="user-info__body-comment">This course really helped me a lot. Very nice!</p>
                            <h5 class="user-info__body-city">Hà Nội</h5>
                        </div>
                    </div>
                </div>
            </div>

            <div class="item">
                <div class="top-review__user-item">
                    <div class="user-info">
                        <div class="user-info__avatar">
                            <img src="<c:url value = "/home/assets/images/picture/student1.jpg"/>" alt="avarta">
                        </div>

                        <div class="user-info__body">
                            <div>
                                <h4 class="user-info__body-name">Minh</h4>
                            </div>
                            <ul class="user-info__body-rank">
                                <li class="user-info__body-rank-star">
                                    <i class="fas fa-star"></i>
                                </li>
                                <li class="user-info__body-rank-star">
                                    <i class="fas fa-star"></i>
                                </li>
                                <li class="user-info__body-rank-star">
                                    <i class="fas fa-star"></i>
                                </li>
                                <li class="user-info__body-rank-star">
                                    <i class="fas fa-star"></i>
                                </li>
                                <li class="user-info__body-rank-star">
                                    <i class="fas fa-star"></i>
                                </li>
                            </ul>
                            <p class="user-info__body-comment">Great!</p>
                            <h5 class="user-info__body-city">TP.HCM</h5>
                        </div>
                    </div>
                </div>
            </div>

            <div class="item">
                <div class="top-review__user-item">
                    <div class="user-info">
                        <div class="user-info__avatar">
                            <img src="<c:url value = "/home/assets/images/picture/student1.jpg"/>" alt="avarta">
                        </div>

                        <div class="user-info__body">
                            <div>
                                <h4 class="user-info__body-name">Nam</h4>
                            </div>
                            <ul class="user-info__body-rank">
                                <li class="user-info__body-rank-star">
                                    <i class="fas fa-star"></i>
                                </li>
                                <li class="user-info__body-rank-star">
                                    <i class="fas fa-star"></i>
                                </li>
                                <li class="user-info__body-rank-star">
                                    <i class="fas fa-star"></i>
                                </li>
                                <li class="user-info__body-rank-star">
                                    <i class="fas fa-star"></i>
                                </li>
                                <li class="user-info__body-rank-star">
                                    <i class="fas fa-star"></i>
                                </li>
                            </ul>
                            <p class="user-info__body-comment">Great!</p>
                            <h5 class="user-info__body-city">Đà Nẵng</h5>
                        </div>
                    </div>
                </div>
            </div>

            <div class="item">
                <div class="top-review__user-item">
                    <div class="user-info">
                        <div class="user-info__avatar">
                            <img src="<c:url value = "/home/assets/images/picture/student1.jpg"/>" alt="avarta">
                        </div>

                        <div class="user-info__body">
                            <div>
                                <h4 class="user-info__body-name">Tài</h4>
                            </div>
                            <ul class="user-info__body-rank">
                                <li class="user-info__body-rank-star">
                                    <i class="fas fa-star"></i>
                                </li>
                                <li class="user-info__body-rank-star">
                                    <i class="fas fa-star"></i>
                                </li>
                                <li class="user-info__body-rank-star">
                                    <i class="fas fa-star"></i>
                                </li>
                                <li class="user-info__body-rank-star">
                                    <i class="fas fa-star"></i>
                                </li>
                                <li class="user-info__body-rank-star">
                                    <i class="fas fa-star"></i>
                                </li>
                            </ul>
                            <p class="user-info__body-comment">Good job!</p>
                            <h5 class="user-info__body-city">Tây Ninh</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<!--
==============
    Subscribe
==============
-->

<!--
==============
    Footer
==============
-->
<footer class="footer-section">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="footer-p">
                    <div id="map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.4843009459546!2d106.76973361462316!3d10.85072139227108!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752763f23816ab%3A0x282f711441b6916f!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBTxrAgcGjhuqFtIEvhu7kgdGh14bqtdCBUaMOgbmggcGjhu5EgSOG7kyBDaMOtIE1pbmg!5e0!3m2!1svi!2s!4v1633010398290!5m2!1svi!2s"
                                width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                    </div>
                </div>
            </div>
            <div class="col-md-5 ml-auto">
                <div class="footer-inner d-flex justify-content-between">
                    <div class="footer-list-item">
                        <ul class="list-unstyled">
                            <li>Teams</li>
                            <li><a href="#">Minh Thắng</a></li>
                            <li><a href="#">Hữu Đức</a></li>
                            <li><a href="#">Thanh Tài</a></li>
                            <li><a href="#">Văn Tính</a></li>
                        </ul>
                    </div>
                    <div class="footer-list-item">
                        <ul class="list-unstyled">
                            <li>MSSV</li>
                            <li><a href="#">19110462</a></li>
                            <li><a href="#">19110349</a></li>
                            <li><a href="#">19110452</a></li>
                            <li><a href="#">19110478</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright text-center">
            <small>Community HCM University of Technology and Education</small>
        </div>
    </div>
</footer>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
<script src="<c:url value = "/home/assets/js/owl.carousel.min.js"/>"></script>
<script>
    $('.owl-carousel').owlCarousel({
        margin: 20,
        loop: true,
        autoplayTimeOut: 2000,
        autoplayHoverPause: true,
        responsive: {
            0: {
                items: 1,
                nav: false
            },
            600: {
                items: 2,
                nav: false
            },
            1000: {
                items: 3,
                nav: false
            }
        }
    })
</script>
</body>
</html>