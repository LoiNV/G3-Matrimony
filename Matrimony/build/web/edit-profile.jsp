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

        <style>		
            .console { 
                height: 200px; 
                overflow: auto; 
            }
            .username-msg {color:orange;}
            .connect-msg {color:green;}
            .disconnect-msg {color:red;}
            .send-msg {color:#888}
        </style>

        <script src="assets/scripts/socket.io/socket.io.js" type="text/javascript"></script>
        <script src="assets/scripts/moment.min.js" type="text/javascript"></script>
        <script>

            var userName1 = 'user1_' + Math.floor((Math.random() * 1000) + 1);
            var userName2 = 'user2_' + Math.floor((Math.random() * 1000) + 1);

            var chat1Socket = io.connect('http://localhost:9999/chat1');

            function connectHandler(parentId) {
                return function () {
                    output('<span class="connect-msg">Client has connected to the server!</span>', parentId);
                }
            }

            function messageHandler(parentId) {
                return function (data) {
                    output('<span class="username-msg">' + data.userName + ':</span> ' + data.message, parentId);
                }
            }

            function disconnectHandler(parentId) {
                return function () {
                    output('<span class="disconnect-msg">The client has disconnected!</span>', parentId);
                }
            }

            function sendMessageHandler(parentId, userName, chatSocket) {
                var message = $(parentId + ' .msg').val();
                $(parentId + ' .msg').val('');

                var jsonObject = {'@class': 'chat.ChatObject',
                    userName: userName,
                    message: message};
                chatSocket.json.send(jsonObject);
            }


            chat1Socket.on('connect', connectHandler('#chat'));

            chat1Socket.on('message', messageHandler('#chat'));

            chat1Socket.on('disconnect', disconnectHandler('#chat'));

            function sendDisconnect() {
                chat1Socket.disconnect();
            }

            function sendMessage() {
                sendMessageHandler('#chat', userName1, chat1Socket);
            }

            function output(message, parentId) {
                var currentTime = "<span class='time'>" + moment().format('HH:mm:ss.SSS') + "</span>";
                var element = $("<div>" + currentTime + " " + message + "</div>");
                $(parentId + ' .console').prepend(element);
            }

        </script>
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

                                <form action="EditUsersServlet">
                                    <div class="seven columns">

                                        <!--Profile Custom Pill Tabs-->
                                        <dl class="tabs pill custom">
                                            <dd class="active"><a href="#looking-for">Infomation</a><!--<span class="notch"></span>--></dd>
                                            <dd class=""><a href="#third">Security</a></dd>
                                            <dd class=""><a href="#fourth">Contact</a></dd>
                                            <dd class="sliderEvent"><a href="#my-photos">My photos <span class="radius label alert">9</span></a></dd>
                                        </dl>
                                        <div class="clearfix"></div>

                                        <ul class="tabs-content custom">

                                            <!--First Tab Content-->
                                            <li class="active" id="looking-forTab">
                                                <input type="hidden" name="id" value="${u.id}" />
                                                <input type="hidden" name="age" value="${u.age}"  />
                                                <input type="hidden" name="status" value="${u.status}"  />
                                                <div style="padding: 0 16px;">
                                                    Name:<input type="text" name="name" value="${u.name}"  />
                                                </div>
                                                
                                                <div class="callout-speech-wrapp six columns">
                                                    <p>First Name:<input type="text" name="firstName" value="${u.firstName}"/></p>
                                                </div>

                                                <div class="callout-speech-wrapp six columns">
                                                    <p>Last Name:<input type="text" name="lastName" value="${u.lastName}"/></p>
                                                </div>
                                                
                                                <div class="callout-speech-wrapp six columns">
                                                    <p>Birth Day:<input type="text" id="datepicker" name="birthday" value="${u.birthday}"  /></p>
                                                </div>

                                                <div class="callout-speech-wrapp six columns">
                                                    <p>Gender:<input type="text" name="gender" value="${u.gender}" /></p>
                                                </div>
                                                <div class="callout-speech-wrapp six columns">
                                                    <p>Marital Status:<input type="text" name="maritalStatus" value="${u.maritalStatus}" /></p>
                                                </div>

                                                <div class="callout-speech-wrapp six columns">
                                                    <p>Height:<input type="text" name="avatar" value="${u.avatar}" /></p>
                                                </div>
                                                
                                                <div class="callout-speech-wrapp six columns">
                                                    <p>Religion:<input type="text" name="religion" value="${u.religion}" /></p>
                                                </div>

                                                <div class="callout-speech-wrapp six columns">
                                                    <p>Caste:<input type="text" name="caste" value="${u.caste}" /></p>
                                                </div>
                                                <div style="padding: 0 16px;">
                                                    <input type="submit" value="Change"/>
                                                </div>
                                            </li>
                                            <!--end First Tab Content-->

                                            <!--Second Tab Content-->

                                            <!--End Second Tab Content-->

                                            <!--Third Tab Content-->
                                            <li id="thirdTab">
                                                <div style="padding: 0 16px;">
                                                    Password:<input type="text" name="password" value="${u.password}" /><br/>
                                                </div>
                                                <div style="padding: 0 16px;">
                                                    email:<input type="text" name="email" value="${u.email}" /><br/>
                                                </div>
                                                <div class="twelve columns" style="padding: 0 16px;">
                                                    <button type="submit" name="submit" class="radius alert button">Change</button>
                                                </div>
                                            </li>
                                            <!--end Third Tab Content-->

                                            <!--Fourth Tab Content-->
                                            <li id="fourthTab">
                                                <div style="padding: 0 16px;">
                                                    Phone Number:<input type="text" name="phone" value="${u.phone}"/>
                                                </div>
                                                <div style="padding: 0 16px;">
                                                    Country:<input type="text" name="country" value="${u.country}" />
                                                </div>
                                                <div style="padding: 0 16px;">
                                                    City:<input type="text" name="city" value="${u.city}" />
                                                </div>
                                                <div style="padding: 0 16px;">
                                                    <button type="submit" id="signup" name="submit" class="radius alert button">Change</button>
                                                </div>
                                            </li>
                                            <!--end Fourth Tab Content-->

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
                                                    
                                                </div> <!--end #gallery-carousel-->

                                                <div class="four columns centered btn-carousel hide-for-small">
                                                    <small><a href="#" id="stanga-prev">PREVIOUS</a>&nbsp; | &nbsp;
                                                        <a href="#" id="dreapta-next">NEXT</a></small>
                                                </div>

                                            </li>

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

         <%@include file="mainSection_profile.jsp" %>

            <%@include file="testimonial - newsletter.jsp" %>

            <%@include file="footer.jsp" %>

            <%@include file="login.jsp" %>

            <p id="btnGoUp">Go up</p>
        </div>

        <%@include file="importScript.jsp" %>
    </body>
</html>
