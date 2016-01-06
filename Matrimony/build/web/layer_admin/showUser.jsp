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
                                                    <th>User ID</th>
                                                    <th>User Name </th>
                                                    <th>Email</th>
                                                    <th style="text-align: center">Birth Day</th>
                                                    <th>Gender</th>
                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                    </th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:forEach items="${ListUsers}" var="u">
                                                    <c:if test="${u.status >=0}">
                                                        <tr>
                                                            <td>${u.id}</td>
                                                            <td>${u.name}</td>
                                                            <td>${u.email}</td>
                                                            <td style="text-align: center;">${u.birthday}</td>
                                                            <c:choose>
                                                                <c:when test="${u.gender}">
                                                                    <td>Male</td>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <td>FeMale</td>
                                                                </c:otherwise>
                                                            </c:choose>

                                                            <td>
                                                                <a href="DeleteUser?id=${u.id}" onclick="return confirm('Are you sure want to delete?');">Delete</a>
                                                            </td>
                                                        </tr>
                                                    </c:if>                                                

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