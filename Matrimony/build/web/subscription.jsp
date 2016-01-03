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
        <title>Sweet Date - Subscription Page </title>

        <%@include file="importCSS.jsp" %>        
        <link href="assets/styles/subscriptioncss/subscript.css" rel="stylesheet" type="text/css" media="all"/>
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
                            <h2 class="sweetfont left">Subscription</h2>
                            <hr>
                            <div class="nine columns">
                                <div class="benefits">
                                    <table>
                                        <thead>
                                            <tr>
                                                <td class="benefits-col-first">The benefits of having a subscription</td>
                                                <td class="benefits-col-middle">Subscribers</td>
                                                <td>Members</td>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <tr class="even">
                                                <td class="benefits-col-first">Contact other singles</td>
                                                <td class="benefits-col-middle highlight"></td>
                                                <td></td>
                                            </tr>

                                            <tr class="odd">
                                                <td class="benefits-col-first">Connect faster with IM</td>
                                                <td class="benefits-col-middle highlight"></td>
                                                <td></td>
                                            </tr>
                                            <tr class="even">
                                                <td class="benefits-col-first">Send &amp; receive email messages</td>
                                                <td class="benefits-col-middle highlight"></td>
                                                <td></td>
                                            </tr>
                                            <tr class="odd">
                                                <td class="benefits-col-first">Respond to email messages</td>
                                                <td class="benefits-col-middle highlight"></td>
                                                <td></td>
                                            </tr>

                                            <tr class="even">
                                                <td class="benefits-col-first">Remove members from view</td>
                                                <td class="benefits-col-middle highlight"></td>
                                                <td></td>
                                            </tr>
                                            <tr class="odd">
                                                <td class="benefits-col-first">See who's viewed you</td>
                                                <td class="benefits-col-middle highlight"></td>
                                                <td></td>
                                            </tr>
                                            <tr class="even">
                                                <td class="benefits-col-first">One click search type</td>
                                                <td class="benefits-col-middle highlight"></td>
                                                <td></td>
                                            </tr>
                                            <tr class="odd">
                                                <td class="benefits-col-first">Receive SingledOut matches</td>
                                                <td class="benefits-col-middle highlight"></td>
                                                <td></td>
                                            </tr>
                                            <tr class="even">
                                                <td class="benefits-col-first">Search for matches</td>
                                                <td class="benefits-col-middle highlight"></td>
                                                <td class="highlight"></td>
                                            </tr>
                                            <tr class="odd">
                                                <td class="benefits-col-first">Create a profile and appear in search results</td>
                                                <td class="benefits-col-middle highlight"></td>
                                                <td class="highlight"></td>
                                            </tr>
                                            <tr class="even">
                                                <td class="benefits-col-first">Post a photo</td>
                                                <td class="benefits-col-middle highlight"></td>
                                                <td class="highlight"></td>
                                            </tr>
                                            <tr class="odd">
                                                <td class="benefits-col-first">Send winks</td>
                                                <td class="benefits-col-middle highlight"></td>
                                                <td class="highlight"></td>
                                            </tr>
                                            <tr class="even">
                                                <td class="benefits-col-first"> Receive text alerts for winks &amp; emails
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            
                            <hr/>
                            
                            <div class="twelve columns">

                                <div class="rate ">

                                    <div class="rate-box rate-box-left">
                                        <div class="bullet ui-checked"><input type="hidden" value="100"/></div>
                                        <div class="sub-length"><span>12</span> months</div>

                                    </div>

                                    <div class="rate-box rate-box-middle">
                                        <div class="rate-price">USD $8.13</div>

                                        <div class="rate-local">₫179670.71</div>

                                        <div class="rate-length">per month</div>
                                    </div>

                                    <div class="rate-box rate-box-right guarantee extend" data-behavior="Cortado.hover" data-init="true">
                                        <div>Save 58%<sup>1</sup></div>
                                    </div>

                                    <div class="plan-arrow"></div>
                                </div>

                                <div class="rate">

                                    <div class="rate-box rate-box-left">
                                        <div class="bullet"><input type="hidden" value="50"/></div>
                                        <div class="sub-length"><span>6</span> months</div>

                                    </div>

                                    <div class="rate-box rate-box-middle">
                                        <div class="rate-price">USD $8.33</div>

                                        <div class="rate-local">₫95032.38</div>

                                        <div class="rate-length">per month</div>
                                    </div>

                                    <div class="rate-box rate-box-right guarantee extend" data-behavior="Cortado.hover" data-init="true">
                                        <div>Save 51%<sup>1</sup></div>
                                    </div>
                                    <div class="plan-arrow"></div>
                                </div>

                                <div class="rate">

                                    <div class="rate-box rate-box-left">
                                        <div class="bullet "><input type="hidden" value="30"/></div>
                                        <div class="sub-length"><span>3</span> months</div>

                                    </div>

                                    <div class="rate-box rate-box-middle">
                                        <div class="rate-price">US$9.99</div>

                                        <div class="rate-local">₫45503.38</div>

                                        <div class="rate-length">per month</div>
                                    </div>

                                    <div class="rate-box rate-box-right guarantee extend" data-behavior="Cortado.hover" data-init="true">
                                        <div>Save 51%<sup>1</sup></div>
                                    </div>
                                    <div class="plan-arrow"></div>
                                </div>

                                <script type="text/javascript">
                                    var select = document.getElementsByClassName('bullet');
                                    $('.bullet').click(function (e) {
                                        for (var i = 0, max = select.length; i < max; i++) {
                                            if (select[i] === e.target && !select[i].classList.contains('ui-checked')) {
                                                select[i].classList.add('ui-checked');
                                                document.getElementById('payAmt').value = select[i].firstElementChild.value;
                                            } else {
                                                if (select[i].classList.contains('ui-checked')) {
                                                    select[i].classList.remove('ui-checked');
                                                }
                                            }
                                        }
                                    });


                                </script>
                            </div>

                            <div class="twelve columns">
                                <div class="panel">

                                    <form action="Checkout?type=subsc" method="POST"> 

                                        <input type="hidden" id="payAmt" name="PAYMENTREQUEST_0_AMT" value="100"/>
                                        <input type="hidden" name="userId" value="${sessionScope.infouser.id}"></input>
                                        <input type="hidden" name="currencyCodeType" value="USD"></input>
                                        <input type="hidden" name="paymentType" value="Sale"></input>
                                        <input type="image" src="img/checkout-logo-large.png" alt="Check out with PayPal"></input>
                                    </form>

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
