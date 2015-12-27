<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
    <!--<![endif]-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sweet Date - Home Page </title>

        <%@include file="importCSS.jsp" %>
    </head>
    <body>
        <div class="page boxed-style">
            <%@include file="header-index.jsp" %>

            <%@include file="calltoaction.jsp" %>

            <%@include file="featured-text.jsp" %>

            <%@include file="testimonial - newsletter.jsp" %>

            <%@include file="footer.jsp" %>
            
            <p id="btnGoUp">Go up</p>
            
        </div>

        <%@include file="importScript.jsp" %>
    </body>
</html>
