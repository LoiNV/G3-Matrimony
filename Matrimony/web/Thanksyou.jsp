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
                            </ul>
                        </div>

                    </div><!--end row-->
                </div><!--end breadcrumbs-wrapp-->
            </section>
            <!--END BREADCRUMBS SECTION-->

            <!-- MAIN SECTION
            ================================================ -->
            <section>
                <div id="main" class="search-result text-center">
                    <div class="row">
                        <div class="twelve columns">
                            <h1 style="font-family: Yesteryear,cursive; font-size: 75px" ><span class="pink-text">Thanks you.</span></h1>
                            <h4 style="font-family: Yesteryear,cursive;font-size: 40px">We will contact you as soon as possible !!!</h4>
                            
                        </div><!--end row-->
                    </div><!--end #main-->
                </div>
            </section>
            <!--END MAIN SECTION-->

            <%@include file="testimonial - newsletter.jsp" %>

            <%@include file="footer.jsp" %>

            <p id="btnGoUp">Go up</p>
        </div>

        <%@include file="importScript.jsp" %>
    </body>
</html>
