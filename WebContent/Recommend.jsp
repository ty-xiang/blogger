<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="font-awesome-4.7.0\css\font-awesome.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="style.css" >
    <script src="interactive_js.js"></script>
	<title>Watch new</title>	
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
			<li class="active"><a href="Recommend">What's New??</a></li>
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
	
	<div style="min-height: 500px;">
			<div class="row content">
				<div class="row content">
					<div class="col-sm-2"></div>
					<div class="col-sm-8">
						<div style="height:10%" class="headerName">
							<p>Our community has achieved total records: </p>
							<p>${totalNum}</p>
						</div>
						<div class="row content">
							<ul class="pager">
								<c:if test="${not empty prepPage}">
									<li class="previous"><a href="Recommend?page=${prepPage}">Newer</a></li>
								</c:if>
								<c:if test="${not empty nextPage}">
									<li class="next"><a href="Recommend?page=${nextPage}">Older</a></li>
								</c:if>
							</ul>
						</div>		
						<div>
							<c:forEach items="${results}" var="result">
							<div class="row">
								<hr>
								<div class="col-sm-1">
									<img src="${result.icon}">
								</div>
								<div class="col-sm-11">
									<p><a href="Homepage?username=${result.username}">${result.username}</a></p>
									<p><a href="OpenArticle?article_id=${result.article_id}">${result.article_title}</a></p>
									<p>${result.postDate} ${result.postTime}</p>
									<p>${result.article_text}</p>
								</div>
							</div>
							</c:forEach>
						</div>
						<div class="row content">
							<ul class="pager">
								<c:if test="${not empty prepPage}">
									<li class="previous"><a href="Recommend?page=${prepPage}">Newer</a></li>
								</c:if>
								<c:if test="${not empty nextPage}">
									<li class="next"><a href="Recommend?page=${nextPage}">Older</a></li>
								</c:if>
							</ul>
						</div>		
					</div>
					<div class="col-sm-2"></div>
				</div>		
			</div>
			${currentPage}
			<input type="hidden" name="page" value="${currentPage}"></input>
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
