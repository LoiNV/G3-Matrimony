<%-- 
    Document   : profile
    Created on : Dec 4, 2015, 4:22:12 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                <li><a href="index.html">Home</a></li>
                                <li class="current"><a href="profile.html">Hanna Marcovick profile</a></li>
                            </ul>
                        </div>
                        <div class="three columns">
                            <ul class="inline-list right">
                                <li>Next profile </li>
                                <li><a href="#" title="Previous profile"><i class="icon-chevron-left"></i></a></li>
                                <li><a href="#" title="Next profile"><i class="icon-chevron-right"></i></a></li>
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
                            <h2 class="sweetfont left">Hanna Marcovick</h2>
                            <hr>
                            <h6 class="subheader">29 | F | Bi | Single | Bremen, Germany</h6>

                            <div class="row">
                                <div class="five columns">
                                    <!--Profile Slider-->
                                    <div class="profile-slider-wrapp">
                                        <div class="circular-item" title="Compatibility match">
                                            <small class="icon strong">match</small>
                                            <input type="text" value="74" class="greenCircle">
                                        </div>
                                        <div id="profile-slider">
                                            <div class="big-profile-image" data-thumb="assets/images/gallery-carousel/big_image_profile_00.jpg">
                                                <img src="assets/images/gallery-carousel/big_image_profile_00.jpg" alt="">
                                            </div>

                                            <div class="big-profile-image" data-thumb="assets/images/gallery-carousel/big_image_profile_08.jpg">
                                                <img src="assets/images/gallery-carousel/big_image_profile_08.jpg" alt="">
                                            </div>
                                        </div><!--end profile-slider-->
                                    </div><!--end profile-slider-wrapp-->
                                </div><!--end five-->


                                <div class="seven columns">
                                    <!--Profile Custom Pill Tabs-->
                                    <dl class="tabs pill custom">
                                        <dd class="active"><a href="#looking-for">Looking for</a><!--<span class="notch"></span>--></dd>
                                        <dd class="sliderEvent"><a href="#my-photos">My photos <span class="radius label alert">9</span></a></dd>
                                        <dd class=""><a href="#third">Third tab</a></dd>
                                        <dd class=""><a href="#fourth">Fourth tab</a></dd>
                                    </dl>
                                    <div class="clearfix"></div>

                                    <ul class="tabs-content custom">

                                        <!--First Tab Content-->
                                        <li class="active" id="looking-forTab">
                                            <div class="callout-speech-wrapp six columns">
                                                <div class="callout-speech">
                                                    The one think I most passionate about:
                                                </div>
                                                <cite>life :)</cite>
                                            </div>

                                            <div class="callout-speech-wrapp six columns">
                                                <div class="callout-speech">
                                                    The most think I am looking for in a persion is:
                                                </div>
                                                <cite>good energy and a positive outlook on life</cite>
                                            </div>
                                        </li>
                                        <!--end First Tab Content-->

                                        <!--Second Tab Content-->
                                        <li class="mySlider" id="my-photosTab">              
                                            <div id="gallery-carousel">
                                                <span class="circle">
                                                    <a href="assets/images/gallery-carousel/big_image_profile_00.jpg" class="imagelink" data-rel="prettyPhoto[gallery2]">
                                                        <span class="overlay"></span>
                                                        <span class="read"><i class="icon-heart"></i></span>
                                                        <img src="assets/images/gallery-carousel/gallery_profile_00.jpg" alt="">
                                                    </a>
                                                </span>
                                                <span class="circle">
                                                    <a href="assets/images/gallery-carousel/big_image_profile_08.jpg" class="imagelink" data-rel="prettyPhoto[gallery2]">
                                                        <span class="overlay"></span>
                                                        <span class="read"><i class="icon-heart"></i></span>
                                                        <img src="assets/images/gallery-carousel/gallery_profile_08.jpg" alt="">
                                                    </a>
                                                </span>
                                                <span class="circle">
                                                    <a href="#" class="imagelink" data-reveal-id="login_panel">
                                                        <span class="overlay"></span>
                                                        <span class="read"><i class="icon-lock"></i></span>
                                                        <img src="assets/images/gallery-carousel/gallery_profile_07.jpg" alt="">
                                                    </a>
                                                </span>
                                                <span class="circle">
                                                    <a href="#" class="imagelink" data-reveal-id="login_panel">
                                                        <span class="overlay"></span>
                                                        <span class="read"><i class="icon-lock"></i></span>
                                                        <img src="assets/images/gallery-carousel/gallery_profile_04.jpg" alt="">
                                                    </a>
                                                </span>
                                                <span class="circle">
                                                    <a href="#" class="imagelink" data-reveal-id="login_panel">
                                                        <span class="overlay"></span>
                                                        <span class="read"><i class="icon-lock"></i></span>
                                                        <img src="assets/images/gallery-carousel/gallery_profile_06.jpg" alt="">
                                                    </a>
                                                </span>
                                                <span class="circle">
                                                    <a href="#" class="imagelink" data-reveal-id="login_panel">
                                                        <span class="overlay"></span>
                                                        <span class="read"><i class="icon-lock"></i></span>
                                                        <img src="assets/images/gallery-carousel/gallery_profile_01.jpg" alt="">
                                                    </a>
                                                </span>
                                                <span class="circle">
                                                    <a href="#" class="imagelink" data-reveal-id="login_panel">
                                                        <span class="overlay"></span>
                                                        <span class="read"><i class="icon-lock"></i></span>
                                                        <img src="assets/images/gallery-carousel/gallery_profile_02.jpg" alt="">
                                                    </a>
                                                </span>
                                                <span class="circle">
                                                    <a href="#" class="imagelink" data-reveal-id="login_panel">
                                                        <span class="overlay"></span>
                                                        <span class="read"><i class="icon-lock"></i></span>
                                                        <img src="assets/images/gallery-carousel/gallery_profile_03.jpg" alt="">
                                                    </a>
                                                </span>
                                                <span class="circle">
                                                    <a href="#" class="imagelink" data-reveal-id="login_panel">
                                                        <span class="overlay"></span>
                                                        <span class="read"><i class="icon-lock"></i></span>
                                                        <img src="assets/images/gallery-carousel/gallery_profile_05.jpg" alt="">
                                                    </a>
                                                </span>
                                            </div><!--end #gallery-carousel-->

                                            <div class="four columns centered btn-carousel hide-for-small">
                                                <small><a href="#" id="stanga-prev">PREVIOUS</a>&nbsp; | &nbsp;
                                                    <a href="#" id="dreapta-next">NEXT</a></small>
                                            </div>

                                        </li>
                                        <!--End Second Tab Content-->

                                        <!--Third Tab Content-->
                                        <li id="thirdTab">
                                            <h4>Content Tab 3</h4>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                            <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                        </li>
                                        <!--end Third Tab Content-->

                                        <!--Fourth Tab Content-->
                                        <li id="fourthTab">
                                            <h4>Content Tab 4</h4>
                                        </li>
                                        <!--end Fourth Tab Content-->

                                    </ul>
                                    <!--end tabs-content-->
                                </div><!--end seven-->
                            </div><!--end row-->
                        </div><!--end twelve-->
                    </div><!--end row-->
                </div><!--end profile-->
            </section>
            <!--END PROFILE SECTION-->



            <%@include file="mainSection_profile.jsp" %>
            <%@include file="testimonial - newsletter.jsp" %>

            <%@include file="footer.jsp" %>
            
            <p id="btnGoUp">Go up</p>
        </div>

        <%@include file="importScript.jsp" %>
    </body>
</html>
