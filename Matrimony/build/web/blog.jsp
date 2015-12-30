<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html class="no-js" lang="en">
    <!--<![endif]-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Site title-->
        <title>Sweet Date - Blog Page </title>

        <%@include file="importCSS.jsp" %>
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
                                <li><a href="index.jsp">Home</a></li>
                                <li class="current"><a href="blog.jsp">Blog page example</a></li>
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
                                    <h2 class="article-title"><a href="single-article.jsp"><span class="pink-text">Using slider</span> as a media blog content</a></h2>

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
                                        <p>Everyone gets nervous on first dates. There are a lot of questions we ask ourselves in advance.<br><br> “Will the two of us get along? Will we hook up? Will I do or say something so stupid and embarrassing that I am haunted by shame for the rest of my life?”</p>
                                        <p><a href="single-article.jsp" class="radius small button secondary">Continue reading</a></p>
                                    </div><!--end article-content-->
                                </div><!--end twelve-->
                            </div><!--end row-->
                            <!-- End Article -->

                            <hr>

                            <!-- Begin Article -->
                            <div class="row">
                                <div class="twelve columns">
                                    <h2 class="article-title"><a href="#"><span class="pink-text">Video used</span> as media for blog article</a></h2>

                                    <div class="article-meta clearfix">
                                        <ul class="link-list">
                                            <li><i class="icon-calendar"></i> <a href="#">April 14, 2013</a></li>
                                            <li><i class="icon-user"></i> <a href="#">Admin</a></li>
                                            <li><i class="icon-heart"></i> <a href="#">Success stories</a>, <a href="#">Articles with video</a></li>
                                            <li><i class="icon-comments"></i> <a href="#">17 comments</a></li>
                                        </ul>
                                    </div><!--end article-meta-->
                                </div><!--end twelve-->

                                <div class="twelve columns">
                                    <div class="article-media clearfix">
                                        <div class="flex-video widescreen vimeo">
                                            <iframe src="http://player.vimeo.com/video/27764822?title=0&amp;byline=0&amp;portrait=0&amp;color=ec155a" width="220" height="124"></iframe>
                                        </div>
                                    </div><!--end article-media-->
                                </div><!--end twelve-->

                                <div class="twelve columns">
                                    <div class="article-content">
                                        <p>She drove an hour and a half to meet me in a poorly-lit gas station parking lot. We had a lot of time to kill, so we went to a restaurant to eat and start getting to know one another.<br><br>From there, we went to a divey bar for a drink, where an extremely trashed teenager kept us company and told us all about her ex-boyfriend.</p>
                                        <p><a href="#" class="radius small button secondary">Continue reading</a></p>
                                    </div><!--end article-content-->
                                </div><!--end twelve-->
                            </div><!--end row-->
                            <!-- End  Article -->

                            <hr>

                            <!-- Begin Article -->
                            <div class="row">
                                <div class="twelve columns">
                                    <h2 class="article-title"><a href="#"><span class="pink-text">Simple Images</span> used on media block</a></h2>

                                    <div class="article-meta clearfix">
                                        <ul class="link-list">
                                            <li><i class="icon-calendar"></i> <a href="#">April 14, 2013</a></li>
                                            <li><i class="icon-user"></i> <a href="#">Admin</a></li>
                                            <li><i class="icon-heart"></i> <a href="#">Success stories</a></li>
                                            <li><i class="icon-comments"></i> <a href="#">5 comments</a></li>
                                        </ul>
                                    </div><!--end article-meta-->
                                </div><!--end twelve-->

                                <div class="twelve columns">
                                    <div class="article-media clearfix">
                                        <img src="assets/images/blog_slider_02.jpg" alt="Simple Image Media Blog">
                                    </div><!--end article-media-->
                                </div><!--end twelve-->

                                <div class="twelve columns">
                                    <div class="article-content">
                                        <p>Texted a girls number I saw on a bathroom wall in a club while I was taking a piss. Seems like a nice girl, thinks its hilarious how I got her number. <br><br>Text and call all the time for a couple of months and she says shes coming to my city to see some friends so we should meet up. Meet up, go for a beer and food. Get on awesome.</p>
                                        <p><a href="#" class="radius small button secondary">Continue reading</a></p>
                                    </div><!--end article-content-->
                                </div><!--end twelve-->
                            </div><!--end row-->
                            <!-- End  Article -->

                            <hr>

                            <!-- Pagination -->
                            <div class="row">
                                <div class="twelve columns">
                                    <ul class="pagination">
                                        <li class="arrow unavailable"><a href=""><i class="icon-chevron-left"></i></a></li>
                                        <li class="current"><a href="">1</a></li>
                                        <li><a href="">2</a></li>
                                        <li><a href="">3</a></li>
                                        <li><a href="">4</a></li>
                                        <li class="unavailable"><a href="">&hellip;</a></li>
                                        <li><a href="">12</a></li>
                                        <li><a href="">13</a></li>
                                        <li class="arrow"><a href=""><i class="icon-chevron-right"></i></a></li>
                                    </ul>
                                </div><!--end twelve-->
                            </div><!--end row-->
                            <!-- End Pagination -->

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
                                    <h5>Flirting Tips</h5>
                                    <p>Flirting is an incredibly fast and powerful way to attract a woman. <br><br>Many men struggle with it, not realizing that a few simple flirting tips for guys can dramatically increase any man’s ability to flirt successfully.</p>
                                    <a href="" target="_blank">Learn about</a>
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

            <p id="btnGoUp">Go up</p>
        </div>

        <%@include file="importScript.jsp" %>
    </body>
</html>
