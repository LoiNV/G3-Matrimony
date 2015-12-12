<%-- 
    Document   : search-listing
    Created on : Dec 4, 2015, 3:14:40 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <form action="UsersFindServlet" method="post" class="twelve columns custom">
                            <div class="row">
                                <div class="two columns">
                                    <label class="inline">Meet people:</label>
                                </div>

                                <div class="two columns">
                                    <input type="text" name="name" placeholder="name" />
                                </div>

                                <div class="three columns">
                                    <select class="expand" name="gender">
                                        <option value="false">Woman</option>
                                        <option value="true">Man</option>
                                    </select>
                                </div>

                                <div class="two columns">
                                    <select class="expand" name="age1">
                                        <option value="18">18</option>
                                        <option value="19">19</option>
                                        <option value="20">20</option>
                                        <option value="21">21</option>
                                        <option value="22">22</option>
                                        <option value="23">23</option>
                                        <option value="24">24</option>
                                        <option value="25">25</option>
                                        <option value="26">26</option>
                                    </select>
                                </div>
                                <div class="two columns">
                                    <select class="expand" name="age2">
                                        <option value="26">26</option>
                                        <option value="25">25</option>
                                        <option value="24">24</option>
                                        <option value="23">23</option>
                                        <option value="22">22</option>
                                        <option value="21">21</option>
                                        <option value="20">20</option>
                                        <option value="19">19</option>
                                        <option value="18">18</option>
                                    </select>
                                </div>

                                <div class="two columns">
                                    <input type="text" name="city" placeholder="city" />
                                </div>

                                <div class="two columns">
                                    <input type="text" name="country" placeholder="country" />
                                </div>

                                <div class="three columns">
                                    <input value="Search" type="submit" class="small button radius right" style="float: left"/>
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
                                <c:if test="${ListSearch!=null}">
                                    <c:forEach items="${ListSearch}" var="p">
                                        <div class="four columns">
                                            <div class="search-item">
                                                <div class="avatar">
                                                    <img src="assets/images/profile-carousel/thumb_01.jpg" alt="Avatar">
                                                </div>
                                                <div class="search-meta">
                                                    <h5 class="author"><a href="#">${p.name}</a></h5>
                                                    <p class="date">${p.age} | F | Bi | ${p.maritalStatus} | ${p.city}, ${p.country}</p>
                                                </div>
                                                <div class="search-body">
                                                    <p>Hello and welcome to the profile of your next true love. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                                </div>
                                                <p><a href="Profile?uri=${pageContext.request.requestURI}" class="small button radius secondary"><i class="icon-angle-right"></i> View profile</a></p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>


                                <!--end row-->
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
