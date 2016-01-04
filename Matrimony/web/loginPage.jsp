<%-- 
    Document   : loginPage
    Created on : Dec 4, 2015, 5:09:12 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>

        <%@include file="importCSS.jsp" %>
    </head>
    <body>
        <div class="inner page boxed-style">
            <%@include file="header.jsp" %>

            <div class="five" style="margin: auto; padding-top: 50px;">
                    <div class="twelve columns">
                        <h5 class="pink-text"><i class="icon-user icon-large"></i> SIGN IN YOUR ACCOUNT <span class="subheader right small-link"><a href="#" data-reveal-id="register_panel" class="radius secondary small button">CREATE NEW ACCOUNT</a></span></h5>
                    </div>
                    <form id="login_form" action="Login" name="login_form" method="post" class="clearfix">
                        <div class="twelve columns">
                            <input type="text" id="username" name="email" class="inputbox" placeholder="Email" required>
                        </div>
                        <div class="twelve columns">
                            <input type="password" id="password" name="password" class="inputbox" placeholder="Password" required>
                        </div>
                        <p class="twelve columns">
                            <small><i class="icon-lock"></i> Your <a href="#">privacy</a> is important to us and we will never rent or sell your information.</small>
                        </p>
                        <div class="twelve columns">
                            <button type="submit" id="login" name="submit" class="radius secondary button"><i class="icon-unlock"></i> &nbsp;LOG IN</button> 
                        </div>
                    </form>
                    <div class="twelve columns"><hr>
                        <ul class="inline-list">
                            <li><small><a href="#" data-reveal-id="forgot_panel">FORGOT YOUR USERNAME?</a></small></li>
                            <li><small><a href="#" data-reveal-id="forgot_panel">FORGOT YOUR PASSWORD?</a></small></li>
                        </ul>
                    </div>
                </div>

            <%@include file="testimonial - newsletter.jsp" %>

            <%@include file="footer.jsp" %>

            <%@include file="login.jsp" %>

        </div>

        <%@include file="importScript.jsp" %>
    </body>
</html>
