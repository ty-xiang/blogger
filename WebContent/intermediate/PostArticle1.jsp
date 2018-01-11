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
<title>PostArticle</title>
<style>
.parallax {
	/* The image used */
	background-image: url("images/b.jpg");
	/* Set a specific height */
	min-height: 500px;
	/* Create the parallax scrolling effect */
	background-attachment: fixed;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<script>
$('#post').on('click', function() {
    $(this).prop('disabled', true);
});
</script>

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
	<div class="parallax"></div>
	<div style="height: 1000px;">
		<div class="row content">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<h1>${currentUser.username}</h1>
				<form action="PostArticle" method="post"
					enctype="multipart/form-data">
					<!-- <input type="text" name="user_id" value="${currentUser.user_id}"/> 
							 <input type="text" name="username" value="${currentUser.username}"/>						
						-->
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
					<script type="text/javascript">
						document.getElementById("date_option").valueAsDate = new Date();
					</script>
					<!--Text  -->
					<div class="form-group">
						<label for="article_text">Text:</label>
						<!-- 
								<input type="text" id="article_text" name="article_text" value="${article.article_text}">
							 -->
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

					<!--Submit -->
					<%
						String ifEdit = request.getParameter("editarticle");
						if (ifEdit.equals("edit")) {
							out.print("<input type=\"submit\" name=\"post\" id=\"edit\" class=\"btn btn-info\" value=\"edit\">");
						} else {
							out.print("<input type=\"submit\" name=\"post\" id=\"post\" class=\"btn btn-success\" value=\"post\">");
						}
					%>
					<input type="hidden" name="articleId" value="${article.article_id}">
					<p>${message}</p>
				</form>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>


</body>
</html>


