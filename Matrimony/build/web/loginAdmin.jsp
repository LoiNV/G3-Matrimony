<%-- 
    Document   : loginAd
    Created on : Jan 4, 2016, 7:22:56 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <%@include file="layer_admin/importCSS_admin.jsp" %>
    </head>

    <body class="nav-md">

        <div class="container body">


            <div class="main_container">

                <%@include file="layer_admin/contentLeft.jsp" %>

                <!-- top navigation -->
                <%@include file="layer_admin/topNavigation.jsp" %>
                <div class="right_col" role="main">
                    <div class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <div class="panel-title">Login</div>
                            </div>
                            <div class="panel-body">
                                <form class="form-horizontal" method="post" action="LoginAdmin">
                                    <div class="input-group">
                                        <input style="width: 400px" class="form-control" type="email" name="email" placeholder="Email"/>
                                    </div>
                                    <div class="input-group">
                                        <input style="width: 400px" class="form-control" type="password" name="password" placeholder="Password"/>
                                    </div>
                                    <div class="input-group">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" name="remember"/> Remember me
                                            </label>
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <input class="btn btn-success" type="submit" value="Login"/>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>

        <%@include file="layer_admin/importScript_admin.jsp" %>
    </body>

</html>
