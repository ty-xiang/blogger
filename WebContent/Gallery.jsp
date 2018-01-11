<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="font-awesome-4.7.0\css\font-awesome.min.css">
	<link type="text/css" rel="stylesheet" href="style.css" />
	<script src="interactive_js.js"></script>
	<title>Gallery</title>
</head>
<body id="galleryBody">

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
					<li><a href="Profile">Personal Profile</a></li>
					<li class="active"><a href="Gallery">Gallery</a></li>
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


	<div style="min-height: 700px;">
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
					<h2 class="three-heading text-center">Audios</>
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

	<!-- Footer -->
	<footer class="cf" id="colophone">
		<div class="post-share no-items section" id="top-social-foot"></div>
		<div class="footer-logo-credit">
			<h1 class="footerName">Group04</h1>
			<br />
			<br />
			<div id="copyright">
			  Copyright © |  Designed and Developed By Group04
			</div>
			<div style="min-height:60px; width:100%;"></div>		
		</div>	
	</footer>
	
	<!-- Back to Top -->
	<a class="back-to-top" href="#top">
	<i class="fa fa-angle-up"></i>
	<div>Back <br>to top</div>
	</a>

</body>
</html>