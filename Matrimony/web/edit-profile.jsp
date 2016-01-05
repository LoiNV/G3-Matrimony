<%-- 
    Document   : profile
    Created on : Dec 4, 2015, 4:22:12 PM
    Author     : Admin
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Sweet Date - My Profile Page </title>

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
                                <li class="current"><a href="#">${u.name} profile</a></li>
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
                            <h2 class="sweetfont left">${u.name}</h2>
                            <hr>
                            <h6 class="subheader">${u.age} | ${u.maritalStatus} | ${u.city}, ${u.country}</h6>

                            <div class="row">
                                <div class="five columns">
                                    <!--Profile Slider-->
                                    <div class="profile-slider-wrapp" style="height: 300px;">                                        
                                        <div id="profile-slider">
                                            <div class="big-profile-image" >
                                                <img id="avatar" src="${sessionScope.infouser.avatar}" alt="">
                                            </div>

                                        </div><!--end profile-slider-->
                                    </div><!--end profile-slider-wrapp-->
                                    <h3 style="color:red; margin-left: 15px">Active: ${sessionScope.timeActive} Days <br/><a style="margin-left: 20px;" href="subscription.jsp?uri=subscription.jsp"> Subscription</a></h3>
                                </div><!--end five-->

                                <form action="EditUsersServlet" method="post">
                                    <div class="seven columns">

                                        <!--Profile Custom Pill Tabs-->
                                        <dl class="tabs pill custom">
                                            <dd class="active"><a href="#third">Looking-for</a></dd>
                                            <dd class=""><a href="#looking-for">Information</a></dd>  
                                            <dd class="sliderEvent"><a href="#my-photos">My photos <span class="radius label alert">${listImg.size()}</span></a></dd>
                                        </dl>
                                        <div class="clearfix"></div>

                                        <ul class="tabs-content custom">

                                            <!--First Tab Content-->
                                            <li class="active" id="thirdTab">                                            

                                                <div class="callout-speech-wrapp eight columns">
                                                    <div class="callout-speech">
                                                        <input style="height: 50px" type="text" name="desc" value="${u.description}" />
                                                    </div>
                                                    <cite>good energy and a positive outlook on life</cite>
                                                </div>
                                                <div style="padding: 30px 16px;">
                                                    <input type="submit" value="Change"/>
                                                </div>
                                            </li>
                                            <!--end First Tab Content-->

                                            <!--First Tab Content-->
                                            <li class="" id="looking-forTab">
                                                <input type="hidden" name="id" value="${u.id}" />                                              

                                                <div style="padding: 0 16px;">
                                                    Nick Name:<input type="text" name="name" value="${u.name}" required/>
                                                </div>

                                                <div class="callout-speech-wrapp six columns">
                                                    <p>First Name:<input type="text" name="firstName" value="${u.firstName}"/></p>
                                                </div>

                                                <div class="callout-speech-wrapp six columns">
                                                    <p>Last Name:<input type="text" name="lastName" value="${u.lastName}"/></p>
                                                </div>

                                                <div class="callout-speech-wrapp twelve columns">
                                                    <p>Birth Day:<input type="text" id="datepicker" name="birthday" value="${u.birthday}" class="inputbox" placeholder="Birth Day" required/></p>
                                                </div>

                                                <div class="six columns">Gender:
                                                    <select name="gender" style="height: 30px;color:#999999;border-color: #cccccc;font-size:10pt;">
                                                        <c:choose>
                                                            <c:when test="${u.gender}">
                                                                <option value="True">Male</option>
                                                                <option value="False">Female</option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="False">Female</option>
                                                                <option value="True">Male</option>
                                                            </c:otherwise>
                                                        </c:choose>   
                                                    </select>
                                                </div>

                                                <div class="callout-speech-wrapp six columns">Marital Status:
                                                    <select name="maritalStatus" style="height: 30px;color:#999999;border-color: #cccccc;font-size:10pt;">
                                                        <c:choose>
                                                            <c:when test="${u.maritalStatus eq 'Single'}">
                                                                <option value="Single">Single</option>
                                                                <option value="Married">Married</option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="Married">Married</option>
                                                                <option value="Single">Single</option>
                                                            </c:otherwise>
                                                        </c:choose>  

                                                    </select>
                                                </div>   

                                                <div style="padding: 0 16px;">
                                                    Phone Number:<input type="text" name="phone" value="${u.phone}" pattern="[0]{1}\d{9,10}"/>
                                                </div>

                                                <div class="callout-speech-wrapp six columns">
                                                    Country:<input type="text" name="country" value="${u.country}" />
                                                </div>

                                                <div class="callout-speech-wrapp six columns">
                                                    City:<input type="text" name="city" value="${u.city}" />
                                                </div>            

                                                <div style="padding: 0 16px;">
                                                    <p>Religion:<input type="text" name="religion" value="${u.religion}" /></p>
                                                </div>

                                                <div style="padding: 0 16px;">
                                                    <p>Caste:<input type="text" name="caste" value="${u.caste}" /></p>
                                                </div>

                                                <div style="padding: 0 16px;">
                                                    <input type="submit" value="Change"/>
                                                </div>
                                            </li>
                                            <!--end First Tab Content-->                                            

                                            <!--photosTab-->
                                            <li class="mySlider" id="my-photosTab">              
                                                <div id="gallery-carousel">
                                                    <c:forEach items="${listImg}" var="img">
                                                        <span class="circle">
                                                            <a href="${img.imgLink}" id ="${img.id}" class="imagelink" data-rel="prettyPhoto[gallery2]">
                                                                <span class="overlay"></span>
                                                                <span class="read"><i class="icon-heart"></i></span>
                                                                <img src="${img.imgLink}" alt=""/>
                                                            </a>
                                                        </span>
                                                    </c:forEach>
                                                </div><!--end #gallery-carousel-->

                                                <hr>

                                                <div class="twelve columns">
                                                    <form enctype="multipart/form-data">
                                                        <div class="form-group">
                                                            <input id="file_1" name="file" type="file" multiple class="file">
                                                        </div>                                                                                                                                                                
                                                    </form>

                                                    <script>
                                                        $("input[type=text]").on("change", function () {
                                                            this.value = this.value.trim();
                                                        });

                                                        $("#file_1").fileinput({
                                                            uploadUrl: 'http://localhost:8080/Matrimony/UpLoad',
                                                            allowedFileExtensions: ['jpg', 'png', 'gif'],
                                                            maxFilesNum: 4,
                                                            //allowedFileTypes: ['image', 'video', 'flash'],                                                            
                                                            slugCallback: function (filename) {
                                                                return filename.replace('(', '_').replace(']', '_');
                                                            }
                                                        });
                                                        $('.fileinput-upload-button').click(function () {
                                                            setTimeout(function () {
                                                                location.reload();
                                                            }, 1000);
                                                        });
                                                        $(document).ready(function () {

                                                            $('a.imagelink').click(function (ev) {
                                                                if ($('.pp_details').length > 0) {
                                                                    $('.pp_details').prepend('<a class="pp_avt" title="Set avatar" href="#">');
                                                                    $('.pp_details').prepend('<a class="pp_del" title="Del avatar" href="#">');
                                                                    $('a.pp_avt').bind('click', function () {
                                                                        $.get("/Matrimony/SetAvatar", {imgPath: $('#fullResImage').attr("src")}, function () {
                                                                        });
                                                                        $('img#avatar').attr("src", $('#fullResImage').attr("src"));
                                                                        $.prettyPhoto.close();
                                                                        return false;
                                                                    });
                                                                    var imgId = this.id;
                                                                    $('a.pp_del').bind('click', function () {

                                                                        if (confirm('Are you sure delete?')) {
                                                                            $.get("/Matrimony/delImage", {imgID: imgId}, function (data) {
                                                                                alert(data);
                                                                                setTimeout(function () {
                                                                                    location.reload();
                                                                                }, 500);
                                                                            });
                                                                            $.prettyPhoto.close();
                                                                            return false;
                                                                        }

                                                                    });
                                                                }
                                                            });
                                                        });


                                                    </script>
                                                </div>

                                            </li>
                                            <!--end photosTab-->

                                        </ul>

                                        <!--end tabs-content-->
                                    </div><!--end seven-->
                                </form>
                            </div><!--end row-->
                        </div><!--end twelve-->
                    </div><!--end row-->
                </div><!--end profile-->
            </section>
            <!--END PROFILE SECTION-->
            <%
                if (request.getParameter("alert") != null) {
            %>
            <script>alert('<%=request.getParameter("alert")%>');</script>
            <%
                }
            %>


            <%@include file="testimonial - newsletter.jsp" %>

            <%@include file="footer.jsp" %>

            <p id="btnGoUp">Go up</p>
        </div>

        <%@include file="importScript.jsp" %>
    </body>
</html>
