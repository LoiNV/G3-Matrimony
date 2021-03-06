<!--Login panel-->
<div id="login_panel" class="reveal-modal">
    <div class="row">
        <div class="twelve columns">
            <h5 class="pink-text"><i class="icon-user icon-large"></i> SIGN IN YOUR ACCOUNT <span class="subheader right small-link"><a href="#" data-reveal-id="register_panel" class="radius secondary small button">CREATE NEW ACCOUNT</a></span></h5>
        </div>
        <form id="login_form" action="Login?uri=${pageContext.request.requestURI}" name="login_form" method="post" >
            <div class="twelve columns">
                <input type="email" id="username" name="email" class="inputbox" placeholder="Email" required>
            </div>
            <div class="twelve columns">
                <input type="password" id="password" name="password" class="inputbox" placeholder="Password" required>
            </div>
            <p class="twelve columns">
                <small><i class="icon-lock"></i> Your <a href="#">privacy</a> is important to us and we will never rent or sell your information.</small>
            </p>
            <div class="twelve columns">
                <button type="submit" id="login" name="submit" class="radius secondary button"><i class="icon-unlock"></i> &nbsp;LOG IN</button>
            </div>
        </form>
        <div class="twelve columns"><hr>
            <ul class="inline-list">
                <li><small><a href="#" data-reveal-id="forgot_panel">FORGOT YOUR USERNAME?</a></small></li>
                <li><small><a href="#" data-reveal-id="forgot_panel">FORGOT YOUR PASSWORD?</a></small></li>
            </ul>
        </div>
    </div><!--end row-->
    <a href="#" class="close-reveal-modal">�</a>
</div><!--end login panel-->

<!--             Register panel 
-->            
<div id="register_panel" class="reveal-modal">
    <div class="row">
        <div class="twelve columns">
            <h5 class="pink-text"><i class="icon-magic icon-large"></i> CREATE ACCOUNT <span class="subheader right small-link"><a href="#" data-reveal-id="login_panel" class="radius secondary small button">ALREADY HAVE AN ACCOUNT?</a></span></h5>	
        </div>
        <form id="register_form" action="UsersCreateSevlet" name="register_form" method="post">

            <div class="twelve columns">
                <input type="text" id="reg-username" name="username" class="inputbox" placeholder="Usear Name" required>
            </div>
            <div class="twelve columns">
                <input type="email" id="username" name="email" class="inputbox" placeholder="Email" required>
            </div>
            <div class="twelve columns">
                <input type="password" id="reg-password" name="password" class="inputbox" placeholder="Password" required>
            </div>
            <div class="six columns">
                <input type="text" id="datepicker" name="birthday" class="inputbox" placeholder="Birth Day" required>
            </div>
            <div class="six columns">
                <select name="gender" style="height: 30px;color:#999999;border-color: #cccccc;font-size:10pt">
                    <option value="True">Male</option>
                    <option value="False">Female</option>
                </select>
            </div>
            <div class="twelve columns">
                <p><small>Check our <a href="#"><strong>terms and conditions</strong></a> before sign up. If you familiar with our terms, go ahead click CREATE MY ACCOUNT button.</small></p>
                <button type="submit" id="signup" name="submit" class="radius alert button"><i class="icon-heart"></i> &nbsp;CREATE MY ACCOUNT</button>
            </div>
        </form>
    </div>
    <a href="#" class="close-reveal-modal">�</a>
</div>
<!--
             end register panel -->

<!-- Forgot panel -->
<div id="forgot_panel" class="reveal-modal">
    <div class="row">
        <div class="twelve columns">
            <h5 class="pink-text"><i class="icon-lightbulb icon-large"></i> FORGOT YOUR DETAILS?</h5>
        </div>
        <form id="forgot_form" name="forgot_form" method="post" class="clearfix">
            <div class="twelve columns">
                <input type="email" id="forgot-email" name="email" class="inputbox" placeholder="Email Address">
                <button type="submit" id="recover" name="submit" class="radius secondary button">SEND MY DETAILS! &nbsp;<i class="icon-envelope"></i></button>
            </div>
        </form>
        <div class="twelve columns"><hr>
            <small><a href="#" data-reveal-id="login_panel" class="radius secondary label">AAH, WAIT, I REMEMBER NOW!</a></small>
        </div>
    </div><!--end row-->
    <a href="#" class="close-reveal-modal">�</a>
</div><!-- end register panel -->
<!-- end login register stuff -->

<!-- Forgot panel -->
<div id="repass_panel" class="reveal-modal">
    <div class="row">
        <div class="twelve columns">
            <h5 class="pink-text"><i class="icon-lightbulb icon-large"></i> CHANGE YOUR PASSWORD?</h5>
        </div>
        <form id="repass_form" action="" name="repass_form" method="post" class="clearfix">
            <div class="twelve columns">                
                <input type="text" id="oldpass" name="oldpass" class="inputbox" placeholder="Old Password">
                <input type="text" id="newpass"  name="newpass" class="inputbox" placeholder="New Password">
                <input type="text" id="confirm"  name="confirm" class="inputbox" placeholder="Confirm Password">
                <button type="submit" id="btn_Change" name="submit" class="radius secondary button">Save Change</button>
            </div>
        </form>
        <script>
            $(document).ready(function () {

                $('#btn_Change').on('click', function (evt) {
                    var op = document.getElementById('oldpass').value;
                    var np = document.getElementById('newpass').value;
                    var cp = document.getElementById('confirm').value;
                    if (op.trim() === '' || np.trim() === '' || cp.trim() === '') {
                        alert('Input not empty');
                    } else {
                        $.get('/Matrimony/ChangePass', {oldpass: op, newpass: np, confirm: cp}, function (data) {
                            alert(data);
                        });
                        $('#repass_panel').show();
                    }

                });
            });

        </script>
    </div><!--end row-->
    <a href="#" class="close-reveal-modal">x</a>
</div><!-- end register panel -->

<p id="btnGoUp">Go up</p>

