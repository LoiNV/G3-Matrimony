<%-- 
    Document   : search-listing
    Created on : Dec 4, 2015, 3:14:40 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sweet Date - Search Page </title>

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
                                <li class="current"><a href="single-article.jsp">Search result page example</a></li>
                            </ul>
                        </div>

                    </div><!--end row-->
                </div><!--end breadcrumbs-wrapp-->
            </section>
            <!--END BREADCRUMBS SECTION-->





            <!-- SEARCH BAR SECTION
            ================================================ -->
            <section>
                <!--Search bar-->
                <div id="search-bar">
                    <div class="row">
                        <form action="#" method="post" class="twelve columns custom">
                            <div class="row">
                                <div class="two columns">
                                    <label class="inline">Meet people:</label>
                                </div>
                                <div class="two columns">
                                    <select class="expand">
                                        <option selected="selected">I am</option>
                                        <option>Man</option>
                                        <option>Woman</option>
                                    </select>
                                </div>

                                <div class="two columns">
                                    <select class="expand">
                                        <option selected="selected">Searching for</option>
                                        <option>Woman</option>
                                        <option>Man</option>
                                    </select>
                                </div>

                                <div class="two columns">
                                    <select class="expand customDropdown">
                                        <option selected="selected">Between ages</option>
                                        <option>18</option>
                                        <option>19</option>
                                    </select>
                                </div>

                                <div class="two columns">
                                    <select class="expand customDropdown">
                                        <option selected="selected">&amp;</option>
                                        <option>18</option>
                                        <option>19</option>
                                    </select>
                                </div>

                                <div class="two columns">
                                    <button class="small button radius right"><i class="icon-search"></i> &nbsp;SEARCH</button>
                                </div>

                            </div><!--end row-->
                        </form>
                    </div><!--end row-->
                </div><!--end Search bar-->
            </section>
            <!--END SEARCH BAR SECTION-->





            <!-- MAIN SECTION
            ================================================ -->
            <section>
                <div id="main" class="search-result text-center">
                    <div class="row">
                        <div class="twelve columns">
                            <h2>Search profile <span class="pink-text">results</span></h2>
                            <p class="lead">Your search returns 24 matches:</p>

                            <!--Search List-->
                            <div class="search-list">
                                <div class="four columns">
                                    <div class="search-item">
                                        <div class="avatar">
                                            <img src="assets/images/profile-carousel/thumb_01.jpg" alt="Avatar">
                                        </div>
                                        <div class="search-meta">
                                            <h5 class="author"><a href="#">Hanna Marcovick</a></h5>
                                            <p class="date">29 | F | Bi | Single | Bremen, Germany</p>
                                        </div>
                                        <div class="search-body">
                                            <p>Hello and welcome to the profile of your next true love. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                        </div>
                                        <p><a href="Profile" class="small button radius secondary"><i class="icon-angle-right"></i> View profile</a></p>
                                    </div>
                                </div>

                                <div class="four columns">
                                    <div class="search-item">
                                        <div class="avatar">
                                            <img src="assets/images/profile-carousel/thumb_02.jpg" alt="Avatar">
                                        </div>
                                        <div class="search-meta">
                                            <h5 class="author"><a href="#">Hanna Marcovick</a></h5>
                                            <p class="date">29 | F | Bi | Single | Bremen, Germany</p>
                                        </div>
                                        <div class="search-body">
                                            <p>Hello and welcome to the profile of your next true love. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                        </div>
                                        <p><a href="Profile" class="small button radius secondary"><i class="icon-angle-right"></i> View profile</a></p>
                                    </div>
                                </div>

                                <div class="four columns">
                                    <div class="search-item">
                                        <div class="avatar">
                                            <img src="assets/images/profile-carousel/thumb_03.jpg" alt="Avatar">
                                        </div>
                                        <div class="search-meta">
                                            <h5 class="author"><a href="#">Hanna Marcovick</a></h5>
                                            <p class="date">29 | F | Bi | Single | Bremen, Germany</p>
                                        </div>
                                        <div class="search-body">
                                            <p>Hello and welcome to the profile of your next true love. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                        </div>
                                        <p><a href="Profile" class="small button radius secondary"><i class="icon-angle-right"></i> View profile</a></p>
                                    </div>
                                </div>

                                <div class="four columns">
                                    <div class="search-item">
                                        <div class="avatar">
                                            <img src="assets/images/profile-carousel/thumb_04.jpg" alt="Avatar">
                                        </div>
                                        <div class="search-meta">
                                            <h5 class="author"><a href="#">Hanna Marcovick</a></h5>
                                            <p class="date">29 | F | Bi | Single | Bremen, Germany</p>
                                        </div>
                                        <div class="search-body">
                                            <p>Hello and welcome to the profile of your next true love. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                        </div>
                                        <p><a href="Profile" class="small button radius secondary"><i class="icon-angle-right"></i> View profile</a></p>
                                    </div>
                                </div>

                                <div class="four columns">
                                    <div class="search-item">
                                        <div class="avatar">
                                            <img src="assets/images/profile-carousel/thumb_05.jpg" alt="Avatar">
                                        </div>
                                        <div class="search-meta">
                                            <h5 class="author"><a href="#">Hanna Marcovick</a></h5>
                                            <p class="date">29 | F | Bi | Single | Bremen, Germany</p>
                                        </div>
                                        <div class="search-body">
                                            <p>Hello and welcome to the profile of your next true love. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                        </div>
                                        <p><a href="Profile" class="small button radius secondary"><i class="icon-angle-right"></i> View profile</a></p>
                                    </div>
                                </div>

                                <div class="four columns">
                                    <div class="search-item">
                                        <div class="avatar">
                                            <img src="assets/images/profile-carousel/thumb_06.jpg" alt="Avatar">
                                        </div>
                                        <div class="search-meta">
                                            <h5 class="author"><a href="#">Hanna Marcovick</a></h5>
                                            <p class="date">29 | F | Bi | Single | Bremen, Germany</p>
                                        </div>
                                        <div class="search-body">
                                            <p>Hello and welcome to the profile of your next true love. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                        </div>
                                        <p><a href="Profile" class="small button radius secondary"><i class="icon-angle-right"></i> View profile</a></p>
                                    </div>
                                </div>

                            </div><!--end Search List-->

                            <!-- Pagination -->
                            <div class="row">
                                <div class="twelve columns pagination-centered">
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
                            <!--end  Pagination-->

                        </div><!--end twelve-->
                    </div><!--end row-->
                </div><!--end #main-->
            </section>
            <!--END MAIN SECTION-->

            <%@include file="testimonial - newsletter.jsp" %>

            <%@include file="footer.jsp" %>

            <%@include file="login.jsp" %>

            <p id="btnGoUp">Go up</p>
        </div>

        <%@include file="importScript.jsp" %>
    </body>
</html>
