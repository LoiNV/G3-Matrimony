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
                            <h2 class="sweetfont left">Advertisement</h2>
                            <hr>
                            <div class="twelve columns" style="padding: 0px 200px 200px 200px">
                                <div class="panel">
                                    <h3>Register Advertisement</h3>
                                    <!--Newsletter form-->
                                    <form id="create-form" name="create-form" action="AdvertismentCreateServlet?price=200&customerId=1" method="post" class="row" style="padding:20px 0 10px 0;line-height: 30px;">
                                        <div class="twelve columns">
                                            <b>Link Image:</b><input type="text" name="image" id="image" placeholder="Image File" required>

                                        </div>
                                        <div class="twelve columns">
                                            <b>Link:</b><input type="text" name="link" id="link" placeholder="Link" required>

                                        </div>
                                        <div class="twelve columns">
                                            <b>Description:</b><input type="text" name="message" id="message" placeholder="Message" required>

                                        </div>
                                        <div class="twelve columns">
                                            <b>Price: 200$</b>
                                        </div>
                                        <div class="twelve">
                                            <div class="four columns" style="margin-top: 10px;">
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
