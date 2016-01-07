<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <%@include file="importCSS_admin.jsp" %>
    </head>


    <body class="nav-md">

        <div class="container body">


            <div class="main_container">

                <%@include file="contentLeft.jsp" %>

                <!-- top navigation -->
                <%@include file="topNavigation.jsp" %>


                <!-- page content -->
                <div class="right_col" role="main">

                    <br />
                    <div class="">

                        <div class="row">
                            <div class="col-md-12">
                                <div class="x_panel">
                                    <%@include file="xTitle-ContentRight.jsp" %>
                                    <div class="x_content">

                                        <table id="example" class="table table-striped responsive-utilities jambo_table">
                                            <thead>
                                                <tr class="headings">
                                                    <th>ID</th>
                                                    <th>UserName </th>
                                                    <th>Subscription</th>
                                                    <th>Create Date</th>                                                    
                                                    <th>Remain</th>                                                    
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:forEach items="${listUS}" var="us">
                                                    <tr>
                                                        <td>${us.id}</td>
                                                        <td>${us.userId.name}</td>
                                                        <td>${us.subId.name}</td>
                                                        <td>${us.chargedDate}</td>                                                                                              
                                                        <td>${us.subId.duration} Days</td>                                                                                              
                                                    </tr>

                                                </c:forEach>
                                            </tbody>

                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <%@include file="footer_admin.jsp" %>

                </div>
                <!-- /page content -->
            </div>


        </div>

        <div id="custom_notifications" class="custom-notifications dsp_none">
            <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
            </ul>
            <div class="clearfix"></div>
            <div id="notif-group" class="tabbed_notifications"></div>
        </div>

        <%@include file="importScript_admin.jsp" %>
    </body>

</html>