<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Self defined css, js file -->
<!-- <link rel="stylesheet" href="indexPage.css">  -->
<link rel="stylesheet" href="style.css">
<script src="interactive_js.js"></script>
<style>
.whiteFont {
	color: white;
}

.form-control {
	background-color: rgba(0, 0, 0, 0.2);
	color: white;
}

input[type="file"] {
	color: white;
}
</style>

<script>
	$(document).ready(function() {
		//when click button show default images, button disappear
		$('#default_img_button').click(function(e) {
			$("#defalt_img_div").css("visibility", "visible");
			$('#default_img_button').fadeOut(100);
			$('#default_img_button').removeClass('active');
			$(this).addClass('active');
			e.preventDefault();
		});

		//when click either one default image as icon, images div disappear, button shown
		$("img.profile_icon").click(function() {
			$('#default_img_button').delay(100).fadeIn(100);
			$("#defalt_img_div").css("visibility", "hidden");
			$('#defalt_img_div').removeClass('active');
			$('#default_img_button').addClass('active');

			var src = $(this).attr("src");
			$("#icon_image").attr("src", src);

			//Set the hidden input containing image path;
			$('input[name="iconLocSrc"]').val(src);

			e.preventDefault();

		})

	});
</script>
<title>Profile</title>
</head>
<body>
	<!-- 	<div>
		<table>
			<tr>
				<th><a href="Homepage">Home</a></th>
				<th><a href="Profile">Personal Profile</a></th>
				<th><a href="Register">Logout</a></th>
				log out remove session 
			</tr>
		</table>
	</div> -->

	<img class="full-screen" src="images/forest.jpg">
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Group04</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="Homepage">Home</a></li>
			<li><a href="Profile">Personal Profile</a></li>
			<li><a href="Register">LOGOUT</a></li>
			<li><a href="...">DELETE ACCOUNT</a></li>
		</ul>
	</div>
	</nav>

	<div class="container">
		<h1>Edit Profile</h1>
		<hr>
		<div class="row">
			<!-- left column -->


			<!-- edit form column -->
			<div class="col-md-9 personal-info">
				<h3>Personal info</h3>

				<form method="POST" action="Profile" class="form-horizontal"
					role="form" enctype="multipart/form-data">
					<div class="col-md-3">
						<div class="text-center">
							<img src="${largeIcon}" class="avatar img-circle"
								alt="avatar">
							<h6>Upload a different photo...</h6>
							<input type="file" class="form-control" name="uploadIcon">
							<p>${message}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label">Username:</label>
						<div class="col-lg-8">
							<input class="profile form-control" type="text" id="username1"
								name="username" placeholder="Your name goes here"
								value="${currentUser.username}"><input type="button"
								value="check username" onclick="check()" />
							<div id="checkuserdiv"></div>
						</div>


					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label">Password:</label>
						<div class="col-lg-8">
							<input type="password" class="profile form-control"
								id="password1" name="password"
								placeholder="Your password goes here"
								value="${currentUser.passwd}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label">Confirm password:</label>
						<div class="col-lg-8">
							<input type="password" class="profile form-control"
								id="password2" name="password"
								placeholder="Your password goes here"
								value="${currentUser.passwd}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label">Email:</label>
						<div class="col-lg-8">
							<input type="email" class="profile form-control" id="useremail"
								name="useremail" placeholder="Your E-mail goes here"
								value="${currentUser.useremail}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label">First name:</label>
						<div class="col-lg-8">
							<input type="text" class="profile form-control" id="fname"
								name="fname" placeholder="" value="${currentUser.fname}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label">Last name:</label>
						<div class="col-lg-8">
							<input type="text" class="profile form-control" id="lname"
								name="lname" placeholder="" value="${currentUser.lname}">
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-3 control-label">Birthday:</label>
						<div class="col-md-8">
							<input type="text" class="profile form-control" id="birthday"
								name="birthday" placeholder="" value="${currentUser.birthday}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">Education:</label>
						<div class="col-md-8">
							<input type="text" class="profile form-control" id="education"
								name="education" placeholder="" value="${currentUser.education}">
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-3 control-label"></label>
						<div class="col-md-8">
							<input type="submit" class="btn btn-success" name="action"
								value="save"> <input type="submit" name="action"
								id="delete" value="delete"> <span></span> <input
								type="reset" class="btn btn-default" value="Cancel">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<hr>



</body>
</html>