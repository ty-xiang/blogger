<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="interactive_js.js"></script>
	<link rel="stylesheet" href="font-awesome-4.7.0\css\font-awesome.min.css">
	<link type="text/css" rel="stylesheet" href="style.css" />		
	<script src="interactive_js.js"></script>
	<title>OpenArticle</title>
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

	
	<!-- Article -->
	<div class="parallax" style="background-image: url(images/dancer.jpg);"></div>

	<div style="min-height: 800px;">
		<div class="row content">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<br>
				<div class="row"> 
					<div>
						<h1 style="font-size: 55px">${article.article_title}</h1>
						<br />
						<h4><em>Author: ${article.author}</em></h4>
						<p>${article.postDate}</p>
						<br />
						<br />
					</div>
				</div>
				<div class="row"> 
					<div class="col-sm-6">
						<p style="background-color: white;border-color: white;font-size:15px;">${article.article_text}</p>
						<div style="min-height: 100px;"></div>
					</div>
					<div class="col-sm-2"></div>
					<div class="col-sm-4">
						
						<!-- audio/video put here -->
						<c:choose>
							<c:when test="${not empty latestVideoLink}">
									<video width="320" height="320" controls> <source
										src="${latestVideoLink}" type="video/ogg"> <source
										src="${latestVideoLink}" type="video/mp4"></video>
									<br>
									<br>
							</c:when>
							<c:when test="${not empty latestAudioLink}">
									<audio controls> <source src="${latestAudioLink}"
										type="audio/ogg"> <source src="${latestAudioLink}"
										type="audio/mpeg"></audio>
									<br>
									<br>
							</c:when>
						</c:choose>	
							
						<!-- images put here -->
						<fieldset>
							<div class="gallery">
								<c:forEach items="${photoLinks}" var="photolink">
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
							<input type="button" id="editarticle" value="Edit Article" class="btn btn-info">
						</a>
						<form action="OpenArticle" method="GET" style="display:inline;">
							<input type="hidden" id="articleIdDelete" name="article_id" value="${article.article_id}"> 
							<input type="submit" id="delete" name="delete" value="Delete Article" class="btn btn-danger"/>
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
							<input type="submit" id="submit" name="submit" class="btn btn-primary" value="Post Comment">
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
								
								<!-- edit comments : users who post comment that can edit their own comments while the author of article can not edit others' comments -->
								<c:if test="${comment.user_id==currentUser.user_id}">
									<form action="OpenArticle" method="POST" style="display:inline;">
										<input type="hidden" id="articleIdforcomment" name="article_id" value="${article.article_id}"> 
										<input type="hidden" id="commentID" name="comment_id" value="${comment.comment_id}">
										<input type="hidden" id="commentText" name="comment_text" value="newcomment"> 
										
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
										          </div>
										      </div>
										   </div>  
										 </div>
										
									</form>
								</c:if>
									
								<!-- delete comments : users who post comment can delete it by themselves plus author of the artcile can delete all comments in article -->
								<c:if test="${comment.user_id==currentUser.user_id||article.user_id==currentUser.user_id}">
								<form action="OpenArticle" method="GET" style="display:inline;">
									<input type="hidden" id="articleIdDeleteforcomment" name="article_id" value="${article.article_id}"> 
									<input type="hidden" id="commentID" name="comment_id" value="${comment.comment_id}"> 
									<input type="submit" id="delete" name="delete" value="Delete" class="btn btn-danger" />
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

	<div style="min-height: 100px;"></div>
	
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