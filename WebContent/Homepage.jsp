<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="font-awesome-4.7.0\css\font-awesome.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link type="text/css" rel="stylesheet" href="style.css" />
	<script src="interactive_js.js"></script>
	<title>Homepage</title>
</head>
<body style="margin:0px;">
		
	<!-- Navigation bar -->
	<nav class="navbar navbar-inverse" style="margin-bottom: 0px;">
		<div class="container-fluid">
			<div class="col-sm-5">
				<div class="navbar-header">
					<a class="navbar-brand" href="Homepage">Group04</a>
				</div>
				<ul class="nav navbar-nav">
				<li><a href="Recommend">What's New??</a></li>
					<li class="active"><a href="Homepage">Home</a></li>
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


	<div class="parallax"></div>
	<div style="height: 1000px;">
		<div class="row content">
			<div class="col-sm-2"></div>

			<div class="col-sm-8">
				<div>
					<h1>${currentArticlesUsername}'s homepage</h1>
					<br />
				</div>

				<div class="col-sm-8">
					<!-- articles -->
					<div class="row">
						<div class="col-sm-2">
							<h2 style="display: inline">Articles</h2>
						</div>
						<div class="col-sm-4">
							
						</div>
						<div class="col-sm-4"></div>
						<div class="col-sm-2">
							<a href="PostArticle?editarticle=post"><button type="button"class="btn btn-info">Post New</button></a>
						</div>
					</div>
					<hr>
					<c:forEach items="${currentPersonArticles}" var="article">

						<div class="panel panel-default">
							<div class="panel-heading">
								<span class="glyphicon glyphicon-heart" name="${article.article_id}" aria-hidden="true"></span>
									<span>${article.likes}</span> 
									<a href="OpenArticle?article_id=${article.article_id}"><span><h2 class="panel-title" style="display: inline;">${article.article_title}</h2></span></a>
							</div>
							<div class="panel-body">
								<h5>
									<span class="glyphicon glyphicon-time"></span> Post by
									${article.author}, ${article.postDate}.
								</h5>
								<p class="articles">${article.article_text}</p>
							</div>
						</div>
					</c:forEach>
				</div>

				<div class="col-sm-1"></div>
				
				<!-- Community: all users -->
				<div class="col-sm-3">
					<h3>Community</h3>
					<br />
						<div class="gallery" style="background-color:white;">
							<table class="table table-striped">
								<tbody>
									<c:forEach items="${allUsers}" var="user">
										<tr>
											<td class="text-center"><a
												href="Homepage?username=${user.username}"><img
													src="${user.iconPath}"></a></td>
											<td><a href="Homepage?username=${user.username}"><p>${user.username}</p></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
				</div>
			</div>
			<div class="col-sm-2"></div>
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
