<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="style.css">
	<script src="interactive_js.js"></script>
	<style>
		input {
			margin-bottom:10px;
		}
		
		.parallax {
			background-image: url("images/leaves.jpg");
			min-height: 350px;
		}
	</style>
<title>Profile</title>
</head>
<body>
	<!-- Navigation bar -->
	<nav class="navbar navbar-inverse" style="margin-bottom: 0px;">
	<div class="container-fluid">
		<div class="col-sm-5">
			<div class="navbar-header">
				<a class="navbar-brand" href="Homepage">Group04</a>
			</div>
			<ul class="nav navbar-nav">
			<li><a href="Recommend">What's New??</a></li>
				<li><a href="Homepage">Home</a></li>
				<li class="active"><a href="Profile">Personal Profile</a></li>
				<li><a href="Gallery">Gallery</a></li>
			</ul>
		</div>

		<div class="col-sm-3"></div>

		<div class="col-sm-3">
			<div class="input-group">
			  <input type="text" class="form-control" id="search" placeholder="Search for..." style="margin-top: 9px;">
			  <span class="input-group-btn" >
				<button class="btn btn-default" type="button" id="button_search" style="margin-top: 9px;">Go!</button>
			  </span>
			</div>				
		</div>
		
		<div class="col-sm-1">
			<ul class="nav navbar-nav">
				<li><a href="Register">LOGOUT</a></li>
			</ul>
		</div>
	</div>
	</nav>

	<!-- Profile -->
	<!-- Part one -->
	<div class="parallax"></div>

	<!-- Part Two -->
	<div class="container">
		<div style="height:50px"></div>
		<form action="Profile" method="post" enctype="multipart/form-data"
			role="form">
			<!-- left column -->
			<div class="col-md-3">
				<div class="text-center">
					<div id="thumbnail">
						<img id="icon_image" src="${largeIcon}" alt="default image">
					</div>
					<h6>Upload a different photo...</h6>
	
					<input type="file" style="display: none" id="upload-image"
						name="iconToUpload" accept=".gif, .jpg, .png"></input>
					<div id="upload" class="form-control">Upload File</div>
					
					<br />

					<!-- default images -->
					<button id="default_img_button" type="button"
						class="btn btn-default">Upload default images</button>

					<br />

					<div id="defalt_img_div" class="row" style="visibility: hidden">

						<div class="col-xs-6 col-md-3">
							<a href="#" class="thumbnail"> <img class="profile_icon"
								src="Icon/1-large.png" alt="avatar">
							</a>
						</div>

						<div class="col-xs-6 col-md-3">
							<a href="#" class="thumbnail"> <img class="profile_icon"
								src="Icon/2-large.png" alt="avatar">
							</a>
						</div>

						<div class="col-xs-6 col-md-3">
							<a href="#" class="thumbnail"> <img class="profile_icon"
								src="Icon/3-large.png" alt="avatar">
							</a>
						</div>

						<div class="col-xs-6 col-md-3">
							<a href="#" class="thumbnail"> <img class="profile_icon"
								src="Icon/4-large.png" alt="avatar">
							</a>
						</div>

					</div>
				</div>
			</div>
			
			 <div class="col-md-1"></div>

			<!-- edit form column -->
			<div class="col-md-8 personal-info">
				<h3 style="margin-bottom:30px;">Personal info</h3>
				<div class="form-group">
					<label class="col-lg-3 control-label">Username:</label>
					<div class="col-lg-8">
						<input class="profile form-control" type="text" id="username1"
							name="username" placeholder="Your name goes here"
							value="${currentUser.username}" readonly="readonly">
						<div id="checkuserdiv"></div>
					</div>


				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label">Password:</label>
					<div class="col-lg-8">
						<input type="password" class="profile form-control" id="password1"
							name="password" placeholder="Your password goes here"
							data-toggle="popover" data-trigger="manual"
											data-content="password invalid (6 characters)"
							value="${currentUser.passwd}" pattern=".{6,}" required>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label">Confirm password:</label>
					<div class="col-lg-8">
						<input type="password" class="profile form-control" id="password2"
							name="password2" placeholder="Your password goes here"
							tabindex="2" data-toggle="popover" data-trigger="manual"
											data-content="unmatched password"
							value="${currentUser.passwd}" required>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label">Email:</label>
					<div class="col-lg-8">
						<input type="text" class="profile form-control" id="useremail"
							name="useremail" placeholder="Your E-mail goes here"
							value="${currentUser.useremail}" data-placement="top"
							data-trigger="manual"
							data-content="Must be a valid e-mail address (user@gmail.com)"
							type="text" readonly="readonly">
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
						
						<input type="date" class="profile form-control" id="birthday"
							name="birthday"
							title="Please match the format  dd/mm/yyyy,dd-mm-yyyy or dd.mm.yyyy"
							placeholder="" value="${currentUser.birthday}">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 control-label">Education:</label>
					<div class="col-md-8">
						<select class="profile form-control" id="sel1" name="education" >
							<option selected="selected" hidden>${currentUser.education}</option>
							<option>1. Primary School</option>
							<option>2. Middle School</option>
							<option>3. Senior College</option>
							<option>4. Bachelor</option>
							<option>5. Master</option>
							<option>6. PhD</option>
						</select>
					</div>
				</div>
				<input type="hidden" name="iconLocSrc" value="true">

				<div class="form-group">
					<label class="col-md-3 control-label"></label>
					<div class="col-md-8">
						<input type="submit" class="btn btn-success" name="action"
							value="Save Changes" style="margin-top:20px;"> <span></span> <span></span> 
						<input type="submit" name="action" class="btn btn-danger"
							value="DELETE ACCOUNT" style="margin-top:20px;">
					</div>
				</div>
			</div>
		</form>
	</div>

	<div style="min-height: 200px;"></div>
	
	
	<script>
	$(document).ready(function() {		
		$('[data-toggle="popover"]').popover({
		    container: 'body'
		});	
		
		//when click button show default images, button disappear
		$('#default_img_button').click(function(e) {
			$("#defalt_img_div").css("visibility", "visible");
			$('#default_img_button').fadeOut(100);
			$('#default_img_button').removeClass('active');
			$(this).addClass('active');

		});

		//when click either one default image as icon, image divs disappear, button shown
		$("img.profile_icon").click(function() {
			$('#default_img_button').delay(100).fadeIn(100);
			$("#defalt_img_div").css("visibility", "hidden");
			$('#defalt_img_div').removeClass('active');
			$('#default_img_button').addClass('active');

			var src = $(this).attr("src");
			$("#icon_image").attr("src", src);

			//Set the hidden input containing image path;
			$('input[name="iconLocSrc"]').val(src);

			// If choosing default image, clear the existing images in the files;
			$("#upload-image").val("");
			
		})

		// icon image File Review	
		jQuery(function($) {
			var fileDiv = document.getElementById("upload");
			var fileInput = document.getElementById("upload-image");
			fileInput.addEventListener("change", function(e) {
				var files = this.files
				showThumbnail(files)
			}, false)

			fileDiv.addEventListener("click", function(e) {
				$(fileInput).show().focus().click().hide(); // production
				e.preventDefault();
			}, false)

			fileDiv.addEventListener("dragenter", function(e) {
				e.stopPropagation();
				e.preventDefault();
			}, false);

			fileDiv.addEventListener("dragover", function(e) {
				e.stopPropagation();
				e.preventDefault();
			}, false);

			fileDiv.addEventListener("drop", function(e) {
				e.stopPropagation();
				e.preventDefault();

				var dt = e.dataTransfer;
				var files = dt.files;

				showThumbnail(files)
			}, false);

			function showThumbnail(files) {
				for (var i = 0; i < files.length; i++) {
					var file = files[i]
					var imageType = /image.*/
					if (!file.type.match(imageType)) {
						console.log("Not an Image");
						continue;
					}

					var image = document.createElement("img");
					image.id = "icon_image";
					var thumbnail = document.getElementById("thumbnail");
					image.file = file;
					if (thumbnail.childNodes.length == 0) {
						thumbnail.appendChild(image);
					} else {
						$("#thumbnail").empty();
						thumbnail.appendChild(image);
					}

					var reader = new FileReader()
					reader.onload = (function(aImg) {
						return function(e) {
							aImg.src = e.target.result;
						};
					}(image))
					var ret = reader.readAsDataURL(file);
					var canvas = document.createElement("canvas");
					ctx = canvas.getContext("2d");
					image.onload = function() {
						ctx.drawImage(image, 10, 10)
					}
					$('input[name="iconLocSrc"]').val("false");
				}
			}
		});
	});
	</script>
	
</body>
</html>