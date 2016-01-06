<%-- 
    Document   : profile
    Created on : Dec 4, 2015, 4:22:12 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sweet Date - Customer Page </title>

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
                                <li class="current"><a href="#">Register Advertisement</a></li>
                            </ul>
                        </div>
                     
                    </div><!--end row-->
                </div><!--end breadcrumbs-wrapp-->
            </section>
            <!--END BREADCRUMBS SECTION-->

            <!-- PROFILE SECTION
            ================================================ -->
            <section>
                <div id="profile">
                    <div class="row">
                        <div class="twelve columns">
                            <h2 class="sweetfont left">Customers</h2>
                            <hr>
                            <div class="twelve columns">
                                <div class="panel">
                                    <h3>Information Customers</h3>
                                    <!--Newsletter form-->
                                    <form id="create-form" name="create-form" action="CustomersCreateServlet" method="post" class="row" style="padding:30px 0 40px 40px;line-height: 30px;">
                                        <div class="seven columns">
                                            <b>Customer Name:</b><input type="text" name="name" id="name" placeholder="Your name" required>

                                            <b>Email:</b><input type="email" name="email" id="email" placeholder="Email" required>

                                            <b>Phone</b><input type="text" name="phone" id="phone" placeholder="Phone" required pattern="[0]{1}\d{9,10}">
                                        </div>
                                        
                                        <div class="twelve">
                                            <div class="six columns" style="margin-top: 10px;">
                                                <p><button type="submit" id="create-submit" name="create-submit" class="small radius button expand">Register</button></p>
                                            </div>
                                        </div>

                                    </form><!--end newsletter-form-->
                                </div><!--end panel-->
                            </div>
                        </div><!--end twelve-->
                    </div><!--end row-->
                </div><!--end profile-->
            </section>
            <!--END PROFILE SECTION-->

            <%@include file="testimonial - newsletter.jsp" %>

            <%@include file="footer.jsp" %>

            <p id="btnGoUp">Go up</p>
        </div>

        <%@include file="importScript.jsp" %>
    </body>
</html>
