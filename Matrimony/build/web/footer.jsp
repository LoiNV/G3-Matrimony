
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer>
    <div id="footer">
        <div class="row">

            <!--About us-->
            <div class="three columns section">
                <h5><i class="icon-heart"></i> About us</h5>
                <p>Lorem ipsum dolor sit amet, has an nullam sadipscing ullamcorper, nisl graeci minimum usu no, ne est erat deseruisse vituperata.</p>
                <p><i class="icon-envelope"></i> &nbsp;<a href="tel:1234567890"><span class="__cf_email__" data-cfemail="d5bcbbb3ba95a6a2b0b0a1b1b4a1b0e1a0fbb6bab8">[email&#160;protected]</span><script data-cfhash='f9e31' type="text/javascript">
                    /* <![CDATA[ */!function () {
                        try {
                            var t = "currentScript"in document ? document.currentScript : function () {
                                for (var t = document.getElementsByTagName("script"), e = t.length; e--; )
                                    if (t[e].getAttribute("data-cfhash"))
                                        return t[e]
                            }();
                            if (t && t.previousSibling) {
                                var e, r, n, i, c = t.previousSibling, a = c.getAttribute("data-cfemail");
                                if (a) {
                                    for (e = "", r = parseInt(a.substr(0, 2), 16), n = 2; a.length - n; n += 2)
                                        i = parseInt(a.substr(n, 2), 16) ^ r, e += String.fromCharCode(i);
                                    e = document.createTextNode(e), c.parentNode.replaceChild(e, c)
                                }
                                t.parentNode.removeChild(t);
                            }
                        } catch (u) {
                        }
                    }()/* ]]> */</script></a><br>&nbsp;<i class="icon-mobile-phone icon-large"></i> &nbsp;&nbsp;(123) 456-7890</p>
                <p class="footer-social-icons">Stay in touch:<br>
                    <a href="#" class="has-tip tip-bottom" data-width="210" title="Follow us on Twitter"><i class="icon-twitter-sign icon-2x"></i></a>
                    <a href="#" class="has-tip tip-bottom" data-width="210" title="Find us on Facebook"><i class="icon-facebook-sign icon-2x"></i></a>
                    <a href="#" class="has-tip tip-bottom" data-width="210" title="Find us on Google+"><i class="icon-google-plus-sign icon-2x"></i></a>
                    <a href="#" class="has-tip tip-bottom" data-width="210" title="Pin us on Pinterest"><i class="icon-pinterest-sign icon-2x"></i></a>
                    <a href="#" class="has-tip tip-bottom" data-width="210" title="Find us on LinkedIn"><i class="icon-linkedin-sign icon-2x"></i></a>
                </p>
            </div>
            <!--end about us-->

            <!--Useful links-->
            <div class="three columns section">
                <h5>Useful links</h5>
                <ul class="no-bullet">
                    <li><i class="icon-angle-right"></i> <a href="#">Terms and Conditions</a></li>
                    <li><i class="icon-angle-right"></i> <a href="#">Forgotten Username</a></li>
                    <li><i class="icon-angle-right"></i> <a href="#">Forgotten Password</a></li>
                    <li><i class="icon-angle-right"></i> <a href="#">FAQ</a></li>
                    <li><i class="icon-angle-right"></i> <a href="#">Safety</a></li>
                    <li><i class="icon-angle-right"></i> <a href="#">Affiliate</a></li>
                    <li><i class="icon-angle-right"></i> <a href="#">Privacy Policy</a></li>
                </ul>
            </div>
            <!--end useful links-->

            <!--Twitter feed-->
            <div class="three columns section">
                <h5><i class="icon-twitter"></i> Latest twitt's 1.1 API</h5>
                <!-- IMPORTANT see docs on how to create your feed -->
                <div id="twitter-feed"></div>
            </div>
            <!--end twitter feed-->

            <!--Latest from blog-->
            <div class="three columns section">
                <h5>Latest from blog</h5>
                <ul class="latest-blog">
                    <li>
                        <span class="avatar"><a href="#"><img src="assets/images/quote/user_quote_02.jpg" alt=""></a></span>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore. <a href="#">read more</a></p>
                    </li>
                    <li>
                        <span class="avatar"><a href="#"><img src="assets/images/quote/user_quote_01.jpg" alt=""></a></span>
                        <p>Ut enim ad minim veniam, quis nostrud. <a href="#">read more</a></p>
                    </li>
                    <li>
                        <span class="avatar"><a href="#"><img src="assets/images/quote/user_quote_03.jpg" alt=""></a></span>
                        <p>Duis aute irure dolor in reprehenderit in voluptate. <a href="#">read more</a></p>
                    </li>
                </ul>
            </div>
            <!--end latest from blog-->

            <div class="twelve columns">
                <hr>
                <p>Copyright &copy; 2015 . All Rights Reserved. A premium landing page from <a href="#">G3-Matrimony</a></p>
            </div>
        </div>
    </div><!--end footer-->
</footer>

<%@include file="login.jsp" %>

<c:if test="${sessionScope.login != null && sessionScope.login == 'true' && sessionScope.timeActive > 0}">    
    <%@include file="chatBox.jsp" %> 
</c:if>
<c:if test="${requestScope.alert != null}">
    <script>
        alert('${requestScope.alert}');
    </script>
</c:if>

<!--Advertisment-->

<div class="advertisment">
    <span class="close-adv ">X</span>
    <c:choose>
        <c:when test="${sessionScope.adv != null}">
            <a href="${sessionScope.adv.link}" target="_blank"><img src="${sessionScope.adv.image}"/></a>
            </c:when>
            <c:otherwise>
            <a href="#"><img src="img/default-adv.jpg" alt=""/></a>            
            </c:otherwise>
        </c:choose>

</div>
<script>
//    setTimeout(function () {
//        $('.advertisment').hide();
//    }, 10000);
    $('.close-adv').click(function () {
        $('.advertisment').hide();
    });
</script>