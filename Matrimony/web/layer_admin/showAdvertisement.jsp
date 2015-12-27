<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <%@include file="importCSS_admin.jsp" %>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/x.x.x/jquery.min.js"></script>

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
                                                    <th>Advertisement ID</th>
                                                    <th>Customers ID </th>
                                                    <th>Status</th>
                                                    <th>Message</th>
                                                    <th>Price</th>
                                                    <th>Create Date</th>
                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                    </th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:forEach items="${listAdvertisement}" var="a">
                                                    <tr>
                                                        <td>${a.id}</td>
                                                        <td>${a.customerId.getId()}</td>
                                                        <td>${a.status}</td>
                                                        <td>${a.message}</td>
                                                        <td>${a.price}</td>
                                                        <td>${a.createdDate}</td>
                                                        <td>
                                                            <a href="DeleteAdvertisement?id=${a.id}">Delete</a> |
                                                            <a href="FindIdAdvertisement?id=${a.id}" class="view" >View</a>
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

        </div>
        <div id="element_to_pop_up">
            <a class="b-close">x</a>
            <output name="id" >${adv.id}</output>
            <output name="price" >${adv.price}</output>
        </div>

    </body>

</html>