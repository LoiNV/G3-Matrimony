<!DOCTYPE html>
<html lang="en">

    <head>
        <%@include file="importCSS_admin.jsp" %>

    </head>


    <body class="nav-md">

        <div class="container body">

            <div class="main_container">

                <%@include file="contentLeft.jsp" %>
                <%@include file="topNavigation.jsp" %>

                <!-- page content -->
                <div class="right_col" role="main">
                    <br />
                    <%@include file="dashboardAdmin.jsp" %>
                    <!-- footer content -->
                    <%@include file="footer_admin.jsp" %>
                    <!-- /footer content -->
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