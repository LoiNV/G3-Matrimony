<%-- 
    Document   : single-article
    Created on : Dec 4, 2015, 3:14:25 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->


<html class="no-js" lang="en">
    <!--<![endif]-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sweet Date - Landing Page Theme</title>
        <!--Meta-->
        <meta name="description"  content="Premium landing page for Lovers">
        <meta name="author"  content="Seventh Queen">
        <!--Set the viewport width to device width for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--Foundation Framework-->
        <link rel="stylesheet" href="assets/styles/foundation.min.css">
        <!--Plugins-->
        <link rel="stylesheet" href="assets/styles/font-awesome.min.css">
        <link rel="stylesheet" href="assets/styles/prettyPhoto.css">


        <!--Main Stylesheet (change this to modify template)-->
        <link rel="stylesheet" href="assets/styles/app.css">
        <link rel="stylesheet" href="assets/styles/updates.css">
        <link rel="stylesheet" href="assets/styles/custom.css">


        <!--Google Fonts-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,400italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Yesteryear' rel='stylesheet' type='text/css'>

        <!--[if IE 7]>
        <link rel="stylesheet" href="assets/styles/font-awesome-ie7.min.css">
        <script src="assets/scripts/ie6/warning.js"></script>
        <script>window.onload=function(){e("assets/scripts/ie6/")}</script>
        <![endif]-->


        <!--Favicons-->
        <link rel="shortcut icon" href="assets/images/icons/favicon.ico">
        <link rel="apple-touch-icon" href="assets/images/apple-touch-icon.png">
        <link rel="apple-touch-icon" sizes="57x57" href="assets/images/apple-touch-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="72x72" href="assets/images/apple-touch-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="114x114" href="assets/images/apple-touch-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="144x144" href="assets/images/apple-touch-icon-144x144.png"> 


        <!-- jQuery & Foundation Framework -->
        <script type="text/javascript" src="assets/scripts/modernizr.foundation.js"></script> 
    </head>
    <body>
        <div class="inner page boxed-style">

            <%@include file="header.jsp" %>

            <!-- BREADCRUMBS SECTION
================================================ -->
            <section>
                <div id="breadcrumbs-wrapp">
                    <div class="row">
                        <div class="nine columns">
                            <ul class="breadcrumbs hide-for-small">
                                <li><a href="index.html">Home</a></li>
                                <li class="current"><a href="single-article.html">Single article example</a></li>
                            </ul>
                        </div>

                    </div><!--end row-->
                </div><!--end breadcrumbs-wrapp-->
            </section>
            <!--END BREADCRUMBS SECTION-->

            <!-- MAIN SECTION
================================================ -->
            <section>
                <div id="main">
                    <div class="row">
                        <div class="seven columns">

                            <!-- Begin Article -->
                            <div class="row">
                                <div class="twelve columns">
                                    <h2 class="article-title"><a href="#"><span class="pink-text">Using slider</span> as a media blog content</a></h2>

                                    <div class="article-meta clearfix">
                                        <ul class="link-list">
                                            <li><i class="icon-calendar"></i> <a href="#">April 14, 2013</a></li>
                                            <li><i class="icon-user"></i> <a href="#">Admin</a></li>
                                            <li><i class="icon-heart"></i> <a href="#">Success stories</a></li>
                                            <li><i class="icon-comments"></i> <a href="#">24 comments</a></li>
                                        </ul>
                                    </div><!--end article-meta-->
                                </div><!--end twelve-->

                                <div class="twelve columns">
                                    <div class="article-media clearfix">
                                        <div class="blog-slider">
                                            <div data-thumb="assets/images/blog_slider_00.jpg">
                                                <img src="assets/images/blog_slider_00.jpg" alt="">
                                            </div>
                                            <div data-thumb="assets/images/blog_slider_01.jpg">
                                                <img src="assets/images/blog_slider_01.jpg" alt="">
                                            </div>
                                        </div><!--end blog-slider-->
                                    </div><!--end article-media-->
                                </div><!--end twelve-->

                                <div class="twelve columns">
                                    <div class="article-content">
                                        <p>Relationships are made up of defining moments, both big and small. Some love stories hit you over the head with their obvious clues about the future -- he can't wait to introduce you to his family; he's planning future weekend getaways -- but other times, it's the way you react (or don't react) to a situation that tells him as clearly as a flashing neon sign that you're his true love and that he can't live without you.</p>

                                        <blockquote>
                                            <h6 class="no-marg-top">Smooth move</h6>
                                            <p>We started talking about moving in together after a couple of years of dating. I knew she was special, but when she was willing to sell her new house and move across town to make the transition easier on my son, there was no doubt in my mind that I've found the one.
                                                <cite>Isaac Asimov</cite></p>
                                        </blockquote>

                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

                                    </div><!--end article-content-->
                                </div><!--end twelve-->
                            </div><!--end row-->
                            <!-- End  Article -->

                            <hr>      

                            <!-- Begin Comments -->
                            <div class="comments">
                                <h4>24 Comments:</h4>

                                <!--Comments Lists-->
                                <ol class="comments-list clearfix">
                                    <li class="comment">
                                        <div class="avatar">
                                            <img src="assets/images/profile-carousel/thumb_01.jpg" alt="Avatar">
                                        </div>
                                        <div class="comment-meta">
                                            <h5 class="author"><a href="#">Davaki L. says:</a></h5>
                                            <p class="date">January 06, 2011</p>
                                        </div>
                                        <div class="comment-body">
                                            <p>Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus.</p>
                                        </div>
                                    </li>
                                    <li class="comment">
                                        <div class="avatar">
                                            <img src="assets/images/profile-carousel/thumb_02.jpg" alt="Avatar">
                                        </div>
                                        <div class="comment-meta">
                                            <h5 class="author"><a href="#">Davaki L. says:</a></h5>
                                            <p class="date">January 06, 2011</p>
                                        </div>
                                        <div class="comment-body">
                                            <p>Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus.</p>
                                        </div>
                                    </li>
                                    <li class="comment">
                                        <div class="avatar">
                                            <img src="assets/images/profile-carousel/thumb_03.jpg" alt="Avatar">
                                        </div>
                                        <div class="comment-meta">
                                            <h5 class="author"><a href="#">Davaki L. says:</a></h5>
                                            <p class="date">January 06, 2011</p>
                                        </div>
                                        <div class="comment-body">
                                            <p>Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus.</p>
                                        </div>
                                    </li>
                                    <li class="comment">
                                        <div class="avatar">
                                            <img src="assets/images/profile-carousel/thumb_12.jpg" alt="Avatar">
                                        </div>
                                        <div class="comment-meta">
                                            <h5 class="author"><a href="#">Davaki L. says:</a></h5>
                                            <p class="date">January 06, 2011</p>
                                        </div>
                                        <div class="comment-body">
                                            <p>Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus.</p>
                                        </div>

                                        <!--Comment Reply-->
                                        <ul class="children">
                                            <li class="comment">
                                                <div class="avatar">
                                                    <img src="assets/images/profile-carousel/thumb_13.jpg" alt="Avatar">
                                                </div>
                                                <div class="comment-meta">
                                                    <h5 class="author"><a href="#">John Doe</a></h5>
                                                    <p class="date">January 06, 2011</p>
                                                </div>
                                                <div class="comment-body">
                                                    <p>Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus.</p>
                                                </div>

                                                <!--Second Comment Reply-->
                                                <ul class="children">
                                                    <li class="comment">
                                                        <div class="avatar">
                                                            <img src="assets/images/profile-carousel/thumb_13.jpg" alt="Avatar">
                                                        </div>
                                                        <div class="comment-meta">
                                                            <h5 class="author"><a href="#">John Doe</a></h5>
                                                            <p class="date">January 06, 2011</p>
                                                        </div>
                                                        <div class="comment-body">
                                                            <p>Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus.</p>
                                                        </div>
                                                    </li>
                                                </ul>
                                                <!--end Second Comment Reply-->
                                            </li>
                                        </ul>
                                        <!--end Comment Reply-->
                                    </li>
                                </ol><!--end comments-list-->


                                <h4>Post a reply:</h4><br>
                                <!--Leave comment form-->
                                <form action="#" method="post" class="leave-comment clearfix">
                                    <div class="row">
                                        <div class="six columns">
                                            <label>Name<span> (required)</span></label>
                                            <input type="text" name="com-name" id="com-name" required>
                                        </div>
                                        <div class="six columns">
                                            <label>E-mail<span> (required)</span></label>
                                            <input type="email" name="com-email" id="com-email" required>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="twelve columns">
                                            <label>Message<span> (required)</span></label>
                                            <textarea required></textarea>
                                        </div>
                                    </div>
                                    <button type="submit" class="radius button right">Send message</button>     
                                </form><!--end leave-comment-->
                            </div><!-- End Comments -->

                        </div><!--end seven-->





                        <!-- SIDEBAR SECTION
                                    ================================================ -->
                        <aside class="four columns offset-by-one hide-for-small">

                            <!--Widgets Container-->
                            <div class="widgets-container">

                                <div class="widgets clearfix">
                                    <h5>Our Blog Categories</h5>
                                    <ul class="widget-list">
                                        <li><a href="#">First date</a></li>
                                        <li><a href="#">Dating guidelines</a></li>
                                        <li><a href="#">Success stories</a></li>
                                        <li><a href="#">Prespiciatis</a></li>
                                        <li><a href="#">Lorem ipsum dolor sit</a></li>
                                    </ul>
                                </div>

                                <div class="widgets clearfix">
                                    <h5>Advertise here</h5>
                                    <a href="http://bit.ly/152m2RU" title="Wordpress Dating Theme"><img src="assets/images/sweetdate_wordpress_buddypress_300x250.png" width="300" height="250" alt="Wordpress Dating Theme"></a>
                                </div>

                                <div class="widgets clearfix">
                                    <h5>Latest Profile Entries</h5>
                                    <br>
                                    <ul class="block-grid three-up latest-entries">
                                        <li><span class="avatar"><a href="#" title="Dating profile 1"><img src="assets/images/profile-carousel/thumb_01.jpg" alt="Dating profile 1"></a></span></li>
                                        <li><span class="avatar"><a href="#" title="Dating profile 2"><img src="assets/images/profile-carousel/thumb_02.jpg" alt="Dating profile 2"></a></span></li>
                                        <li><span class="avatar"><a href="#" title="Dating profile 3"><img src="assets/images/profile-carousel/thumb_03.jpg" alt="Dating profile 3"></a></span></li>
                                        <li><span class="avatar"><a href="#" title="Dating profile 4"><img src="assets/images/profile-carousel/thumb_04.jpg" alt="Dating profile 4"></a></span></li>
                                        <li><span class="avatar"><a href="#" title="Dating profile 5"><img src="assets/images/profile-carousel/thumb_05.jpg" alt="Dating profile 5"></a></span></li>
                                        <li><span class="avatar"><a href="#" title="Dating profile 6"><img src="assets/images/profile-carousel/thumb_06.jpg" alt="Dating profile 6"></a></span></li>
                                    </ul>
                                </div>

                                <div class="widgets clearfix">
                                    <h5>Our Text</h5>
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.<br><br>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
                                    <a href="http://www.lipsum.com/" target="_blank">Learn about</a>
                                </div>

                            </div> <!--end Widgets Container-->
                        </aside> <!--end four columns-->
                        <!--END SIDEBAR SECTION-->

                    </div><!--end row-->
                </div><!--end main-->
            </section>
            <!--END MAIN SECTION-->
            
            <%@include file="testimonial - newsletter.jsp" %>

            <%@include file="footer.jsp" %>

            <%@include file="login.jsp" %>
        </div>
    </body>
</html>
