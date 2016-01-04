
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <div class="header-bg">
        <!--Top links-->
        <div class="top-links">
            <div class="row">
                <ul class=" block-grid">
                    <li class="nine columns"><a href="#"><i class="icon-envelope"></i> &nbsp; <span class="__cf_email__" data-cfemail="7a13141c153a090d1f1f0e1e1b0e1f4e0f54191517">[email&#160;protected]</span><script data-cfhash='f9e31' type="text/javascript">
                        /* <![CDATA[ */!function(){try{var t = "currentScript"in document?document.currentScript:function(){for (var t = document.getElementsByTagName("script"), e = t.length; e--; )if (t[e].getAttribute("data-cfhash"))return t[e]}(); if (t && t.previousSibling){var e, r, n, i, c = t.previousSibling, a = c.getAttribute("data-cfemail"); if (a){for (e = "", r = parseInt(a.substr(0, 2), 16), n = 2; a.length - n; n += 2)i = parseInt(a.substr(n, 2), 16) ^ r, e += String.fromCharCode(i); e = document.createTextNode(e), c.parentNode.replaceChild(e, c)}t.parentNode.removeChild(t); }} catch (u){}}()/* ]]> */</script></a></li>
                    <li class="three columns hide-for-small">
                        Find us on: &nbsp;
                        <a href="#" class="has-tip tip-bottom" data-width="210" title="Follow us on Twitter"><i class="icon-twitter"></i></a>
                        <a href="#" class="has-tip tip-bottom" data-width="210" title="Find us on Facebook"><i class="icon-facebook"></i></a>
                        <a href="#" class="has-tip tip-bottom" data-width="210" title="Find us on Google+"><i class="icon-google-plus"></i></a>
                        <a href="#" class="has-tip tip-bottom" data-width="210" title="Pin us on Pinterest"><i class="icon-pinterest"></i></a>
                        <a href="#" class="has-tip tip-bottom" data-width="210" title="Find us on LinkedIn"><i class="icon-linkedin"></i></a>
                    </li>

                </ul>

            </div>


        </div>

        <!--end top-links-->

        <div id="header">
            <div class="row">

                <!-- Main Navigation -->
                <div class="five columns push-four">
                    <div class="space-b-20 hide-for-small">&nbsp;</div>
                    <nav class="top-bar">
                        <ul>
                            <!-- Toggle Button Mobile -->
                            <li class="name">
                                <h1><a href="#">Please select your page</a></h1>
                            </li>
                            <li class="toggle-topbar"><a href="#"><i class="icon-reorder"></i></a></li>
                            <!-- End Toggle Button Mobile -->
                        </ul>

                        <section><!-- Nav Section -->
                            <ul class="left">
                                <li><a href="index.jsp"><i class="icon-home"></i> HOME</a></li> 
                                <li class="has-dropdown">
                                    <a href="#">PAGES</a>
                                    <ul class="dropdown">
                                        <li><a href="search-listing.jsp">Search Match</a></li>
                                        <li><a href="blog.jsp">Blog Page</a></li>
                                        <li><a href="createCustomer.jsp">Register Advertisement</a></li>
                                    </ul>
                                </li>
                                <c:if test="${sessionScope.login != null && sessionScope.login == 'true' && sessionScope.timeActive > 0}">
                                    <li><a href="MatchSingle">MATCH</a></li>
                                </c:if>                                
                                <li class="">
                                    <a href="subscription.jsp?uri=subscription.jsp">SUBSCRIPTION</a>                                    
                                </li>
                            </ul>
                        </section><!-- End Nav Section -->
                    </nav>
                </div>
                <!-- end Main Navigation -->

                <!-- Logo -->
                <div class="four columns pull-five">
                    <h1 id="logo">A premium landing page made for Lovers
                        <a href="index.jsp"><img src="assets/images/logo.png" width="294" height="108" alt="Landing Page"></a>
                    </h1>
                </div>
                <!--end logo-->

                <!-- Login/Register/Forgot username/password Modal forms
                -  Hidded by default to be opened through modal
              -  For faster loading we put all forms at the bottom of page -->

                <c:choose>
                    <c:when test="${sessionScope.login != null && sessionScope.login == 'true'}">
                        <div class="three columns">
                            <div id="demo">
                                <div class="wrapper">
                                    <div class="content">
                                        <ul class="">
                                            <li><a href="#" data-reveal-id="repass_panel">Change password</a></li>
                                            <li><a href="FindIdUser?id=${sessionScope.infouser.id}">Edit profile</a></li>
                                            <li><a href="Logout">Logout</a></li>
                                        </ul>
                                    </div>

                                    <div class="parent">
                                        <span class="avt">                                        
                                            <img id="avatar" style="width: 30px; height: 30px;" src="${sessionScope.infouser.avatar}"/>
                                        </span>
                                        <span  class="username" id="${sessionScope.infouser.id}" name="${sessionScope.infouser.name}">Hi, ${sessionScope.infouser.name}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <!--Login buttons-->  
                        <div class="three columns login-buttons">
                            <div class="space-b-20 hide-for-small">&nbsp;</div>	
                            <ul class="button-group radius right">
                                <li><a href="#" data-reveal-id="login_panel" class="small secondary button radius"><i class="icon-user hide-for-medium-down"></i> LOG IN</a></li>
                                <li><a href="#" data-reveal-id="register_panel" class="small button radius"><i class="icon-group hide-for-medium-down"></i> SIGN UP</a></li>
                            </ul>
                        </div>
                        <!--end login buttons-->
                    </c:otherwise>
                </c:choose>

                <div class="twelve columns">
                    <div class="row">

                        <!--Form wrapper-->
                        <div class="five columns form-wrapper">
                            <div class="form-header">
                                <p class="lead text-resize">Serious dating with <strong>SweetDate4u</strong><br>Your perfect match is just a click away</p>
                            </div>
                            <!--Search form-->
                            <form action="UsersFindServlet" method="post" class="custom form-search">
                                <input name="name" type="hidden" value=" "/>
                                <input name="city" type="hidden" value=" "/>
                                <input name="country" type="hidden" value=" "/>
                                <div class="row">
                                    <div class="five mobile-four columns">
                                        <label class="right inline">I am:</label>
                                    </div>
                                    <div class="seven mobile-four columns">
                                        <select class="expand">
                                            <option selected="selected">Man</option>
                                            <option>Woman</option>
                                        </select>
                                    </div>
                                </div><!--end row-->
                                <div class="row">
                                    <div class="five mobile-four columns">
                                        <label class="right inline">Searching for:</label>
                                    </div>
                                    <div class="seven mobile-four columns">
                                        <select class="expand" name="gender">
                                            <option value="false" selected="selected">Woman</option>
                                            <option value="true">Man</option>
                                        </select>
                                    </div>
                                </div><!--end row-->
                                <div class="row">
                                    <div class="five mobile-one columns">
                                        <label class="right inline">Age:</label>
                                    </div>
                                    <div class="three mobile-one columns">
                                        <select class="expand customDropdown" name="age1">
                                            <option value="18" selected="selected" >18</option>
                                            <c:forEach begin="19" end="60" var="age">
                                                <option value="${age}">${age}</option>
                                            </c:forEach>  
                                        </select>
                                    </div>
                                    <div class="one mobile-one columns text-center">
                                        <label class="inline">to</label>
                                    </div>
                                    <div class="three mobile-one columns">
                                        <select class="expand customDropdown" name="age2">
                                            <option value="25" selected="selected">25</option>
                                            <c:forEach begin="18" end="60" var="age">
                                                <option value="${age}">${age}</option>
                                            </c:forEach>  
                                        </select>
                                    </div>
                                </div><!--end row-->

                                <div class="row">
                                    <div class="seven offset-by-five columns"><button class="button radius"><i class="icon-search"></i> &nbsp;SEARCH</button></div>
                                </div>
                                <span class="notch"></span>
                            </form>
                            <!--end search form-->
                            <!--Form footer-->
                            <div class="form-footer silver-bg">
                                <p><em>or</em> <strong>choose from last profile entries</strong>
                                    <span class="right hide-for-small">
                                        <a href="#" id="profile-thumbs-prev"><i class="icon-circle-arrow-left icon-large"></i></a>&nbsp;
                                        <a href="#" id="profile-thumbs-next"><i class="icon-circle-arrow-right icon-large"></i></a>
                                    </span>
                                </p>
                                <div class="clearfix"></div>

                                <div class="carousel-profiles responsive">
                                    <ul id="profile-thumbs">
                                        <c:forEach items="${list}" var="u">
                                            <li><a href="Profile?uri=Profile?id=${p.id}&id=${p.id}"><img style="height: 93px; width: 93px;" src="${u.avatar}" alt=""></a></li>
                                                </c:forEach>
                                    </ul>
                                </div><!--end carousel-profiles-->
                            </div><!--end form-footer-->

                        </div><!--end form-wrapper-->
                    </div><!--end row-->
                </div><!--end twelve-->
            </div><!--end row-->
        </div><!--end #header-->
    </div><!--end header-bg-->
</header>
