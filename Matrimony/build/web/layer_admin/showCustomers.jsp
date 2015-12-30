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
                                                    <th>Customers ID</th>
                                                    <th>Customers Name </th>
                                                    <th>Email</th>
                                                    <th>Phone Number</th>
                                                    <th>Position</th>
                                                    <th>Status</th>
                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                    </th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                            <c:forEach items="${listCustomers}" var="c">
                                                <tr>
                                                    <td>${c.id}</td>
                                                    <td>${c.name}</td>
                                                    <td>${c.email}</td>
                                                    <td>${c.phone}</td>
                                                    <td>${c.position}</td>
                                                    <td>${c.status}</td>
                                                    <td>
                                                        <a href="">Send</a>
                                                        
                                                    </td>
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