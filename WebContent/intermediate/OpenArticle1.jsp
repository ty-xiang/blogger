<%--http://www.w3schools.com/bootstrap/bootstrap_modal.asp --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<title>OpenArticle</title>
		
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
		
		
		.gallery {
			overflow: auto;		
		    max-height: 500px;
		    background-color:black;
		    border-color:grey;
		}	
		.gallery img {
		    max-width: 100%;
		    max-height: 100%;
		}
		
							
						
		</style>
</head>
<body>

	<!-- Navigation bar -->
	<nav class="navbar navbar-inverse" style="margin-bottom: 0px;">
	<div class="container-fluid">
		<div class="col-sm-3">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Group04</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="Homepage">Home</a></li>
				<li><a href="Profile">Personal Profile</a></li>
				<li><a href="Gallery">Gallery</a></li>
			</ul>
		</div>

		<div class="col-sm-8"></div>

		<div class="col-sm-1">
			<ul class="nav navbar-nav">
				<li><a href="Register">LOGOUT</a></li>
				<%-- log out remove session  --%>
			</ul>
		</div>
	</div>
	</nav>

	

	<!-- Article -->
	<div class="parallax"></div>

	<div style="height: 1000px;">
		<div class="row content">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<br>
				<div class="row"> 
					<div>
						<h1 style="font-size: 55px">${article.article_title}</h1>
						<h4>Author: ${article.author}</h4>
						<p>${article.postDate}</p>
					</div>
				</div>
				<div class="row"> 
					<div class="col-sm-6">
						<p style="background-color: white;border-color: white;font-size:15px;">${article.article_text}</p>

						<div style="min-height: 100px;"></div>
					</div>
					<div class="col-sm-2"></div>
					<div class="col-sm-4">
					
					
					<!-- <video width="360" height="360" controls> 
					<source src="Edmund-Hillary-Climbs-Everest.mp4" type="video/mp4"></video> -->
					
					
						<!-- audio/video put here -->
					<c:choose>
						<c:when test="${not empty latestAudioLink}">
							
								<audio controls> <source src="${latestAudioLink}"
									type="audio/ogg"> <source src="${latestAudioLink}"
									type="audio/mpeg"></audio>
								<br>
								<br>
							
						</c:when>
						<c:when test="${not empty latestVideoLink}">
								<video width="320" height="320" controls> <source
									src="${latestVideoLink}" type="video/ogg"> <source
									src="${latestVideoLink}" type="video/mp4"></video>
								<br>
								<br>
						</c:when>
					</c:choose>	
						
						<!-- images put here -->
						<fieldset>
							<div class="gallery">
								<c:forEach items="${photoLinks}" var="photolink">
									<%-- <img src="${photolink}" height="320" width="320" /> --%>
									<img src="${photolink}"/>
								</c:forEach>
							</div>
						</fieldset>
						
					</div>
				</div>
				<br>		
				<hr>
				<div class="row">
					<c:if test="${article.user_id==currentUser.user_id}">
						<a
							href="PostArticle?editarticle=edit&article_id=${article.article_id}">
							<input type="button" id="editarticle" value="edit article" class="btn btn-info">
							<!-- <button type="button" id="editarticle" name="delete" class="btn btn-info">Edit Article</button> -->
						</a>
						<form action="OpenArticle" method="GET" style="display:inline;">
							<input type="hidden" id="articleIdDelete" name="article_id" value="${article.article_id}"> 
							<input type="submit" id="delete" name="delete" value="Delete Article" class="btn btn-danger"/>
							<!-- <button type="button" id="delete" name="delete" class="btn btn-danger">Delete Article</button> -->
						</form>
					</c:if>
				</div>				
				<br>
				
				
				
				<!-- Add Comment -->
				<div class="row">
					<form action="OpenArticle" method="POST">
						<fieldset>
							<input type="hidden" id="article_id" name="article_id" value="${article.article_id}">
							<div class="form-group col-sm-10">
								<textarea class="form-control" style="resize: none;" maxlength="140" placeholder="Maximum 140 letters..."
								 id="comment_text" name="comment_text" rows="5"></textarea>
							</div>
							<div class="form-group col-sm-2"></div>
							<input type="submit" id="submit" name="submit" class="btn btn-primary" value="post">
						</fieldset>
					</form>
					<div style="min-height: 100px;"></div>
				</div>
				
				
				
				<!-- Comment Lists -->
				<div class="row">
					<fieldset>
						<legend>
							<h1>Comments</h1>
						</legend>
						<br>
						<c:forEach items="${currentArticleComments}" var="comment">
							<div class="comment well">
								<img src="${comment.iconPath}"  class="rounded-circle">
								${comment.author}
								<p id="${comment.comment_id}">comment: ${comment.comment_text}</p>
								<p>${comment.comment_postDate}---${comment.comment_postTime}</p>
								
								
								<c:if test="${comment.user_id==currentUser.user_id}">
								
								
								
									<form action="OpenArticle" method="POST" style="display:inline;">
										<input type="hidden" id="articleIdforcomment" name="article_id" value="${article.article_id}"> 
										<input type="hidden" id="commentID" name="comment_id" value="${comment.comment_id}">
										<input type="hidden" id="commentText" name="comment_text" value="newcomment"> 
										
										<!-- <input type="submit" id="editcommentID" name="editcomment" value="edit"> -->
										<button type="button" class="btn btn-info editbtn" data-toggle="modal" data-target="#myModal${comment.comment_id}">Edit</button>
										<div class="modal fade" id="myModal${comment.comment_id}" role="dialog">
										    <div class="modal-dialog">
										      <!-- Modal content-->
										      <div class="modal-content">
										          <div class="modal-header">
										            <button type="button" class="close" data-dismiss="modal">&times;</button>
										            <h4 class="modal-title">Edit Comment</h4>
										          </div>
										
										          <div class="modal-body">
										            <textarea name="editedComment" class="form-control" rows="4" cols="50" style="resize: none;">${comment.comment_text}</textarea>
										          </div>
										
										          <div class="modal-footer">
										          	<input type="submit" id="editcommentID" name="editcomment" value="edit"  class="btn btn-info"> 
										            <!-- <button type="button" class="btn btn-default" data-dismiss="modal">save</button> -->
										          </div>
										      </div>
										   </div>  
										 </div>
										
									</form>
									</c:if>
									
									<!-- delete comments -->
									<c:if test="${comment.user_id==currentUser.user_id||article.user_id==currentUser.user_id}">
									<form action="OpenArticle" method="GET" style="display:inline;">
										<input type="hidden" id="articleIdDeleteforcomment" name="article_id" value="${article.article_id}"> 
										<input type="hidden" id="commentID" name="comment_id" value="${comment.comment_id}"> 
										<input type="submit" id="delete" name="delete" value="deletecomment" class="btn btn-danger" />
									</form>
								</c:if>
							</div>
						</c:forEach>
					</fieldset>
				</div>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>

	<!--  
	<h2>${article.article_title}</h2>
	<h3>Author: ${currentUser.fname}  ${currentUser.lname}</h3>
	<h3>Username: ${currentUser.username}</h3>
	<br>
	<hr>
	<p>${article.article_text}</p>
	<br>
	
	

	
	<fieldset>
		<legend>Comment</legend>
		<c:forEach items="${currentArticleComments}" var="comment">
			<p>user_id: ${comment.user_id}</p>
			<p>comment: ${comment.comment_text}</p>
			<p>${comment.comment_postDate}---${comment.comment_postTime}</p>
		</c:forEach>
	</fieldset>
	
	<form action="OpenArticle" method="POST">
	<fieldset>
		<input type="hidden" id="article_id" name="article_id" value="${article.article_id}">
		<input type="text" id="comment_text" name="comment_text">
		<input type="submit" id="submit" name="submit" value="post">
	</fieldset>
	</form>
	
	-->

	
	<!--  -->
	<script>
		// for each button with "editbtn", assign this action;
		$(".editbtn").click(function(){
			//console.log($(this).attr("data-target").replace("#myModal", ""));
			var getValue = $(this).attr("data-target").replace("#myModal", ""); // getting comment id;
			var curComment = $("p#" + getValue).text(); // extract the targetting comment body;
			$("textarea#" + getValue + ".editingComment").val(curComment);
		})
	
		
	</script>


</body>
</html>