<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- Self defined css, js file -->
	<link type="text/css" rel="stylesheet" href="style.css" />
	<script src="interactive_js.js"></script>
	<script src="https://www.google.com/recaptcha/api.js" async defer></script>
	<title>Welcome</title>
</head>

<body id="registerBody">
	<img class="full-screen" src="images/leaves.jpg">
	
	 <div class="caption">
	     <p>Welcome to, Group04</p>
	 </div>
	        
	<div class="container" style="display: none;"> <!--login form http://bootsnipp.com/snippets/featured/login-and-register-tabbed-form -->
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">Login</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">Register</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<!-- Login form -->
								<form id="login-form" action="Homepage" method="post"
									role="form" style="display: block;">
									<div class="form-group">
										<input class="register form-control required name" type="text"
											name="username" id="username" tabindex="1"
											placeholder="Username" value=""  required>
									</div>
									<div class="form-group">
										<input class="register form-control required password"
											type="password" name="password" id="password" tabindex="2"
											placeholder="Password" data-toggle="popover"
											data-trigger="manual"
											data-content="Wrong password"
											required>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="hidden" id="declear_login" name="state"
													value="login"> <input
													class="register form-control btn btn-login" type="button"
													name="login-submit" id="login-submit" tabindex="4"
													value="Log In">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													
												</div>
											</div>
										</div>
										<input type="hidden" id="declear_login" name="state" value="login"> <!-- identify login  -->
									</div>
								</form>
								<!-- Register form -->
								<!-- http://bootsnipp.com/snippets/66vx5 -->
								<form id="register-form" action="Homepage" method="post"
									role="form" style="display: none;">
									<div class="form-group">
										<input class="register form-control name" type="text"
											name="username" id="register_username" tabindex="1"
											data-toggle="popover" data-trigger="manual"
											data-content="Username invalid (6 characters)"
											placeholder="Username" required="true">
									</div>

									<div class="form-group">
										<input class="register form-control required email"
											type="text" name="useremail" id="register_useremail" data-toggle="popover"
											data-trigger="manual"
											data-content="Must be a valid e-mail address"
											tabindex="1" placeholder="Email Address" value="" required>
									</div>

									<div class="form-group">
										<input class="register form-control required password"
											type="password" name="password" id="password1"
											data-toggle="popover" data-trigger="manual"
											data-content="password invalid (6 characters)"
											tabindex="2" placeholder="Password" required>
									</div>
									<div class="form-group">
										<input class="register form-control required password"
											type="password" name="confirm-password" id="confirm-password"
											tabindex="2" data-toggle="popover" data-trigger="manual"
											data-content="unmatched password"
											placeholder="Confirm Password" required>
									</div>
									<div class="text-xs-center form-group" id="hidenChecker">
									<div class="g-recaptcha" data-sitekey="6Ld_nBUUAAAAAGvp8HxgDUtNjHj0xpIwnymRfUrs"></div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="hidden" id="declear_sign" name="state"
													value="signup"> <input
													class="register form-control btn btn-register"
													type="button" id="register-submit" tabindex="4"
													value="Register Now">
											</div>
										</div>
									</div>
									<input type="hidden" id="declear_sign" name="state" value="signup"> <!-- identify sign-up -->
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	$(document).ready(function() {		
		$('[data-toggle="popover"]').popover({
		    container: 'body'
		});		
	});
	</script>
</body>
</html>