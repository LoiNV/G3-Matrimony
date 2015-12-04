           <!--Login panel-->
            <div id="login_panel" class="reveal-modal">
                <div class="row">
                    <div class="twelve columns">
                        <h5 class="pink-text"><i class="icon-user icon-large"></i> SIGN IN YOUR ACCOUNT <span class="subheader right small-link"><a href="#" data-reveal-id="register_panel" class="radius secondary small button">CREATE NEW ACCOUNT</a></span></h5>
                    </div>
                    <form id="login_form" action="Login" name="login_form" method="post" >
                        <div class="six columns">
                            <input type="text" id="username" name="username" class="inputbox" placeholder="Username" required>
                        </div>
                        <div class="six columns">
                            <input type="password" id="password" name="password" class="inputbox" placeholder="Password" required>
                        </div>
                        <p class="twelve columns">
                            <small><i class="icon-lock"></i> Your <a href="#">privacy</a> is important to us and we will never rent or sell your information.</small>
                        </p>
                        <div class="twelve columns">
                            <button type="submit" id="login" name="submit" class="radius secondary button"><i class="icon-unlock"></i> &nbsp;LOG IN</button> &nbsp; <a href="#" class="radius button facebook"><i class="icon-facebook-sign"></i> &nbsp;LOG IN WITH Facebook</a>
                        </div>
                    </form>
                    <div class="twelve columns"><hr>
                        <ul class="inline-list">
                            <li><small><a href="#" data-reveal-id="forgot_panel">FORGOT YOUR USERNAME?</a></small></li>
                            <li><small><a href="#" data-reveal-id="forgot_panel">FORGOT YOUR PASSWORD?</a></small></li>
                        </ul>
                    </div>
                </div><!--end row-->
                <a href="#" class="close-reveal-modal">×</a>
            </div><!--end login panel-->

            <!-- Register panel -->
            <div id="register_panel" class="reveal-modal">
                <div class="row">
                    <div class="twelve columns">
                        <h5 class="pink-text"><i class="icon-magic icon-large"></i> CREATE ACCOUNT <span class="subheader right small-link"><a href="#" data-reveal-id="login_panel" class="radius secondary small button">ALREADY HAVE AN ACCOUNT?</a></span></h5>	
                    </div>
                    <form id="register_form" name="register_form" method="post">
                        <div class="twelve columns">
                            <input type="text" id="reg-username" name="username" class="inputbox" placeholder="Username">
                        </div>      
                        <div class="twelve columns">
                            <input type="text" id="reg-email" name="email" class="inputbox" placeholder="Your email">
                        </div>
                        <div class="six columns">
                            <input type="password" id="reg-password" name="password" class="inputbox" placeholder="Desired password">
                        </div>
                        <div class="six columns">
                            <input type="password" id="confirm_password" name="confirm_password" class="inputbox" placeholder="Confirm password">
                        </div>

                        <div class="twelve columns"><p></p></div>

                        <div class="twelve columns">                            
                            <span class="subheader right small-link"><a href="#" data-reveal-id="register_panel_2" class="radius secondary small button">NEXT</a></span>
                        </div>
                    </form>
                </div><!--end row-->
                <a href="#" class="close-reveal-modal">×</a>
            </div>
            <!-- end register panel -->

            <!-- Register panel 2-->
            <div id="register_panel_2" class="reveal-modal">
                <div class="row">
                    <div class="twelve columns">
                        <h5 class="pink-text"><i class="icon-magic icon-large"></i> CREATE ACCOUNT </h5>	
                    </div>
                    <form id="register_form_2" name="register_form_2" method="post">
                        <div class="six columns">
                            <input type="text" id="firstname" name="firstname" class="inputbox" placeholder="Firstname">
                        </div>
                        <div class="six columns">
                            <input type="text" id="midname" name="midname" class="inputbox" placeholder="Midname">
                        </div>
                        <div class="six columns">
                            <input type="text" id="lastname" name="lastname" class="inputbox" placeholder="Lastname">
                        </div>
                        <div class="six columns">
                            <select style="height: 30px">
                                <option value="male">Male</option>
                                <option value="female">FeMale</option>
                                <option value="female">Third Gender</option>
                            </select>
                        </div>
                        <div class="twelve columns"><p></p></div>

                        <div class="twelve columns">       
                            <span class="subheader left small-link"><a href="#" data-reveal-id="register_panel" class="radius secondary small button">BACK</a></span>
                            <span class="subheader right small-link"><a href="#" data-reveal-id="register_panel_3" class="radius secondary small button">NEXT</a></span>
                        </div>
                    </form>
                </div><!--end row-->
                <a href="#" class="close-reveal-modal">×</a>
            </div>
            <!-- end register panel 2-->

            <!-- Register panel 3-->
            <div id="register_panel_3" class="reveal-modal">
                <div class="row">
                    <div class="twelve columns">
                        <h5 class="pink-text"><i class="icon-magic icon-large"></i> CREATE ACCOUNT </h5>	
                    </div>
                    <form id="register_form_3" name="register_form_3" method="post">
                        <div class="six columns">
                            <input type="text" id="birthDay" name="birthDay" class="inputbox" placeholder="BirthDay">
                        </div>
                        <div class="six columns">
                            <select style="height: 30px">
                                <option value="nevermarried">Never Married</option>
                                <option value="divorced">Divorced</option>
                                <option value="widowed">Widowed</option>
                            </select>
                        </div>
                        <div class="twelve columns">
                            <input type="text" id="street" name="street" class="inputbox" placeholder="Street">
                        </div>
                        <div class="six columns">
                            <input type="text" id="city" name="city" class="inputbox" placeholder="City">
                        </div>
                        <div class="six columns">
                            <input type="text" id="country" name="country" class="inputbox" placeholder="Country Living">
                        </div>
                        <div class="six columns">
                            <input type="text" id="religion" name="religion" class="inputbox" placeholder="Religion">
                        </div>
                        <div class="six columns">
                            <input type="text" id="mothertongue" name="mothertongue" class="inputbox" placeholder="Mother Tongue">
                        </div>
                        <div class="twelve columns">
                            <input type="text" id="phone" name="phone" class="inputbox" placeholder="Contact Number">
                        </div>
                        <div class="twelve columns">
                            <input type="text" id="caste" name="caste" class="inputbox" placeholder="Caste">
                        </div>

                        <div class="twelve columns">  
                            <p><small>Check our <a href="#"><strong>terms and conditions</strong></a> before sign up. If you familiar with our terms, go ahead click CREATE MY ACCOUNT button.</small></p>
                            <span class="subheader left small-link"><a href="#" data-reveal-id="register_panel_2" class="radius secondary small button">BACK</a></span>
                            <button type="submit" id="signup" name="submit" class="radius right alert button"><i class="icon-heart"></i> &nbsp;CREATE MY ACCOUNT</button>
                        </div>
                    </form>
                </div><!--end row-->
                <a href="#" class="close-reveal-modal">×</a>
            </div>
            <!-- end register panel 3-->

            <!-- Forgot panel -->
            <div id="forgot_panel" class="reveal-modal">
                <div class="row">
                    <div class="twelve columns">
                        <h5 class="pink-text"><i class="icon-lightbulb icon-large"></i> FORGOT YOUR DETAILS?</h5>
                    </div>
                    <form id="forgot_form" name="forgot_form" method="post" class="clearfix">
                        <div class="twelve columns">
                            <input type="text" id="forgot-email" name="email" class="inputbox" placeholder="Email Address">
                            <button type="submit" id="recover" name="submit" class="radius secondary button">SEND MY DETAILS! &nbsp;<i class="icon-envelope"></i></button>
                        </div>
                    </form>
                    <div class="twelve columns"><hr>
                        <small><a href="#" data-reveal-id="login_panel" class="radius secondary label">AAH, WAIT, I REMEMBER NOW!</a></small>
                    </div>
                </div><!--end row-->
                <a href="#" class="close-reveal-modal">×</a>
            </div><!-- end register panel -->
            <!-- end login register stuff -->

            <p id="btnGoUp">Go up</p>
        </div><!--end page-->  
