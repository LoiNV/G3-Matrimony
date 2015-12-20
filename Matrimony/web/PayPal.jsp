<%-- 
    Document   : profile
    Created on : Dec 4, 2015, 4:22:12 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sweet Date - Profile Page </title>

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
                                <li><a href="index.html">Home</a></li>
                                <li class="current"><a href="profile.html">Hanna Marcovick profile</a></li>
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
                            <h2 class="sweetfont left">PayPal</h2>
                            <hr>
                            <div class="twelve columns" style="padding: 0px 200px 200px 200px;">
                                <div class="panel">
                                    <!--Newsletter form-->
                                    <form id="paypal-form" name="paypal-form" method="post" class="row" style="padding:50px 0 50px 30px;line-height: 30px;">
                                        <div class="eleven columns">
                                            <b>User Name:</b><input type="text" name="name" id="yname" placeholder="Your name" required>

                                            <b>Price:</b><input type="number" name="price" id="email" placeholder="Price" required>

                                            <b>Duration:</b><input type="number" name="duration" id="email" placeholder="Duration" required>
                                        </div>
                                        <div class="eleven">
                                            <div class="four columns" style="margin-top: 10px;">
                                                <p><button type="submit" id="paypal-submit" name="paypal-submit" class="small radius button expand">JOIN US</button></p>
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
