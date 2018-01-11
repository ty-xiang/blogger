<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gallery</title>
<style>
.parallax {
	/* The image used */
	background-image: url("images/people.jpg");
	/* Set a specific height */
	min-height: 500px;
	/* Create the parallax scrolling effect */
	background-attachment: fixed;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

body {
	background-image: url("images/gallery-background.jpg");
	color: #D0D0D0;
}

h2 {
	font-family: Comic Sans MS;
}
</style>
</head>
<body>

	<!-- Navigation bar -->
	<nav class="navbar navbar-inverse" style="margin-bottom: 0px;">
	<div class="container-fluid">
		<div class="col-sm-4">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Group04</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="Homepage">Home</a></li>
				<li><a href="Profile">Personal Profile</a></li>
				<!-- <li><a href="Gallery"><input type="button" id="gallery" name="gallery" value="Gallery"/></a></li> -->
				<li><a href="Gallery">Gallery</a></li>
			</ul>
		</div>

		<div class="col-sm-4"></div>

		<div class="col-sm-3">
			
		</div>

		<div class="col-sm-1">
			<ul class="nav navbar-nav">
				<li><a href="Register">LOGOUT</a></li>
				<%-- log out remove session  --%>
			</ul>
		</div>
	</div>
	</nav>

	<!-- <div class="parallax"></div> -->

	<div style="height: 1500px;">
		<div class="row content">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<br>
				<h1>${currentUser.username}</h1>
				<c:if test="${not empty photoLinks}">
					<h2 class="three-heading text-center">Photos</h2>
					<hr>
					<div class="row">
						<c:forEach items="${photoLinks}" var="photolink">
							<div class="col-xs-6 col-md-4">
								<a href="${photolink}" class="thumbnail"> <img
									src="${photolink}" height="320" width="320" class="images" />
								</a>
							</div>
						</c:forEach>
					</div>
				</c:if>
				<br> <br>
				<c:if test="${not empty videoLinks}">
					<h2 class="three-heading text-center">Videos</h2>
					<hr>
					<div class="row">
						<c:forEach items="${videoLinks}" var="videolink">
							<div class="embed-responsive embed-responsive-4by3  center-block">
								<a href="${videolink}"> <video class="embed-responsive-item"
										controls> <source src="${videolink}" type="video/ogg">
									<source src="${videolink}" type="video/mp4"></video></a>
							</div>
							<br>
						</c:forEach>
					</div>
				</c:if>
				<br> <br>
				<c:if test="${not empty audioLinks}">
					<h2 class="three-heading text-center">Audios</h2>
					<hr>
					<div class="row">
						<c:forEach items="${audioLinks}" var="audiolink">
							<audio controls> <source src="${audiolink}"
								type="audio/ogg"> <source src="${audiolink}"
								type="audio/mpeg"></audio>
						</c:forEach>
					</div>
				</c:if>
			</div>
		</div>
	</div>








</body>
</html>