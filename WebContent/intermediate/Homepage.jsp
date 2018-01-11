<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Homepage</title>

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

		<div class="col-sm-2">
			<!--  <div class="dropdown">
    				<input class="dropdown-toggle form-control" type="text" name="search" id="search" placeholder="Search" data-toggle="dropdown" style="margin-top: 9px;">
    				<ul class="dropdown-menu" id="searchingPanel">
				      <li>Nothing found</li>
				    </ul>
			</div>  -->

			<input type="text" name="search" id="search" class="form-control"
				style="margin-top: 9px; padding-right: 30px;">


			<!-- <form action="Searching?sort=title&order=ASC" method="get">
			  <div class="input-group">
			    <input type="text" class="form-control" placeholder="Search" name="word">
			    <div class="input-group-btn">
			      <button class="btn btn-default" type="submit">
			        <i class="glyphicon glyphicon-search"></i>
			      </button>
			    </div>
			  </div>
			</form> -->
		</div>
		<div class="col-sm-1">
			<button class="btn btn-default" type="button"
				style="margin-left: -70px; margin-top: 12px;" id="button_search">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
			</button>
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
					<h1>${currentArticlesUsername}'s homepage</h1>
					<!-- <a href="PostArticle"><input type="button" id="create" name="create" value="Post"/></a>
					<a href="Gallery"><input type="button" id="gallery" name="gallery" value="Gallery"/></a> -->

					<br />
				</div>

				<div class="col-sm-8">
					<!-- articles -->
					<div class="row">
						<div class="col-sm-2">
							<h2 style="display: inline">Articles</h2>
						</div>
						<div class="col-sm-4">
							<!-- <a href="Homepage?sort=title"><button type="button" class="btn btn-info">Title</button></a>
							<a href="Homepage?sort=time"><button type="button" class="btn btn-info">Time</button></a> -->
						</div>
						<div class="col-sm-4"></div>
						<div class="col-sm-2">
							<a href="PostArticle?editarticle=post"><button type="button"
									class="btn btn-info">Post New</button></a>
						</div>
					</div>
					<hr>
					<c:forEach items="${currentPersonArticles}" var="article">

						<div class="panel panel-default">
							<div class="panel-heading">
								<span class="glyphicon glyphicon-heart"
									name="${article.article_id}" aria-hidden="true"></span><span>
									${article.likes}</span> <a
									href="OpenArticle?article_id=${article.article_id}"><span><h2 class="panel-title" style="display: inline;">${article.article_title}</h2></span></a>
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
				<!-- space -->

				<div class="col-sm-3">
					<!-- all users -->
					<h3>Community</h3>
					<hr>
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
			<div class="col-sm-2"></div>
		</div>
	</div>


	<script type="text/javascript">
		$("#button_search").click(
				function() {
					var word = $('#search').val().trim().toLowerCase();
					if (word == "") {
						console.log("null");
						return;
					}
					window.location
							.assign("Searching?sort=title&order=ASC&word="
									+ word);
				});

		//$( "#search" ).keyup(function() {
		//    search();
		//});
		/* function search() {
			$("#searchingPanel").html("");
			var word = $('#search').val().trim().toLowerCase();
			var num = 0;

			if (word == "") {
				console.log("null");
				return;
			}
			console.log("search");
			$.ajax({
				type : "POST",
				url : "Searching",
				data : "word=" + word,
				success : function(responseJson) {

					var $li = $("<li>").appendTo($("#searchingPanel"));
					$.each(responseJson, function(index, item) { // Iterate over the JSON array.
						$("<li>").html(item).appendTo($li);
						//console.log(index);
					});
				}
			});
		} */

		$(".glyphicon-heart").click(function() {
			var article_id = $(this).attr("name");
			var object = $(this);
			console.log(article_id);
			$.ajax({
				type : "POST",
				url : "Likes",
				data : "article_id=" + article_id,
				success : function(response) {
					//console.log(response);
					object.next().text(" " + response);
				}
			});
		});

		$('.articles').each(function() {
			var length = $(this).text().length;
			if (length > 400) {
				var article = $(this).text().substring(0, 400);
				$(this).text(article);
			}

			//console.log(article);
		})
	</script>
</body>
</html>
