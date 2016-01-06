<%-- 
    Document   : macthSingle
    Created on : Jan 4, 2016, 9:26:30 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sweet Date - Match Single</title>
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
                                <li class="current"><a href="#">Matches</a></li>
                            </ul>
                        </div>

                    </div><!--end row-->
                </div><!--end breadcrumbs-wrapp-->
            </section>
            <!--END BREADCRUMBS SECTION-->





            <!-- PROFILE SECTION
            ================================================ -->
            <section>
                <div id="main" class="search-result text-center">
                    <div class="row">
                        <div class="twelve columns">
                            <h2>Search <span class="pink-text">results</span></h2>
                            <div class="six columns" style="margin-left: 25%">
                                <div class="search-item">
                                    <div class="avatar" style="width: 300px; height: 300px;">
                                        <img style="width: 100%; height: 100%;" src="${p.avatar}" alt="Avatar">
                                    </div>
                                    <div class="search-meta">
                                        <h5 class="author"><a href="#">${p.name}</a></h5>
                                        <p class="date">${p.age} | ${p.maritalStatus} | ${p.city}, ${p.country}</p>
                                    </div>
                                    <div class="search-body">
                                        <p>${p.description}</p>
                                    </div>
                                    <a href="Profile?uri=Profile?id=${p.id}&id=${p.id}" class="small button radius secondary"><i class="icon-angle-right"></i> View profile</a>&nbsp;&nbsp;&nbsp;
                                    <a href="MatchSingle" class="small button radius secondary"><i class="icon-angle-right"></i> Continue</a>
                                    
                                </div>
                            </div>
                            <!--end row-->
                            <!--end  Pagination-->

                        </div><!--end twelve-->
                    </div><!--end row-->
                </div><!--end #main-->
            </section>
            <!--END PROFILE SECTION-->

            <%@include file="testimonial - newsletter.jsp" %>

            <%@include file="footer.jsp" %>

            <p id="btnGoUp">Go up</p>
        </div>

        <%@include file="importScript.jsp" %>
    </body>
</html>
