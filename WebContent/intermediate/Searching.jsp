<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
       <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<title>Searching</title>
	
	<style>
		.parallax {
			/* The image used */
			background-image: url("images/people.jpg");
			/* Set a specific height */
			min-height: 200px;
			/* Create the parallax scrolling effect */
			background-attachment: fixed;
			background-position: center;
			background-repeat: no-repeat;
			background-size: cover;
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
			<li><a href="Gallery">Gallery</a></li>
		</ul>
	</div>

	<div class="col-sm-4"></div>
	
	<div class="col-sm-3">
		 
	<!-- 	<input type="text" name="search" id="search" class="form-control"
				style="margin-top: 9px; padding-right: 30px;">
			
	
			<button class="btn btn-default" type="button"
				style="margin-left: -70px; margin-top: 12px;" id="button_search">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
			</button>   -->
			
			 <div class="input-group">
		      <input type="text" class="form-control" id="search" placeholder="Search for..." style="margin-top: 9px;">
		      <span class="input-group-btn" >
		        <button class="btn btn-default" type="button" id="button_search" style="margin-top: 9px;">Go!</button>
		      </span>
		    </div><!-- /input-group -->
			
	</div>
	
	<div class="col-sm-1">		
		<ul class="nav navbar-nav">
			<li><a href="Register">LOGOUT</a></li>
			<%-- log out remove session  --%>
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
					<!-- <a href="PostArticle"><input type="button" id="create" name="create" value="Post"/></a>
					<a href="Gallery"><input type="button" id="gallery" name="gallery" value="Gallery"/></a> -->
					
					<br />
				</div>
				
				<div class="col-sm-8">   <!-- articles -->
					<h2>Searching Result</h2>
					<hr>
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
						
				</div>
				
				<div class="col-sm-1"></div>  <!-- space -->
				
				<div class="col-sm-3">   <!-- all users -->
					<%-- <h3>Community</h3>
					<hr>
					<table class="table table-striped">
						<tbody>
						<c:forEach items="${allUsers}" var="user">
							      <tr>
							        <td class="text-center"><a href="Homepage?username=${user.username}"><img src="${user.iconPath}"></a></td>
							        <td ><a href="Homepage?username=${user.username}"><p>${user.username}</p></a></td>
							      </tr>
					</c:forEach>
					</tbody>
					</table> --%>
				</div>
			</div>
			<div class="col-sm-2"></div>
		</div>
</div>
<script type="text/javascript">
$( "#button_search" ).click(function(){
	var word = $( "#search" ).val();
	window.location.assign("Searching?sort=title&order=ASC&word="+word);
});
</script>
</body>
</html>