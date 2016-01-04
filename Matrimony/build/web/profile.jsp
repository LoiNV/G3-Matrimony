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
        <title>Sweet Date - Profile Page </title>

        <%@include file="importCSS.jsp" %>        

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
                                                <img id="avatar" src="${u.avatar}" alt="">
                                            </div>

                                        </div><!--end profile-slider-->


                                    </div><!--end profile-slider-wrapp-->
                                </div><!--end five-->


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
                                                    ${u.description}
                                                </div>
                                                <cite>good energy and a positive outlook on life</cite>
                                            </div>                                                
                                        </li>
                                        <!--end First Tab Content-->

                                        <!--First Tab Content-->
                                        <li class="" id="looking-forTab">                                             

                                            <div class="callout-speech-wrapp six columns">
                                                <h5>First Name: </h5><h3 class="sweetfont">${u.firstName}</h3>
                                            </div>

                                            <div class="callout-speech-wrapp six columns">
                                                <h5>Last Name: </h5><h3 class="sweetfont">${u.lastName}</h3>

                                            </div>

                                            <div class="callout-speech-wrapp six columns">
                                                <h5>Birth Day: </h5><h3 class="sweetfont">${u.birthday}</h3>

                                            </div>

                                            <div class="callout-speech-wrapp six columns">
                                                <c:choose>
                                                    <c:when test="${u.gender}">
                                                        <h5>Gender: </h5><h3 class="sweetfont">Male</h3>

                                                    </c:when>
                                                    <c:otherwise>
                                                        <h5>Gender: </h5><h3 class="sweetfont">FeMale</h3>

                                                    </c:otherwise>
                                                </c:choose>                                                                                                        
                                            </div>                                                 

                                            <div class="callout-speech-wrapp six columns">
                                                <h5>Phone Number: </h5><h3 class="sweetfont">${u.phone}</h3>                                                    
                                            </div>

                                            <div class="callout-speech-wrapp six columns">
                                                <h5>Email: </h5><h3 class="sweetfont">${u.email}</h3>                                                    
                                            </div>

                                            <div class="callout-speech-wrapp six columns">
                                                <h5>Religion: </h5><h3 class="sweetfont">${u.religion}</h3>

                                            </div>

                                            <div class="callout-speech-wrapp six columns">
                                                <h5>Caste: </h5><h3 class="sweetfont">${u.caste}</h3>

                                            </div>

                                        </li>
                                        <!--end First Tab Content-->                                            

                                        <!--photosTab-->
                                        <li class="mySlider" id="my-photosTab">              
                                            <div id="gallery-carousel">
                                                <c:forEach items="${listImg}" var="img">
                                                    <span class="circle">
                                                        <a href="${img.imgLink}" class="imagelink" data-rel="prettyPhoto[gallery2]">
                                                            <span class="overlay"></span>
                                                            <span class="read"><i class="icon-heart"></i></span>
                                                            <img src="${img.imgLink}" alt=""/>
                                                        </a>
                                                    </span>
                                                </c:forEach>
                                            </div><!--end #gallery-carousel-->

                                            <hr>

                                        </li>
                                        <!--end photosTab-->

                                    </ul>
                                    <div class="six columns">
                                        <c:if test="${u.status != 3 && sessionScope.timeActive >0}"> 
                                            <a href="#" id="${u.id}" class="addFriend small button radius secondary"><i class="icon-angle-right"></i> Add Friend</a>
                                        </c:if>
                                    </div>

                                    <!--end tabs-content-->
                                </div><!--end seven-->

                            </div><!--end row-->
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
