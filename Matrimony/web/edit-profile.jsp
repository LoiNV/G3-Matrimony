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
                                                    <p>Birth Day:<input type="text" name="birthday" value="${u.birthday}"  /></p>
                                                </div>

                                                <div class="callout-speech-wrapp six columns">
                                                    <p>Gender:<input type="text" name="gender" value="${u.gender}" /></p>
                                                </div>
                                                <div class="callout-speech-wrapp six columns">
                                                    <p>Marital Status:<input type="text" name="maritalStatus" value="${u.maritalStatus}" /></p>
                                                </div>

                                                <div class="callout-speech-wrapp six columns">
                                                    <p>Height:<input type="text" name="height" value="${u.height}" /></p>
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
                                                <div style="padding: 0 16px;">
                                                    <input type="submit" value="Change"/>
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
                                                    <input type="submit" value="Change"/>
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





            <!-- MAIN SECTION
            ================================================ -->
            <section>
                <div id="main">
                    <div class="row">

                        <div class="seven columns">

                            <!--Info Tabs-->
                            <dl class="tabs info three-up">
                                <dd class="active"><a href="#simple1">Info</a></dd>
                                <dd><a href="#simple2">Messages <span class="radius label">14</span></a></dd>
                                <dd><a href="#simple3"><i class="icon-star-empty"></i> Favorites</a></dd>
                            </dl>

                            <!--Content Info Tabs-->
                            <ul class="tabs-content">
                                <!--First Info Tab Content-->
                                <li class="active" id="simple1Tab">
                                    <ul class="accordion">
                                        <li>
                                            <h5 class="accordion-title">My self-summary<span class="accordion-icon"></span></h5>
                                            <div class="accordion-content">
                                                <p>Hello and welcome to the profile of your next true love. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<br><br>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p><br>
                                                <h6>Favorite books, movies, shows, music and food</h6>
                                                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p><br>
                                                <h6>The six things I could never do without</h6>
                                                <ul class="love-list">
                                                    <li>Love</li>
                                                    <li>My work - Graphic and Web design</li>
                                                    <li>My best friends and true confidante John Arthur</li>
                                                    <li>Lorem ipsum dolor sit amet, consectetur adipisicing</li>
                                                    <li>Duis aute irure dolor</li>
                                                    <li>Excepteur sint occaecat cupidatat</li>
                                                </ul>
                                            </div>
                                        </li>

                                        <li>
                                            <h5 class="accordion-title">Life style<span class="accordion-icon"></span></h5>
                                            <div class="accordion-content">
                                                <dl class="dl-horizontal">
                                                    <dt>Interests</dt>
                                                    <dd>RV, Art Enthusiast, Billiards, Horses/Equine, Music, Business, Writing, Snorkelling, Tenis, Gardening, Dogs, Cats, Antiques, Decorating.</dd>
                                                    <dt>Favorite Vacations Spot</dt>
                                                    <dd>Hawaii</dd>
                                                    <dt>Ideal First Date</dt>
                                                    <dd>Dinner on the beach</dd>
                                                    <dt>Looking for</dt>
                                                    <dd>Cyber Affair/Erotic Chat</dd>
                                                    <dt>Staus</dt>
                                                    <dd>Single</dd>
                                                    <dt>Smoking</dt>
                                                    <dd>Never</dd>
                                                    <dt>Language</dt>
                                                    <dd>English, Spanish, German, Portuguese</dd>
                                                </dl>
                                            </div>
                                        </li>

                                        <li>
                                            <h5 class="accordion-title">Physical<span class="accordion-icon"></span></h5>
                                            <div class="accordion-content">
                                                <dl class="dl-horizontal">
                                                    <dt>Height</dt>
                                                    <dd>5'4</dd>
                                                    <dt>Hair Color</dt>
                                                    <dd>Dark Brown</dd>
                                                    <dt>Eye Color</dt>
                                                    <dd>Blue</dd>
                                                    <dt>Body Type</dt>
                                                    <dd>Pette</dd>
                                                    <dt>Weight</dt>
                                                    <dd>140</dd>
                                                    <dt>Ethnicity</dt>
                                                    <dd>European</dd>
                                                    <dt>Age</dt>
                                                    <dd>29</dd>
                                                    <dt>Best Feature</dt>
                                                    <dd>Silky smooth hair</dd>
                                                </dl>
                                            </div>
                                        </li>
                                    </ul>
                                </li>

                                <!--Second Info Tab Content-->
                                <li id="simple2Tab">

                                    <div class="messages">
                                        <h4>You have (5) sweet messages:</h4>

                                        <!--Messages Lists-->
                                        <ol class="messages-list">

                                            <li class="message">
                                                <div class="avatar">
                                                    <img src="assets/images/profile-carousel/thumb_01.jpg" width="50" height="50" alt="Avatar">
                                                </div>
                                                <div class="message-meta">
                                                    <h5 class="author"><a href="#">Davaki L. says:</a> - <a href="#" class="message-reply-link show-form"><i class="icon-reply"></i> Message to</a> - <a href="#" class="message-reply-link"><i class="icon-star-empty"></i> Favorite</a></h5>
                                                    <p class="date">January 06, 2011</p>
                                                </div>
                                                <div class="message-body clearfix">
                                                    <p>Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus.</p>
                                                </div>

                                                <!--Reply message form-->
                                                <form action="#" method="post" class="leave-message clearfix">
                                                    <fieldset>
                                                        <legend>Write me a sweet message :)</legend>
                                                        <div class="row">
                                                            <div class="six columns">
                                                                <label>Name<span> (required)</span></label>
                                                                <input type="text" name="msg-name" id="msg-name" required>
                                                            </div>
                                                            <div class="six columns">
                                                                <label>E-mail<span> (required)</span></label>
                                                                <input type="email" name="msg-email" id="msg-email" required>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="twelve columns">
                                                                <label>Message<span> (required)</span></label>
                                                                <textarea required></textarea>
                                                            </div>
                                                        </div>

                                                        <button type="submit" class="radius button right">Send message</button>
                                                    </fieldset>          
                                                </form><!--end Reply message form-->
                                            </li>

                                            <li class="message">
                                                <div class="avatar">
                                                    <img src="assets/images/profile-carousel/thumb_02.jpg" width="50" height="50" alt="Avatar">
                                                </div>
                                                <div class="message-meta">
                                                    <h5 class="author"><a href="#">Davaki L. says:</a> - <a href="#" class="message-reply-link"><i class="icon-reply"></i> Message to</a> - <a href="#" class="message-reply-link"><i class="icon-star"></i> Favorite</a></h5>
                                                    <p class="date">January 06, 2011</p>
                                                </div>
                                                <div class="message-body">
                                                    <p>Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus.</p>
                                                </div>
                                            </li>

                                            <li class="message">
                                                <div class="avatar">
                                                    <img src="assets/images/profile-carousel/thumb_03.jpg" width="50" height="50" alt="Avatar">
                                                </div>
                                                <div class="message-meta">
                                                    <h5 class="author"><a href="#">Davaki L. says:</a> - <a href="#" class="message-reply-link"><i class="icon-reply"></i> Message to</a> - <a href="#" class="message-reply-link"><i class="icon-star"></i> Favorite</a></h5>
                                                    <p class="date">January 06, 2011</p>
                                                </div>
                                                <div class="message-body">
                                                    <p>Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus.</p>
                                                </div>
                                            </li>

                                            <li class="message">
                                                <div class="avatar">
                                                    <img src="assets/images/profile-carousel/thumb_12.jpg" width="50" height="50" alt="Avatar">
                                                </div>
                                                <div class="message-meta">
                                                    <h5 class="author"><a href="#">Davaki L. says:</a> - <a href="#" class="message-reply-link"><i class="icon-reply"></i> Message to</a> - <a href="#" class="message-reply-link"><i class="icon-star-empty"></i> Favorite</a></h5>
                                                    <p class="date">January 06, 2011</p>
                                                </div>
                                                <div class="message-body">
                                                    <p>Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus.</p>
                                                </div>

                                                <!--Message Reply-->
                                                <ul class="children">
                                                    <li class="message">
                                                        <div class="avatar">
                                                            <img src="assets/images/profile-carousel/thumb_13.jpg" width="50" height="50" alt="Avatar">
                                                        </div>
                                                        <div class="message-meta">
                                                            <h5 class="author"><a href="#">John Doe</a> - <a href="#" class="message-reply-link"><i class="icon-reply"></i> Message to</a></h5>
                                                            <p class="date">January 06, 2011</p>
                                                        </div>
                                                        <div class="message-body">
                                                            <p>Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus.</p>
                                                        </div>
                                                    </li>
                                                </ul><!--end Message Reply-->
                                            </li>

                                        </ol><!--end messages-list-->
                                    </div><!--end messages-->
                                </li><!--end simple2Tab-->

                                <!--Third Info Tab Content-->
                                <li id="simple3Tab">
                                    <ol class="messages-list">          		
                                        <li class="message">
                                            <div class="avatar">
                                                <img src="assets/images/profile-carousel/thumb_02.jpg" width="50" height="50" alt="Avatar">
                                            </div>
                                            <div class="message-meta">
                                                <h5 class="author"><a href="#">Davaki L. says:</a> - <a href="#" class="message-reply-link"><i class="icon-reply"></i> Message to</a> - <a href="#" class="message-reply-link"><i class="icon-star"></i> Favorite</a></h5>
                                                <p class="date">January 06, 2011</p>
                                            </div>
                                            <div class="message-body">
                                                <p>Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus.</p>
                                            </div>
                                        </li>
                                        <li class="message">
                                            <div class="avatar">
                                                <img src="assets/images/profile-carousel/thumb_03.jpg" width="50" height="50" alt="Avatar">
                                            </div>
                                            <div class="message-meta">
                                                <h5 class="author"><a href="#">Davaki L. says:</a> - <a href="#" class="message-reply-link"><i class="icon-reply"></i> Message to</a> - <a href="#" class="message-reply-link"><i class="icon-star"></i> Favorite</a></h5>
                                                <p class="date">January 06, 2011</p>
                                            </div>
                                            <div class="message-body">
                                                <p>Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus.</p>
                                            </div>
                                        </li>
                                    </ol>
                                </li>
                            </ul><!--end Content Info Tabs-->
                        </div><!--end seven-->





                        <!-- SIDEBAR SECTION
                                    ================================================ -->
                        <aside class="four columns offset-by-one hide-for-small">

                            <!--Widgets Container-->
                            <div class="widgets-container">

                                <div class="widgets clearfix">
                                    <h5>Our Blog Categories</h5>
                                    <ul class="widget-list">
                                        <li><a href="#">First date</a></li>
                                        <li><a href="#">Dating guidelines</a></li>
                                        <li><a href="#">Success stories</a></li>
                                        <li><a href="#">Prespiciatis</a></li>
                                        <li><a href="#">Lorem ipsum dolor sit</a></li>
                                    </ul>
                                </div>

                                <div class="widgets clearfix">
                                    <h5>Advertise here</h5>
                                    <a href="http://bit.ly/152m2RU" title="Wordpress Dating Theme"><img src="assets/images/sweetdate_wordpress_buddypress_300x250.png" width="300" height="250" alt="Wordpress Dating Theme"></a>
                                </div>

                                <div class="widgets clearfix">
                                    <h5>Latest Profile Entries</h5>
                                    <br>
                                    <ul class="block-grid three-up latest-entries">
                                        <li><span class="avatar"><a href="#" title="Dating profile 1"><img src="assets/images/profile-carousel/thumb_01.jpg" alt="Dating profile 1"></a></span></li>
                                        <li><span class="avatar"><a href="#" title="Dating profile 2"><img src="assets/images/profile-carousel/thumb_02.jpg" alt="Dating profile 2"></a></span></li>
                                        <li><span class="avatar"><a href="#" title="Dating profile 3"><img src="assets/images/profile-carousel/thumb_03.jpg" alt="Dating profile 3"></a></span></li>
                                        <li><span class="avatar"><a href="#" title="Dating profile 4"><img src="assets/images/profile-carousel/thumb_04.jpg" alt="Dating profile 4"></a></span></li>
                                        <li><span class="avatar"><a href="#" title="Dating profile 5"><img src="assets/images/profile-carousel/thumb_05.jpg" alt="Dating profile 5"></a></span></li>
                                        <li><span class="avatar"><a href="#" title="Dating profile 6"><img src="assets/images/profile-carousel/thumb_06.jpg" alt="Dating profile 6"></a></span></li>
                                    </ul>
                                </div>

                                <div class="widgets clearfix">
                                    <h5>Our Text</h5>
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.<br><br>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
                                    <a href="http://www.lipsum.com/" target="_blank">Learn about</a>
                                </div>

                            </div> <!--end Widgets Container-->
                        </aside> <!--end four columns-->
                        <!--END SIDEBAR SECTION-->

                    </div><!--end row-->
                </div><!--end main-->
            </section>
            <!--END MAIN SECTION-->

            <%@include file="testimonial - newsletter.jsp" %>

            <%@include file="footer.jsp" %>

            <%@include file="login.jsp" %>

            <p id="btnGoUp">Go up</p>
        </div>

        <%@include file="importScript.jsp" %>
    </body>
</html>
