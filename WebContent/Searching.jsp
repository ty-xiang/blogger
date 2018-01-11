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
	<title>Searching</title>
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
	
	<div class="parallax" style="background-image: url(images/leaves.jpg);"></div>
	<div style="height: 1000px;">
		<div class="row content">
			<div class="col-sm-2"></div>		
			<div class="col-sm-8">
				<div style="min-height: 50px;"></div>
				<div class="col-sm-8">   <!-- articles -->
					<h2>Searching Result</h2>
					<br />
					<br />
					<c:if test="${size==0}">
						<h2>Your search- ${word} - did not match any articles</h2>
					</c:if>
					
					<c:if test="${size>0}">
					<table class="table table-striped">
						<thead>
					      <tr>   
					        <th class="text-center">
					        	<a href="Searching?word=${word}&sort=title&order=${printorder}"><button type="button" class="btn btn-info">Article
					        	<span class="${titleicon}" aria-hidden="true"></span></button></a>	
					        </th>
					        <th class="text-center">
					        	<a href="Searching?word=${word}&sort=author&order=${printorder}"><button type="button" class="btn btn-info">Author
					        	<span class="${usericon}" aria-hidden="true"></span></button></a> 	
					        </th>
					        <th class="text-center">
					        	<a href="Searching?word=${word}&sort=date&order=${printorder}"><button type="button" class="btn btn-info">Post Time
					        	<span class="${dateicon}" aria-hidden="true"></span></button></a> 	
					        </th>
					      </tr>
					    </thead>
					    <tbody>
					      <c:forEach items="${searchingArticles}" var="article">
					      <tr>
					        <td class="text-center"><a href="OpenArticle?article_id=${article.article_id}"><span>${article.article_title}</span></a></td>
					        <td class="text-center">${article.author}</td>
					        <td class="text-center">${article.postDate} ${article.postTime}</td>
					      </tr>
					      </c:forEach>
					    </tbody>
					  </table>
					  </c:if>
				</div>
				
				<div class="col-sm-1"></div>  <!-- space -->
				<div class="col-sm-3"></div>  <!-- all users -->
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