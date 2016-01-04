<%-- 
    Document   : profile
    Created on : Dec 4, 2015, 4:22:12 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sweet Date - Advertisement Page </title>

        <%@include file="importCSS.jsp" %>    
        <link href="assets/uploadfile/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/uploadfile/css/fileinput.min.css" rel="stylesheet" type="text/css"/>

        <script src="assets/uploadfile/js/plugins/canvas-to-blob.min.js" type="text/javascript"></script>
        <script src="assets/uploadfile/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="assets/uploadfile/js/fileinput.js" type="text/javascript"></script>
        <script src="assets/uploadfile/js/fileinput_locale_LANG.js" type="text/javascript"></script>

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
                                <li><a href="index.jsp">Home</a></li>
                                <li class="current"><a href="#">Advertisement</a></li>
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
                            <div class="eight columns">
                                <div class="panel">
                                    <h3>Register Advertisement</h3>
                                    <!--Newsletter form-->

                                    <div class="twelve columns">
                                        <b>Image:</b><br/>
                                        <form enctype="multipart/form-data" id="formUP">
                                            <div class="form-group">
                                                <input id="file_1" name="file" type="file" multiple class="file" required>
                                            </div>                                                                                                                                                                
                                        </form>
                                        
                                        <div class="twelve columns">
                                            <img id="result" src="${sessionScope.imgAdv}"/>
                                        </div><hr/>
                                        
                                        <script>
                                            $("#file_1").fileinput({
                                                uploadUrl: 'http://localhost:8080/Matrimony/UpImageAdv',
                                                allowedFileExtensions: ['jpg', 'png', 'gif'],
                                                maxFilesNum: 2,
                                                //allowedFileTypes: ['image', 'video', 'flash'],                                                            
                                                slugCallback: function (filename) {
                                                    return filename.replace('(', '_').replace(']', '_');
                                                }
                                            });
                                        </script>

                                    </div>

                                    <form action="Checkout?type=adv" method="POST">
                                        <input type="hidden" name="cusId" value="${cusId}"/>
                                        <input type="hidden" name="imgAdv" value="${sessionScope.imgAdv}"/>
                                        <div class="twelve columns">
                                            <b>Link Redirect:</b><input type="text" name="link" id="link" placeholder="Link" required>

                                        </div>
                                        <div class="twelve columns">
                                            <b>Messages:</b><input type="text" name="message" id="message" placeholder="Message" required>

                                        </div>

                                        <div class="twelve columns">
                                            <b>Price: </b>${price} USD  / Week
                                        </div>
                                        <hr/>
                                        <div class="three columns">
                                            <b>Duration(Weeks):</b><input type="number" name="duration" id="duration" required>

                                        </div>

                                        <div class="twelve columns">
                                            <b>Amount:</b><span id="amt"> 0.00 USD</span>
                                        </div>

                                        <hr/>

                                        <div class="twelve columns">
                                            <input id="amount" type="hidden" name="PAYMENTREQUEST_0_AMT" value="0"/>
                                            <input type="hidden" name="currencyCodeType" value="USD"/>
                                            <input type="hidden" name="paymentType" value="Sale"/>
                                            <input type="image" src="img/checkout-logo-large.png" alt="Check out with PayPal"/>

                                        </div>
                                    </form>

                                </div><!--end panel-->
                            </div>
                        </div><!--end twelve-->
                    </div><!--end row-->
                </div><!--end profile-->
            </section>
            <!--END PROFILE SECTION-->

            <%--<%@include file="testimonial - newsletter.jsp" %>--%>

            <%@include file="footer.jsp" %>

            <p id="btnGoUp">Go up</p>
        </div>

        <%@include file="importScript.jsp" %>

        <script>

            $('.fileinput-upload-button').click(function () {
                setTimeout(function () {
                    var elem = document.getElementById('formUP');
                    elem.parentNode.removeChild(elem);
                    location.reload();
                }, 500);

            });
            $('#duration').on('change', function (evt) {
                var price = '${price}';
                var duration = document.getElementById("duration").value;
                var amount = duration * price;
                if (amount < 0) {
                    amount = 0;
                }
                document.getElementById("amount").value = amount;
                document.getElementById("amt").innerHTML = " " + amount + ".00 USD";
            });
        </script>
    </body>
</html>
