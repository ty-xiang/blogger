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
	<title>PostArticle</title>
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
				<li><a href="Profile">Personal Profile</a></li>
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
	
	<div class="parallax" style="background-image: url(images/tree.jpg);"></div>
	<div style="min-height: 1000px;">
		<div class="row content">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<h1>${currentUser.username}</h1>
				<form action="PostArticle" method="post"
					enctype="multipart/form-data">
					<hr>

					<!-- Title  -->
					<div class="form-group">
						<label for="article_title">Title:</label> <input type="text"
							id="article_title" name="article_title" class="form-control"
							required value="${article.article_title}">
					</div>
					<br />

					<!-- Date choosen option -->
					<div class="form-group">
						<label for="date_option">Date Option:</label> <input type="date"
							id="date_option" name="date_option" class="form-control">
					</div>
					
					<!-- update the time and can be change by user individually -->
					<script type="text/javascript">
						document.getElementById("date_option").valueAsDate = new Date();
					</script>
					
					<!--Text  -->
					<div class="form-group">
						<label for="article_text">Text:</label>
						<textarea class="form-control" style="resize: none;"
							maxlength="65536" id="article_text" name="article_text" rows="30"
							required>${article.article_text}</textarea>
					</div>

					<input type="hidden" id="article_id" name="article_id"
						value="${article.article_id}"> <br> <br>

					<div class="form-group">
						<label for="pictures">You can upload several pictures</label> <input
							type="file" name="pictures" id="pictures"
							accept=".gif, .jpg, .png" class="btn btn-default btn-file"
							multiple><br> <label for="pictures">You can
							upload one audio or video</label> <input type="file" name="videoAndAudio"
							id="videoAndAudio" class="btn btn-default btn-file"
							accept=".mp3, .mp4, .ogg">
					</div>

					<!--Submit  identify which button should be display--> 

			<c:if test="${param.editarticle!= null}">
					
					<c:if test="${param.editarticle == 'edit'}">
					<input type="submit" name="post" id="edit" class="btn btn-info" value="edit">
					</c:if>
					<c:if test="${param.editarticle != 'edit'}">
					<input type="submit" name="post" id="post" class="btn btn-success" value="post">
					</c:if>
			</c:if>
			<c:if test="${param.editarticle== null}">
			<c:if test="${editarticle == 'edit'}">
					<input type="submit" name="post" id="edit" class="btn btn-info" value="edit">
					</c:if>
					<c:if test="${editarticle != 'edit'}">
					<input type="submit" name="post" id="post" class="btn btn-success" value="post">
					</c:if>
			</c:if>
					<input type="hidden" name="editarticle" value="${param.editarticle}">
					<%-- <input type="hidden" name="articleId" value="${article.article_id}"> --%>
				</form>
				<p>${message}</p>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>
	
	<div style="height:50px;"></div>
	
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